{-# language CPP #-}
module Graphics.Vulkan.Core10.Event  ( createEvent
                                     , withEvent
                                     , destroyEvent
                                     , getEventStatus
                                     , setEvent
                                     , resetEvent
                                     , EventCreateInfo(..)
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
import Control.Monad.IO.Class (MonadIO)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCreateEvent))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkDestroyEvent))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetEventStatus))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkResetEvent))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkSetEvent))
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.Core10.Handles (Event)
import Graphics.Vulkan.Core10.Handles (Event(..))
import Graphics.Vulkan.Core10.Enums.EventCreateFlags (EventCreateFlags)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_EVENT_CREATE_INFO))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateEvent
  :: FunPtr (Ptr Device_T -> Ptr EventCreateInfo -> Ptr AllocationCallbacks -> Ptr Event -> IO Result) -> Ptr Device_T -> Ptr EventCreateInfo -> Ptr AllocationCallbacks -> Ptr Event -> IO Result

-- | vkCreateEvent - Create a new event object
--
-- = Parameters
--
-- -   @device@ is the logical device that creates the event.
--
-- -   @pCreateInfo@ is a pointer to a 'EventCreateInfo' structure
--     containing information about how the event is to be created.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pEvent@ is a pointer to a handle in which the resulting event
--     object is returned.
--
-- = Description
--
-- When created, the event object is in the unsignaled state.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Device'
--     handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid 'EventCreateInfo'
--     structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pEvent@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Core10.Handles.Event' handle
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
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Event', 'EventCreateInfo'
createEvent :: forall io . MonadIO io => Device -> EventCreateInfo -> ("allocator" ::: Maybe AllocationCallbacks) -> io (Event)
createEvent device createInfo allocator = liftIO . evalContT $ do
  let vkCreateEvent' = mkVkCreateEvent (pVkCreateEvent (deviceCmds (device :: Device)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPEvent <- ContT $ bracket (callocBytes @Event 8) free
  r <- lift $ vkCreateEvent' (deviceHandle (device)) pCreateInfo pAllocator (pPEvent)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pEvent <- lift $ peek @Event pPEvent
  pure $ (pEvent)

-- | A safe wrapper for 'createEvent' and 'destroyEvent' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withEvent :: forall r . Device -> EventCreateInfo -> Maybe AllocationCallbacks -> ((Event) -> IO r) -> IO r
withEvent device pCreateInfo pAllocator =
  bracket
    (createEvent device pCreateInfo pAllocator)
    (\(o0) -> destroyEvent device o0 pAllocator)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroyEvent
  :: FunPtr (Ptr Device_T -> Event -> Ptr AllocationCallbacks -> IO ()) -> Ptr Device_T -> Event -> Ptr AllocationCallbacks -> IO ()

-- | vkDestroyEvent - Destroy an event object
--
-- = Parameters
--
-- -   @device@ is the logical device that destroys the event.
--
-- -   @event@ is the handle of the event to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- == Valid Usage
--
-- -   All submitted commands that refer to @event@ /must/ have completed
--     execution
--
-- -   If 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when @event@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when @event@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Device'
--     handle
--
-- -   If @event@ is not 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     @event@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Event'
--     handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   If @event@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from @device@
--
-- == Host Synchronization
--
-- -   Host access to @event@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Event'
destroyEvent :: forall io . MonadIO io => Device -> Event -> ("allocator" ::: Maybe AllocationCallbacks) -> io ()
destroyEvent device event allocator = liftIO . evalContT $ do
  let vkDestroyEvent' = mkVkDestroyEvent (pVkDestroyEvent (deviceCmds (device :: Device)))
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  lift $ vkDestroyEvent' (deviceHandle (device)) (event) pAllocator
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetEventStatus
  :: FunPtr (Ptr Device_T -> Event -> IO Result) -> Ptr Device_T -> Event -> IO Result

