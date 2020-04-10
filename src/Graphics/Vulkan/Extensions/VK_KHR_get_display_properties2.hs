{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_KHR_get_display_properties2  ( getPhysicalDeviceDisplayProperties2KHR
                                                                  , getPhysicalDeviceDisplayPlaneProperties2KHR
                                                                  , getDisplayModeProperties2KHR
                                                                  , getDisplayPlaneCapabilities2KHR
                                                                  , DisplayProperties2KHR(..)
                                                                  , DisplayPlaneProperties2KHR(..)
                                                                  , DisplayModeProperties2KHR(..)
                                                                  , DisplayPlaneInfo2KHR(..)
                                                                  , DisplayPlaneCapabilities2KHR(..)
                                                                  , KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION
                                                                  , pattern KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION
                                                                  , KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME
                                                                  , pattern KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME
                                                                  , DisplayKHR(..)
                                                                  , DisplayModeKHR(..)
                                                                  , DisplayPropertiesKHR(..)
                                                                  , DisplayPlanePropertiesKHR(..)
                                                                  , DisplayModeParametersKHR(..)
                                                                  , DisplayModePropertiesKHR(..)
                                                                  , DisplayPlaneCapabilitiesKHR(..)
                                                                  , DisplayPlaneAlphaFlagBitsKHR(..)
                                                                  , DisplayPlaneAlphaFlagsKHR
                                                                  , SurfaceTransformFlagBitsKHR(..)
                                                                  , SurfaceTransformFlagsKHR
                                                                  ) where

import Control.Exception.Base (bracket)
import Control.Monad.IO.Class (liftIO)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import Control.Monad.IO.Class (MonadIO)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Extensions.Handles (DisplayKHR)
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
import Graphics.Vulkan.Extensions.Handles (DisplayModeKHR)
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayModePropertiesKHR)
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlaneCapabilitiesKHR)
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlanePropertiesKHR)
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPropertiesKHR)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetDisplayModeProperties2KHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetDisplayPlaneCapabilities2KHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceDisplayPlaneProperties2KHR))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceDisplayProperties2KHR))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice(..))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice_T)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.Handles (DisplayKHR(..))
import Graphics.Vulkan.Extensions.Handles (DisplayModeKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayModeParametersKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayModePropertiesKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlaneAlphaFlagBitsKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlaneAlphaFlagsKHR)
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlaneCapabilitiesKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPlanePropertiesKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (DisplayPropertiesKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (SurfaceTransformFlagBitsKHR(..))
import Graphics.Vulkan.Extensions.VK_KHR_display (SurfaceTransformFlagsKHR)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceDisplayProperties2KHR
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayProperties2KHR -> IO Result) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayProperties2KHR -> IO Result

-- | vkGetPhysicalDeviceDisplayProperties2KHR - Query information about the
-- available displays
--
-- = Parameters
--
-- -   @physicalDevice@ is a physical device.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display devices available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayProperties2KHR' structures.
--
-- = Description
--
-- 'getPhysicalDeviceDisplayProperties2KHR' behaves similarly to
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.getPhysicalDeviceDisplayPropertiesKHR',
-- with the ability to return extended information via chained output
-- structures.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayProperties2KHR' structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'DisplayProperties2KHR', 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceDisplayProperties2KHR :: forall io . MonadIO io => PhysicalDevice -> io (Result, ("properties" ::: Vector DisplayProperties2KHR))
getPhysicalDeviceDisplayProperties2KHR physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceDisplayProperties2KHR' = mkVkGetPhysicalDeviceDisplayProperties2KHR (pVkGetPhysicalDeviceDisplayProperties2KHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetPhysicalDeviceDisplayProperties2KHR' physicalDevice' (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayProperties2KHR ((fromIntegral (pPropertyCount)) * 64)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 64) :: Ptr DisplayProperties2KHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetPhysicalDeviceDisplayProperties2KHR' physicalDevice' (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayProperties2KHR (((pPProperties) `advancePtrBytes` (64 * (i)) :: Ptr DisplayProperties2KHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceDisplayPlaneProperties2KHR
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPlaneProperties2KHR -> IO Result) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr DisplayPlaneProperties2KHR -> IO Result

