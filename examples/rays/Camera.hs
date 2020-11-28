{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE NoStrict #-} -- https://github.com/fpco/th-utilities/issues/13

module Camera where

import           Control.Lens
import           Foreign.Storable
import           Linear
import           TH.Derive

data Camera = Camera
  { camPosition    :: V3 Float
  , camOrientation :: Quaternion Float
  , camAspect      :: Float
  , camFOV         :: Float
    -- ^ Vertical field of view in Radians
  }

data CameraMatrices = CameraMatrices
  { cmViewInverse :: M44 Float
  , cmProjInverse :: M44 Float
  }

$($(derive [d|
  instance Deriving (Storable CameraMatrices)
  |]))

initialCamera :: Camera
initialCamera = Camera (V3 0 0 (-10)) (axisAngle (V3 0 0 1) 0) (16 / 9) 1.57

-- >>> viewMatrix initialCamera
-- V4 (V4 1.0 0.0 0.0 0.0) (V4 0.0 1.0 0.0 0.0) (V4 0.0 0.0 1.0 10.0) (V4 0.0 0.0 0.0 1.0)
viewMatrix :: Camera -> M44 Float
viewMatrix Camera {..} = inv44 $ mkTransformation camOrientation camPosition

-- >>> projectionMatrix initialCamera
-- V4 (V4 0.3611771 0.0 0.0 0.0) (V4 0.0 0.6420926 0.0 0.0) (V4 0.0 0.0 0.0 0.1) (V4 0.0 0.0 1.0 0.0)
--
-- >>> tan (1.5 / 2)
-- 0.9315964599440725
projectionMatrix :: Camera -> M44 Float
projectionMatrix Camera {..} =
  let tanFoV = tan (camFOV / 2)
      left   = -tanFoV * camAspect
      right  = tanFoV * camAspect
      top    = -tanFoV
      bottom = tanFoV
      dx     = 1.0 / (right - left)
      dy     = 1.0 / (bottom - top)
      zNear  = 0.1
  in  V4 (V4 (2 * dx) 0 0 0) (V4 0 (2 * dy) 0 0) (V4 0 0 0 zNear) (V4 0 0 1 0)

-- >>> projectRay initialCamera (V2 0 0)
-- (V3 0.0 0.0 (-10.0),V3 0.0 0.0 1.0)
--
-- >>> projectRay initialCamera (V2 0 1)
-- (V3 0.0 0.0 (-10.0),V3 0.0 0.7068252 0.70738816)
--
-- >>> projectRay initialCamera (V2 1 0)
-- (V3 0.0 0.0 (-10.0),V3 0.87140864 0.0 0.4905578)
projectRay
  :: Camera
  -> V2 Float
  -- ^ Ray position on screen in [-1..1]^2
  -> (V3 Float, V3 Float)
  -- ^ Origin, Direction
projectRay c scr2 =
  let viewInverse       = inv44 $ viewMatrix c
      projInverse       = inv44 $ projectionMatrix c
      origin            = (viewInverse !* point (V3 0 0 0)) ^. _xyz
      targetScreenSpace = V4 (scr2 ^. _x) (scr2 ^. _y) 1 1
      target            = projInverse !* targetScreenSpace
      dir = normalize ((viewInverse !* vector (target ^. _xyz)) ^. _xyz)
  in  (origin, dir)

-- >>> projectToScreen initialCamera (V3 0 0 0)
-- V3 0.0 0.0 1.0000001e-2
--
-- >>> projectToScreen initialCamera (V3 0 0 (-10))
-- V3 NaN NaN Infinity
--
-- >>> projectToScreen initialCamera (V3 0 0 (-9.9))
-- V3 0.0 0.0 0.9999962
--
-- >>> projectToScreen initialCamera (V3 0 0 1000)
-- V3 0.0 0.0 9.900991e-5
projectToScreen :: Camera -> V3 Float -> V3 Float
projectToScreen c =
  normalizePoint . (projectionMatrix c !*) . (viewMatrix c !*) . point