-- | vkGetEventStatus - Retrieve the status of an event object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the event.
--
-- -   @event@ is the handle of the event to query.
--
-- = Description
--
-- Upon success, 'getEventStatus' returns the state of the event object
-- with the following return codes:
--
-- +---------------------------------------------------+-----------------------------------+
-- | Status                                            | Meaning                           |
-- +===================================================+===================================+
-- | 'Graphics.Vulkan.Core10.Enums.Result.EVENT_SET'   | The event specified by @event@ is |
-- |                                                   | signaled.                         |
-- +---------------------------------------------------+-----------------------------------+
-- | 'Graphics.Vulkan.Core10.Enums.Result.EVENT_RESET' | The event specified by @event@ is |
-- |                                                   | unsignaled.                       |
-- +---------------------------------------------------+-----------------------------------+
--
-- Event Object Status Codes
--
-- If a 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdSetEvent' or
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdResetEvent' command is
-- in a command buffer that is in the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle pending state>,
-- then the value returned by this command /may/ immediately be out of
-- date.
--
-- The state of an event /can/ be updated by the host. The state of the
-- event is immediately changed, and subsequent calls to 'getEventStatus'
-- will return the new state. If an event is already in the requested
-- state, then updating it to the same state has no effect.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.EVENT_SET'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.EVENT_RESET'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_DEVICE_LOST'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Event'
getEventStatus :: forall io . MonadIO io => Device -> Event -> io (Result)
getEventStatus device event = liftIO $ do
  let vkGetEventStatus' = mkVkGetEventStatus (pVkGetEventStatus (deviceCmds (device :: Device)))
  r <- vkGetEventStatus' (deviceHandle (device)) (event)
  when (r < SUCCESS) (throwIO (VulkanException r))
  pure $ (r)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkSetEvent
  :: FunPtr (Ptr Device_T -> Event -> IO Result) -> Ptr Device_T -> Event -> IO Result

-- | vkSetEvent - Set an event to signaled state
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the event.
--
-- -   @event@ is the event to set.
--
-- = Description
--
-- When 'setEvent' is executed on the host, it defines an /event signal
-- operation/ which sets the event to the signaled state.
--
-- If @event@ is already in the signaled state when 'setEvent' is executed,
-- then 'setEvent' has no effect, and no event signal operation occurs.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Device'
--     handle
--
-- -   @event@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Event'
--     handle
--
-- -   @event@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- == Host Synchronization
--
-- -   Host access to @event@ /must/ be externally synchronized
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
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Event'
setEvent :: forall io . MonadIO io => Device -> Event -> io ()
setEvent device event = liftIO $ do
  let vkSetEvent' = mkVkSetEvent (pVkSetEvent (deviceCmds (device :: Device)))
  r <- vkSetEvent' (deviceHandle (device)) (event)
  when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkResetEvent
  :: FunPtr (Ptr Device_T -> Event -> IO Result) -> Ptr Device_T -> Event -> IO Result

-- | vkResetEvent - Reset an event to non-signaled state
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the event.
--
-- -   @event@ is the event to reset.
--
-- = Description
--
-- When 'resetEvent' is executed on the host, it defines an /event unsignal
-- operation/ which resets the event to the unsignaled state.
--
-- If @event@ is already in the unsignaled state when 'resetEvent' is
-- executed, then 'resetEvent' has no effect, and no event unsignal
-- operation occurs.
--
-- == Valid Usage
--
-- -   @event@ /must/ not be waited on by a
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdWaitEvents' command
--     that is currently executing
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Device'
--     handle
--
-- -   @event@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Event'
--     handle
--
-- -   @event@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- == Host Synchronization
--
-- -   Host access to @event@ /must/ be externally synchronized
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
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Event'
resetEvent :: forall io . MonadIO io => Device -> Event -> io ()
resetEvent device event = liftIO $ do
  let vkResetEvent' = mkVkResetEvent (pVkResetEvent (deviceCmds (device :: Device)))
  r <- vkResetEvent' (deviceHandle (device)) (event)
  when (r < SUCCESS) (throwIO (VulkanException r))


-- | VkEventCreateInfo - Structure specifying parameters of a newly created
-- event
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.EventCreateFlags.EventCreateFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'createEvent'
data EventCreateInfo = EventCreateInfo
  { -- | @flags@ /must/ be @0@
    flags :: EventCreateFlags }
  deriving (Typeable)
deriving instance Show EventCreateInfo

instance ToCStruct EventCreateInfo where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p EventCreateInfo{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_EVENT_CREATE_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr EventCreateFlags)) (flags)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_EVENT_CREATE_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f

instance FromCStruct EventCreateInfo where
  peekCStruct p = do
    flags <- peek @EventCreateFlags ((p `plusPtr` 16 :: Ptr EventCreateFlags))
    pure $ EventCreateInfo
             flags

instance Storable EventCreateInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero EventCreateInfo where
  zero = EventCreateInfo
           zero