-- | vkGetPhysicalDeviceDisplayPlaneProperties2KHR - Query information about
-- the available display planes.
--
-- = Parameters
--
-- -   @physicalDevice@ is a physical device.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display planes available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayPlaneProperties2KHR' structures.
--
-- = Description
--
-- 'getPhysicalDeviceDisplayPlaneProperties2KHR' behaves similarly to
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.getPhysicalDeviceDisplayPlanePropertiesKHR',
-- with the ability to return extended information via chained output
-- structures.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayPlaneProperties2KHR'
--     structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'DisplayPlaneProperties2KHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceDisplayPlaneProperties2KHR :: forall io . MonadIO io => PhysicalDevice -> io (Result, ("properties" ::: Vector DisplayPlaneProperties2KHR))
getPhysicalDeviceDisplayPlaneProperties2KHR physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceDisplayPlaneProperties2KHR' = mkVkGetPhysicalDeviceDisplayPlaneProperties2KHR (pVkGetPhysicalDeviceDisplayPlaneProperties2KHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetPhysicalDeviceDisplayPlaneProperties2KHR' physicalDevice' (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayPlaneProperties2KHR ((fromIntegral (pPropertyCount)) * 32)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 32) :: Ptr DisplayPlaneProperties2KHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetPhysicalDeviceDisplayPlaneProperties2KHR' physicalDevice' (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayPlaneProperties2KHR (((pPProperties) `advancePtrBytes` (32 * (i)) :: Ptr DisplayPlaneProperties2KHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDisplayModeProperties2KHR
  :: FunPtr (Ptr PhysicalDevice_T -> DisplayKHR -> Ptr Word32 -> Ptr DisplayModeProperties2KHR -> IO Result) -> Ptr PhysicalDevice_T -> DisplayKHR -> Ptr Word32 -> Ptr DisplayModeProperties2KHR -> IO Result

-- | vkGetDisplayModeProperties2KHR - Query information about the available
-- display modes.
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device associated with @display@.
--
-- -   @display@ is the display to query.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     display modes available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'DisplayModeProperties2KHR' structures.
--
-- = Description
--
-- 'getDisplayModeProperties2KHR' behaves similarly to
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.getDisplayModePropertiesKHR',
-- with the ability to return extended information via chained output
-- structures.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @display@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayKHR' handle
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'DisplayModeProperties2KHR'
--     structures
--
-- -   @display@ /must/ have been created, allocated, or retrieved from
--     @physicalDevice@
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.INCOMPLETE'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayKHR',
-- 'DisplayModeProperties2KHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getDisplayModeProperties2KHR :: forall io . MonadIO io => PhysicalDevice -> DisplayKHR -> io (Result, ("properties" ::: Vector DisplayModeProperties2KHR))
getDisplayModeProperties2KHR physicalDevice display = liftIO . evalContT $ do
  let vkGetDisplayModeProperties2KHR' = mkVkGetDisplayModeProperties2KHR (pVkGetDisplayModeProperties2KHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  r <- lift $ vkGetDisplayModeProperties2KHR' physicalDevice' (display) (pPPropertyCount) (nullPtr)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @DisplayModeProperties2KHR ((fromIntegral (pPropertyCount)) * 40)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 40) :: Ptr DisplayModeProperties2KHR) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  r' <- lift $ vkGetDisplayModeProperties2KHR' physicalDevice' (display) (pPPropertyCount) ((pPProperties))
  lift $ when (r' < SUCCESS) (throwIO (VulkanException r'))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @DisplayModeProperties2KHR (((pPProperties) `advancePtrBytes` (40 * (i)) :: Ptr DisplayModeProperties2KHR)))
  pure $ ((r'), pProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDisplayPlaneCapabilities2KHR
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr DisplayPlaneInfo2KHR -> Ptr DisplayPlaneCapabilities2KHR -> IO Result) -> Ptr PhysicalDevice_T -> Ptr DisplayPlaneInfo2KHR -> Ptr DisplayPlaneCapabilities2KHR -> IO Result

-- | vkGetDisplayPlaneCapabilities2KHR - Query capabilities of a mode and
-- plane combination
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device associated with
--     @pDisplayPlaneInfo@.
--
-- -   @pDisplayPlaneInfo@ is a pointer to a 'DisplayPlaneInfo2KHR'
--     structure describing the plane and mode.
--
-- -   @pCapabilities@ is a pointer to a 'DisplayPlaneCapabilities2KHR'
--     structure in which the capabilities are returned.
--
-- = Description
--
-- 'getDisplayPlaneCapabilities2KHR' behaves similarly to
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.getDisplayPlaneCapabilitiesKHR',
-- with the ability to specify extended inputs via chained input
-- structures, and to return extended information via chained output
-- structures.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'DisplayPlaneCapabilities2KHR', 'DisplayPlaneInfo2KHR',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getDisplayPlaneCapabilities2KHR :: forall io . MonadIO io => PhysicalDevice -> DisplayPlaneInfo2KHR -> io (DisplayPlaneCapabilities2KHR)
getDisplayPlaneCapabilities2KHR physicalDevice displayPlaneInfo = liftIO . evalContT $ do
  let vkGetDisplayPlaneCapabilities2KHR' = mkVkGetDisplayPlaneCapabilities2KHR (pVkGetDisplayPlaneCapabilities2KHR (instanceCmds (physicalDevice :: PhysicalDevice)))
  pDisplayPlaneInfo <- ContT $ withCStruct (displayPlaneInfo)
  pPCapabilities <- ContT (withZeroCStruct @DisplayPlaneCapabilities2KHR)
  r <- lift $ vkGetDisplayPlaneCapabilities2KHR' (physicalDeviceHandle (physicalDevice)) pDisplayPlaneInfo (pPCapabilities)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pCapabilities <- lift $ peekCStruct @DisplayPlaneCapabilities2KHR pPCapabilities
  pure $ (pCapabilities)


-- | VkDisplayProperties2KHR - Structure describing an available display
-- device
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPropertiesKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceDisplayProperties2KHR'
data DisplayProperties2KHR = DisplayProperties2KHR
  { -- | @displayProperties@ is a
    -- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPropertiesKHR'
    -- structure.
    displayProperties :: DisplayPropertiesKHR }
  deriving (Typeable)
deriving instance Show DisplayProperties2KHR

instance ToCStruct DisplayProperties2KHR where
  withCStruct x f = allocaBytesAligned 64 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayProperties2KHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPropertiesKHR)) (displayProperties) . ($ ())
    lift $ f
  cStructSize = 64
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPropertiesKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayProperties2KHR where
  peekCStruct p = do
    displayProperties <- peekCStruct @DisplayPropertiesKHR ((p `plusPtr` 16 :: Ptr DisplayPropertiesKHR))
    pure $ DisplayProperties2KHR
             displayProperties

