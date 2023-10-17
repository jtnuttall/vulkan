{-# language CPP #-}
-- | = Name
--
-- VK_NVX_binary_import - device extension
--
-- == VK_NVX_binary_import
--
-- [__Name String__]
--     @VK_NVX_binary_import@
--
-- [__Extension Type__]
--     Device extension
--
-- [__Registered Extension Number__]
--     30
--
-- [__Revision__]
--     1
--
-- [__Ratification Status__]
--     Not ratified
--
-- [__Extension and Version Dependencies__; __Contact__]
--
--     -   Eric Werness
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?body=[VK_NVX_binary_import] @ewerness-nv%0A*Here describe the issue or question you have about the VK_NVX_binary_import extension* >
--
--     -   Liam Middlebrook
--         <https://github.com/KhronosGroup/Vulkan-Docs/issues/new?body=[VK_NVX_binary_import] @liam-middlebrook%0A*Here describe the issue or question you have about the VK_NVX_binary_import extension* >
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2021-04-09
--
-- [__Contributors__]
--
--     -   Eric Werness, NVIDIA
--
--     -   Liam Middlebrook, NVIDIA
--
-- == Description
--
-- This extension allows applications to import CuBIN binaries and execute
-- them.
--
-- Note
--
-- There is currently no specification language written for this extension.
-- The links to APIs defined by the extension are to stubs that only
-- include generated content such as API declarations and implicit valid
-- usage statements.
--
-- == New Object Types
--
-- -   'Vulkan.Extensions.Handles.CuFunctionNVX'
--
-- -   'Vulkan.Extensions.Handles.CuModuleNVX'
--
-- == New Commands
--
-- -   'cmdCuLaunchKernelNVX'
--
-- -   'createCuFunctionNVX'
--
-- -   'createCuModuleNVX'
--
-- -   'destroyCuFunctionNVX'
--
-- -   'destroyCuModuleNVX'
--
-- == New Structures
--
-- -   'CuFunctionCreateInfoNVX'
--
-- -   'CuLaunchInfoNVX'
--
-- -   'CuModuleCreateInfoNVX'
--
-- == New Enum Constants
--
-- -   'NVX_BINARY_IMPORT_EXTENSION_NAME'
--
-- -   'NVX_BINARY_IMPORT_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.ObjectType.ObjectType':
--
--     -   'Vulkan.Core10.Enums.ObjectType.OBJECT_TYPE_CU_FUNCTION_NVX'
--
--     -   'Vulkan.Core10.Enums.ObjectType.OBJECT_TYPE_CU_MODULE_NVX'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX'
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX'
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX'
--
-- If
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_debug_report VK_EXT_debug_report>
-- is supported:
--
-- -   Extending
--     'Vulkan.Extensions.VK_EXT_debug_report.DebugReportObjectTypeEXT':
--
--     -   'Vulkan.Extensions.VK_EXT_debug_report.DEBUG_REPORT_OBJECT_TYPE_CU_FUNCTION_NVX_EXT'
--
--     -   'Vulkan.Extensions.VK_EXT_debug_report.DEBUG_REPORT_OBJECT_TYPE_CU_MODULE_NVX_EXT'
--
-- == Stub API References
--
-- There is currently no specification language written for this type. This
-- section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkCuFunctionNVX)
--
-- There is currently no specification language written for this type. This
-- section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > VK_DEFINE_NON_DISPATCHABLE_HANDLE(VkCuModuleNVX)
--
-- There is currently no specification language written for this command.
-- This section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > VkResult vkCreateCuFunctionNVX(
-- >     VkDevice                                    device,
-- >     const VkCuFunctionCreateInfoNVX*            pCreateInfo,
-- >     const VkAllocationCallbacks*                pAllocator,
-- >     VkCuFunctionNVX*                            pFunction);
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-vkCreateCuFunctionNVX-device-parameter# @device@ /must/ be a
--     valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   #VUID-vkCreateCuFunctionNVX-pCreateInfo-parameter# @pCreateInfo@
--     /must/ be a valid pointer to a valid 'CuFunctionCreateInfoNVX'
--     structure
--
-- -   #VUID-vkCreateCuFunctionNVX-pAllocator-parameter# If @pAllocator@ is
--     not @NULL@, @pAllocator@ /must/ be a valid pointer to a valid
--     'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks' structure
--
-- -   #VUID-vkCreateCuFunctionNVX-pFunction-parameter# @pFunction@ /must/
--     be a valid pointer to a 'Vulkan.Extensions.Handles.CuFunctionNVX'
--     handle
--
-- === Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_INITIALIZATION_FAILED'
--
-- There is currently no specification language written for this type. This
-- section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > typedef struct VkCuFunctionCreateInfoNVX {
-- >     VkStructureType    sType;
-- >     const void*        pNext;
-- >     VkCuModuleNVX      module;
-- >     const char*        pName;
-- > } VkCuFunctionCreateInfoNVX;
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-VkCuFunctionCreateInfoNVX-sType-sType# @sType@ /must/ be
--     'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_FUNCTION_CREATE_INFO_NVX'
--
-- -   #VUID-VkCuFunctionCreateInfoNVX-pNext-pNext# @pNext@ /must/ be
--     @NULL@
--
-- -   #VUID-VkCuFunctionCreateInfoNVX-module-parameter# @module@ /must/ be
--     a valid 'Vulkan.Extensions.Handles.CuModuleNVX' handle
--
-- -   #VUID-VkCuFunctionCreateInfoNVX-pName-parameter# @pName@ /must/ be a
--     null-terminated UTF-8 string
--
-- There is currently no specification language written for this command.
-- This section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > void vkDestroyCuFunctionNVX(
-- >     VkDevice                                    device,
-- >     VkCuFunctionNVX                             function,
-- >     const VkAllocationCallbacks*                pAllocator);
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-vkDestroyCuFunctionNVX-device-parameter# @device@ /must/ be a
--     valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   #VUID-vkDestroyCuFunctionNVX-function-parameter# @function@ /must/
--     be a valid 'Vulkan.Extensions.Handles.CuFunctionNVX' handle
--
-- -   #VUID-vkDestroyCuFunctionNVX-pAllocator-parameter# If @pAllocator@
--     is not @NULL@, @pAllocator@ /must/ be a valid pointer to a valid
--     'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks' structure
--
-- -   #VUID-vkDestroyCuFunctionNVX-function-parent# @function@ /must/ have
--     been created, allocated, or retrieved from @device@
--
-- There is currently no specification language written for this command.
-- This section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > VkResult vkCreateCuModuleNVX(
-- >     VkDevice                                    device,
-- >     const VkCuModuleCreateInfoNVX*              pCreateInfo,
-- >     const VkAllocationCallbacks*                pAllocator,
-- >     VkCuModuleNVX*                              pModule);
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-vkCreateCuModuleNVX-device-parameter# @device@ /must/ be a
--     valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   #VUID-vkCreateCuModuleNVX-pCreateInfo-parameter# @pCreateInfo@
--     /must/ be a valid pointer to a valid 'CuModuleCreateInfoNVX'
--     structure
--
-- -   #VUID-vkCreateCuModuleNVX-pAllocator-parameter# If @pAllocator@ is
--     not @NULL@, @pAllocator@ /must/ be a valid pointer to a valid
--     'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks' structure
--
-- -   #VUID-vkCreateCuModuleNVX-pModule-parameter# @pModule@ /must/ be a
--     valid pointer to a 'Vulkan.Extensions.Handles.CuModuleNVX' handle
--
-- === Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_INITIALIZATION_FAILED'
--
-- There is currently no specification language written for this type. This
-- section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > typedef struct VkCuModuleCreateInfoNVX {
-- >     VkStructureType    sType;
-- >     const void*        pNext;
-- >     size_t             dataSize;
-- >     const void*        pData;
-- > } VkCuModuleCreateInfoNVX;
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-VkCuModuleCreateInfoNVX-sType-sType# @sType@ /must/ be
--     'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX'
--
-- -   #VUID-VkCuModuleCreateInfoNVX-pNext-pNext# @pNext@ /must/ be @NULL@
--
-- -   #VUID-VkCuModuleCreateInfoNVX-pData-parameter# @pData@ /must/ be a
--     valid pointer to an array of @dataSize@ bytes
--
-- -   #VUID-VkCuModuleCreateInfoNVX-dataSize-arraylength# @dataSize@
--     /must/ be greater than @0@
--
-- There is currently no specification language written for this command.
-- This section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > void vkDestroyCuModuleNVX(
-- >     VkDevice                                    device,
-- >     VkCuModuleNVX                               module,
-- >     const VkAllocationCallbacks*                pAllocator);
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-vkDestroyCuModuleNVX-device-parameter# @device@ /must/ be a
--     valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   #VUID-vkDestroyCuModuleNVX-module-parameter# @module@ /must/ be a
--     valid 'Vulkan.Extensions.Handles.CuModuleNVX' handle
--
-- -   #VUID-vkDestroyCuModuleNVX-pAllocator-parameter# If @pAllocator@ is
--     not @NULL@, @pAllocator@ /must/ be a valid pointer to a valid
--     'Vulkan.Core10.AllocationCallbacks.AllocationCallbacks' structure
--
-- -   #VUID-vkDestroyCuModuleNVX-module-parent# @module@ /must/ have been
--     created, allocated, or retrieved from @device@
--
-- There is currently no specification language written for this command.
-- This section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > void vkCmdCuLaunchKernelNVX(
-- >     VkCommandBuffer                             commandBuffer,
-- >     const VkCuLaunchInfoNVX*                    pLaunchInfo);
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-vkCmdCuLaunchKernelNVX-commandBuffer-parameter#
--     @commandBuffer@ /must/ be a valid
--     'Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   #VUID-vkCmdCuLaunchKernelNVX-pLaunchInfo-parameter# @pLaunchInfo@
--     /must/ be a valid pointer to a valid 'CuLaunchInfoNVX' structure
--
-- -   #VUID-vkCmdCuLaunchKernelNVX-commandBuffer-recording#
--     @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   #VUID-vkCmdCuLaunchKernelNVX-commandBuffer-cmdpool# The
--     'Vulkan.Core10.Handles.CommandPool' that @commandBuffer@ was
--     allocated from /must/ support graphics, or compute operations
--
-- -   #VUID-vkCmdCuLaunchKernelNVX-videocoding# This command /must/ only
--     be called outside of a video coding scope
--
-- === Host Synchronization
--
-- -   Host access to the 'Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
--
-- === Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginVideoCodingKHR Video Coding Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-queueoperation-command-types Command Type> |
-- +============================================================================================================================+========================================================================================================================+=============================================================================================================================+=======================================================================================================================+========================================================================================================================================+
-- | Primary                                                                                                                    | Both                                                                                                                   | Outside                                                                                                                     | Graphics                                                                                                              | Action                                                                                                                                 |
-- | Secondary                                                                                                                  |                                                                                                                        |                                                                                                                             | Compute                                                                                                               |                                                                                                                                        |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------+
--
-- There is currently no specification language written for this type. This
-- section acts only as placeholder and to avoid dead links in the
-- specification and reference pages.
--
-- > // Provided by VK_NVX_binary_import
-- > typedef struct VkCuLaunchInfoNVX {
-- >     VkStructureType        sType;
-- >     const void*            pNext;
-- >     VkCuFunctionNVX        function;
-- >     uint32_t               gridDimX;
-- >     uint32_t               gridDimY;
-- >     uint32_t               gridDimZ;
-- >     uint32_t               blockDimX;
-- >     uint32_t               blockDimY;
-- >     uint32_t               blockDimZ;
-- >     uint32_t               sharedMemBytes;
-- >     size_t                 paramCount;
-- >     const void* const *    pParams;
-- >     size_t                 extraCount;
-- >     const void* const *    pExtras;
-- > } VkCuLaunchInfoNVX;
--
-- === Valid Usage (Implicit)
--
-- -   #VUID-VkCuLaunchInfoNVX-sType-sType# @sType@ /must/ be
--     'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_CU_LAUNCH_INFO_NVX'
--
-- -   #VUID-VkCuLaunchInfoNVX-pNext-pNext# @pNext@ /must/ be @NULL@
--
-- -   #VUID-VkCuLaunchInfoNVX-function-parameter# @function@ /must/ be a
--     valid 'Vulkan.Extensions.Handles.CuFunctionNVX' handle
--
-- -   #VUID-VkCuLaunchInfoNVX-pParams-parameter# If @paramCount@ is not
--     @0@, @pParams@ /must/ be a valid pointer to an array of @paramCount@
--     bytes
--
-- -   #VUID-VkCuLaunchInfoNVX-pExtras-parameter# If @extraCount@ is not
--     @0@, @pExtras@ /must/ be a valid pointer to an array of @extraCount@
--     bytes
--
-- == Version History
--
-- -   Revision 1, 2021-04-09 (Eric Werness)
--
--     -   Internal revisions
--
-- == See Also
--
-- 'CuFunctionCreateInfoNVX', 'Vulkan.Extensions.Handles.CuFunctionNVX',
-- 'CuLaunchInfoNVX', 'CuModuleCreateInfoNVX',
-- 'Vulkan.Extensions.Handles.CuModuleNVX', 'cmdCuLaunchKernelNVX',
-- 'createCuFunctionNVX', 'createCuModuleNVX', 'destroyCuFunctionNVX',
-- 'destroyCuModuleNVX'
--
-- == Document Notes
--
-- For more information, see the
-- <https://registry.khronos.org/vulkan/specs/1.3-extensions/html/vkspec.html#VK_NVX_binary_import Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_NVX_binary_import  ( CuFunctionCreateInfoNVX
                                               , CuLaunchInfoNVX
                                               , CuModuleCreateInfoNVX
                                               ) where

import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
import Data.Kind (Type)

data CuFunctionCreateInfoNVX

instance ToCStruct CuFunctionCreateInfoNVX
instance Show CuFunctionCreateInfoNVX

instance FromCStruct CuFunctionCreateInfoNVX


data CuLaunchInfoNVX

instance ToCStruct CuLaunchInfoNVX
instance Show CuLaunchInfoNVX

instance FromCStruct CuLaunchInfoNVX


data CuModuleCreateInfoNVX

instance ToCStruct CuModuleCreateInfoNVX
instance Show CuModuleCreateInfoNVX

instance FromCStruct CuModuleCreateInfoNVX

