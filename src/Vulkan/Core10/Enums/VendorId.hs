{-# language CPP #-}
-- No documentation found for Chapter "VendorId"
module Vulkan.Core10.Enums.VendorId  (VendorId( VENDOR_ID_VIV
                                              , VENDOR_ID_VSI
                                              , VENDOR_ID_KAZAN
                                              , VENDOR_ID_CODEPLAY
                                              , VENDOR_ID_MESA
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
-- | VkVendorId - Khronos vendor IDs
--
-- = Description
--
-- Note
--
-- Khronos vendor IDs may be allocated by vendors at any time. Only the
-- latest canonical versions of this Specification, of the corresponding
-- @vk.xml@ API Registry, and of the corresponding @vulkan_core.h@ header
-- file /must/ contain all reserved Khronos vendor IDs.
--
-- Only Khronos vendor IDs are given symbolic names at present. PCI vendor
-- IDs returned by the implementation can be looked up in the PCI-SIG
-- database.
--
-- = See Also
--
-- No cross-references are available
newtype VendorId = VendorId Int32
  deriving newtype (Eq, Ord, Storable, Zero)
-- Note that the zero instance does not produce a valid value, passing 'zero' to Vulkan will result in an error

-- No documentation found for Nested "VkVendorId" "VK_VENDOR_ID_VIV"
pattern VENDOR_ID_VIV      = VendorId 65537
-- No documentation found for Nested "VkVendorId" "VK_VENDOR_ID_VSI"
pattern VENDOR_ID_VSI      = VendorId 65538
-- No documentation found for Nested "VkVendorId" "VK_VENDOR_ID_KAZAN"
pattern VENDOR_ID_KAZAN    = VendorId 65539
-- No documentation found for Nested "VkVendorId" "VK_VENDOR_ID_CODEPLAY"
pattern VENDOR_ID_CODEPLAY = VendorId 65540
-- No documentation found for Nested "VkVendorId" "VK_VENDOR_ID_MESA"
pattern VENDOR_ID_MESA     = VendorId 65541
{-# complete VENDOR_ID_VIV,
             VENDOR_ID_VSI,
             VENDOR_ID_KAZAN,
             VENDOR_ID_CODEPLAY,
             VENDOR_ID_MESA :: VendorId #-}

conNameVendorId :: String
conNameVendorId = "VendorId"

enumPrefixVendorId :: String
enumPrefixVendorId = "VENDOR_ID_"

showTableVendorId :: [(VendorId, String)]
showTableVendorId =
  [ (VENDOR_ID_VIV     , "VIV")
  , (VENDOR_ID_VSI     , "VSI")
  , (VENDOR_ID_KAZAN   , "KAZAN")
  , (VENDOR_ID_CODEPLAY, "CODEPLAY")
  , (VENDOR_ID_MESA    , "MESA")
  ]

instance Show VendorId where
  showsPrec p e = case lookup e showTableVendorId of
    Just s -> showString enumPrefixVendorId . showString s
    Nothing ->
      let VendorId x = e in showParen (p >= 11) (showString conNameVendorId . showString " " . showsPrec 11 x)

instance Read VendorId where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixVendorId
          asum ((\(e, s) -> e <$ string s) <$> showTableVendorId)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameVendorId)
            v <- step readPrec
            pure (VendorId v)
          )
    )