instance Zero DisplayProperties2KHR where
  zero = DisplayProperties2KHR
           zero


-- | VkDisplayPlaneProperties2KHR - Structure describing an available display
-- plane
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPlanePropertiesKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceDisplayPlaneProperties2KHR'
data DisplayPlaneProperties2KHR = DisplayPlaneProperties2KHR
  { -- | @displayPlaneProperties@ is a
    -- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPlanePropertiesKHR'
    -- structure.
    displayPlaneProperties :: DisplayPlanePropertiesKHR }
  deriving (Typeable)
deriving instance Show DisplayPlaneProperties2KHR

instance ToCStruct DisplayPlaneProperties2KHR where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPlaneProperties2KHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPlanePropertiesKHR)) (displayPlaneProperties) . ($ ())
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPlanePropertiesKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayPlaneProperties2KHR where
  peekCStruct p = do
    displayPlaneProperties <- peekCStruct @DisplayPlanePropertiesKHR ((p `plusPtr` 16 :: Ptr DisplayPlanePropertiesKHR))
    pure $ DisplayPlaneProperties2KHR
             displayPlaneProperties

instance Zero DisplayPlaneProperties2KHR where
  zero = DisplayPlaneProperties2KHR
           zero


-- | VkDisplayModeProperties2KHR - Structure describing an available display
-- mode
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayModePropertiesKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getDisplayModeProperties2KHR'
data DisplayModeProperties2KHR = DisplayModeProperties2KHR
  { -- | @displayModeProperties@ is a
    -- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayModePropertiesKHR'
    -- structure.
    displayModeProperties :: DisplayModePropertiesKHR }
  deriving (Typeable)
deriving instance Show DisplayModeProperties2KHR

instance ToCStruct DisplayModeProperties2KHR where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayModeProperties2KHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayModePropertiesKHR)) (displayModeProperties) . ($ ())
    lift $ f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayModePropertiesKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayModeProperties2KHR where
  peekCStruct p = do
    displayModeProperties <- peekCStruct @DisplayModePropertiesKHR ((p `plusPtr` 16 :: Ptr DisplayModePropertiesKHR))
    pure $ DisplayModeProperties2KHR
             displayModeProperties

