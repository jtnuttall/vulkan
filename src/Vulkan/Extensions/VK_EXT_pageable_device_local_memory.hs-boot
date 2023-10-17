{-# language CPP #-}
-- | = Name
--
-- VK_EXT_pageable_device_local_memory - device extension
--
-- == VK_EXT_pageable_device_local_memory
--
-- [__Name String__]
--     @VK_EXT_pageable_device_local_memory@
--
-- [__Extension Type__]
--     Device extension
--
-- [__Registered Extension Number__]
--     413
--
-- [__Revision__]
--     1
--
-- [__Extension and Version Dependencies__]
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_memory_priority VK_EXT_memory_priority>
--
-- [__Contact__]
--
--     -   Piers Daniell
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?body=[VK_EXT_pageable_device_local_memory] @pdaniell-nv%0A*Here describe the issue or question you have about the VK_EXT_pageable_device_local_memory extension* >
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2021-08-24
--
-- [__Contributors__]
--
--     -   Hans-Kristian Arntzen, Valve
--
--     -   Axel Gneiting, id Software
--
--     -   Billy Khan, id Software
--
--     -   Daniel Koch, NVIDIA
--
--     -   Chris Lentini, NVIDIA
--
--     -   Joshua Schnarr, NVIDIA
--
--     -   Stu Smith, AMD
--
-- == Description
--
-- Vulkan is frequently implemented on multi-user and multi-process
-- operating systems where the device-local memory can be shared by more
-- than one process. On such systems the size of the device-local memory
-- available to the application may not be the full size of the memory heap
-- at all times. In order for these operating systems to support multiple
-- applications the device-local memory is virtualized and paging is used
-- to move memory between device-local and host-local memory heaps,
-- transparent to the application.
--
-- The current Vulkan specification does not expose this behavior well and
-- may cause applications to make suboptimal memory choices when allocating
-- memory. For example, in a system with multiple applications running, the
-- application may think that device-local memory is full and revert to
-- making performance-sensitive allocations from host-local memory. In
-- reality the memory heap might not have been full, it just appeared to be
-- at the time memory consumption was queried, and a device-local
-- allocation would have succeeded. A well designed operating system that
-- implements pageable device-local memory will try to have all memory
-- allocations for the foreground application paged into device-local
-- memory, and paged out for other applications as needed when not in use.
--
-- When this extension is exposed by the Vulkan implementation it indicates
-- to the application that the operating system implements pageable
-- device-local memory and the application should adjust its memory
-- allocation strategy accordingly. The extension also exposes a new
-- 'setDeviceMemoryPriorityEXT' function to allow the application to
-- dynamically adjust the priority of existing memory allocations based on
-- its current needs. This will help the operating system page out lower
-- priority memory allocations before higher priority allocations when
-- needed. It will also help the operating system decide which memory
-- allocations to page back into device-local memory first.
--
-- To take best advantage of pageable device-local memory the application
-- must create the Vulkan device with the
-- 'PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT'::@pageableDeviceLocalMemory@
-- feature enabled. When enabled the Vulkan implementation will allow
-- device-local memory allocations to be paged in and out by the operating
-- system, and /may/ not return VK_ERROR_OUT_OF_DEVICE_MEMORY even if
-- device-local memory appears to be full, but will instead page this, or
-- other allocations, out to make room. The Vulkan implementation will also
-- ensure that host-local memory allocations will never be promoted to
-- device-local memory by the operating system, or consume device-local
-- memory.
--
-- == New Commands
--
-- -   'setDeviceMemoryPriorityEXT'
--
-- == New Structures
--
-- -   Extending
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceFeatures2',
--     'Vulkan.Core10.Device.DeviceCreateInfo':
--
--     -   'PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT'
--
-- == New Enum Constants
--
-- -   'EXT_PAGEABLE_DEVICE_LOCAL_MEMORY_EXTENSION_NAME'
--
-- -   'EXT_PAGEABLE_DEVICE_LOCAL_MEMORY_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT'
--
-- == Version History
--
-- -   Revision 1, 2021-08-24 (Piers Daniell)
--
--     -   Initial revision
--
-- == See Also
--
-- 'PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT',
-- 'setDeviceMemoryPriorityEXT'
--
-- == Document Notes
--
-- For more information, see the
-- <https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#VK_EXT_pageable_device_local_memory Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_pageable_device_local_memory  (PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)

data PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT

instance ToCStruct PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT
instance Show PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT

instance FromCStruct PhysicalDevicePageableDeviceLocalMemoryFeaturesEXT

