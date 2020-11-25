{-# language CPP #-}
-- No documentation found for Chapter "ImageTiling"
module Vulkan.Core10.Enums.ImageTiling  (ImageTiling( IMAGE_TILING_OPTIMAL
                                                    , IMAGE_TILING_LINEAR
                                                    , IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT
                                                    , ..
                                                    )) where

import Data.Foldable (asum)
import GHC.Base ((<$))
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Text.ParserCombinators.ReadP (skipSpaces)
import Text.ParserCombinators.ReadP (string)
import Text.ParserCombinators.ReadPrec ((+++))
import qualified Text.ParserCombinators.ReadPrec (lift)
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Foreign.Storable (Storable)
import Data.Int (Int32)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Vulkan.Zero (Zero)
-- | VkImageTiling - Specifies the tiling arrangement of data in an image
--
-- = See Also
--
-- 'Vulkan.Core10.Image.ImageCreateInfo',
-- 'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceImageFormatInfo2',
-- 'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceSparseImageFormatInfo2',
-- 'Vulkan.Extensions.VK_NV_external_memory_capabilities.getPhysicalDeviceExternalImageFormatPropertiesNV',
-- 'Vulkan.Core10.DeviceInitialization.getPhysicalDeviceImageFormatProperties',
-- 'Vulkan.Core10.SparseResourceMemoryManagement.getPhysicalDeviceSparseImageFormatProperties'
newtype ImageTiling = ImageTiling Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'IMAGE_TILING_OPTIMAL' specifies optimal tiling (texels are laid out in
-- an implementation-dependent arrangement, for more optimal memory
-- access).
pattern IMAGE_TILING_OPTIMAL                 = ImageTiling 0
-- | 'IMAGE_TILING_LINEAR' specifies linear tiling (texels are laid out in
-- memory in row-major order, possibly with some padding on each row).
pattern IMAGE_TILING_LINEAR                  = ImageTiling 1
-- | 'IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT' indicates that the image’s tiling
-- is defined by a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#glossary-drm-format-modifier Linux DRM format modifier>.
-- The modifier is specified at image creation with
-- 'Vulkan.Extensions.VK_EXT_image_drm_format_modifier.ImageDrmFormatModifierListCreateInfoEXT'
-- or
-- 'Vulkan.Extensions.VK_EXT_image_drm_format_modifier.ImageDrmFormatModifierExplicitCreateInfoEXT',
-- and /can/ be queried with
-- 'Vulkan.Extensions.VK_EXT_image_drm_format_modifier.getImageDrmFormatModifierPropertiesEXT'.
pattern IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT = ImageTiling 1000158000
{-# complete IMAGE_TILING_OPTIMAL,
             IMAGE_TILING_LINEAR,
             IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT :: ImageTiling #-}

conNameImageTiling :: String
conNameImageTiling = "ImageTiling"

enumPrefixImageTiling :: String
enumPrefixImageTiling = "IMAGE_TILING_"

showTableImageTiling :: [(ImageTiling, String)]
showTableImageTiling =
  [ (IMAGE_TILING_OPTIMAL                , "OPTIMAL")
  , (IMAGE_TILING_LINEAR                 , "LINEAR")
  , (IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT, "DRM_FORMAT_MODIFIER_EXT")
  ]

instance Show ImageTiling where
  showsPrec p e = case lookup e showTableImageTiling of
    Just s -> showString enumPrefixImageTiling . showString s
    Nothing ->
      let ImageTiling x = e in showParen (p >= 11) (showString conNameImageTiling . showString " " . showsPrec 11 x)

instance Read ImageTiling where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixImageTiling
          asum ((\(e, s) -> e <$ string s) <$> showTableImageTiling)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameImageTiling)
            v <- step readPrec
            pure (ImageTiling v)
          )
    )