instance Zero DisplayModeProperties2KHR where
  zero = DisplayModeProperties2KHR
           zero


-- | VkDisplayPlaneInfo2KHR - Structure defining the intended configuration
-- of a display plane
--
-- = Description
--
-- Note
--
-- This parameter also implicitly specifies a display.
--
-- -   @planeIndex@ is the plane which the application intends to use with
--     the display.
--
-- The members of 'DisplayPlaneInfo2KHR' correspond to the arguments to
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.getDisplayPlaneCapabilitiesKHR',
-- with @sType@ and @pNext@ added for extensibility.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @mode@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR' handle
--
-- == Host Synchronization
--
-- -   Host access to @mode@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.DisplayModeKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getDisplayPlaneCapabilities2KHR'
data DisplayPlaneInfo2KHR = DisplayPlaneInfo2KHR
  { -- | @mode@ is the display mode the application intends to program when using
    -- the specified plane.
    mode :: DisplayModeKHR
  , -- No documentation found for Nested "VkDisplayPlaneInfo2KHR" "planeIndex"
    planeIndex :: Word32
  }
  deriving (Typeable)
deriving instance Show DisplayPlaneInfo2KHR

instance ToCStruct DisplayPlaneInfo2KHR where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPlaneInfo2KHR{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DisplayModeKHR)) (mode)
    poke ((p `plusPtr` 24 :: Ptr Word32)) (planeIndex)
    f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_INFO_2_KHR)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DisplayModeKHR)) (zero)
    poke ((p `plusPtr` 24 :: Ptr Word32)) (zero)
    f

instance FromCStruct DisplayPlaneInfo2KHR where
  peekCStruct p = do
    mode <- peek @DisplayModeKHR ((p `plusPtr` 16 :: Ptr DisplayModeKHR))
    planeIndex <- peek @Word32 ((p `plusPtr` 24 :: Ptr Word32))
    pure $ DisplayPlaneInfo2KHR
             mode planeIndex

instance Storable DisplayPlaneInfo2KHR where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero DisplayPlaneInfo2KHR where
  zero = DisplayPlaneInfo2KHR
           zero
           zero


-- | VkDisplayPlaneCapabilities2KHR - Structure describing the capabilities
-- of a mode and plane combination
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPlaneCapabilitiesKHR',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getDisplayPlaneCapabilities2KHR'
data DisplayPlaneCapabilities2KHR = DisplayPlaneCapabilities2KHR
  { -- | @capabilities@ is a
    -- 'Graphics.Vulkan.Extensions.VK_KHR_display.DisplayPlaneCapabilitiesKHR'
    -- structure.
    capabilities :: DisplayPlaneCapabilitiesKHR }
  deriving (Typeable)
deriving instance Show DisplayPlaneCapabilities2KHR

instance ToCStruct DisplayPlaneCapabilities2KHR where
  withCStruct x f = allocaBytesAligned 88 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p DisplayPlaneCapabilities2KHR{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPlaneCapabilitiesKHR)) (capabilities) . ($ ())
    lift $ f
  cStructSize = 88
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_DISPLAY_PLANE_CAPABILITIES_2_KHR)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr DisplayPlaneCapabilitiesKHR)) (zero) . ($ ())
    lift $ f

instance FromCStruct DisplayPlaneCapabilities2KHR where
  peekCStruct p = do
    capabilities <- peekCStruct @DisplayPlaneCapabilitiesKHR ((p `plusPtr` 16 :: Ptr DisplayPlaneCapabilitiesKHR))
    pure $ DisplayPlaneCapabilities2KHR
             capabilities

instance Zero DisplayPlaneCapabilities2KHR where
  zero = DisplayPlaneCapabilities2KHR
           zero


type KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION"
pattern KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION :: forall a . Integral a => a
pattern KHR_GET_DISPLAY_PROPERTIES_2_SPEC_VERSION = 1


type KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME = "VK_KHR_get_display_properties2"

-- No documentation found for TopLevel "VK_KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME"
pattern KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern KHR_GET_DISPLAY_PROPERTIES_2_EXTENSION_NAME = "VK_KHR_get_display_properties2"

