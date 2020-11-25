{-# language CPP #-}
-- No documentation found for Chapter "DescriptorSetLayoutCreateFlagBits"
module Vulkan.Core10.Enums.DescriptorSetLayoutCreateFlagBits  ( DescriptorSetLayoutCreateFlags
                                                              , DescriptorSetLayoutCreateFlagBits( DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR
                                                                                                 , DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT
                                                                                                 , ..
                                                                                                 )
                                                              ) where

import Data.Foldable (asum)
import GHC.Base ((<$))
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import Numeric (showHex)
import Text.ParserCombinators.ReadP (skipSpaces)
import Text.ParserCombinators.ReadP (string)
import Text.ParserCombinators.ReadPrec ((+++))
import qualified Text.ParserCombinators.ReadPrec (lift)
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.Bits (Bits)
import Data.Bits (FiniteBits)
import Foreign.Storable (Storable)
import GHC.Read (Read(readPrec))
import Text.Read.Lex (Lexeme(Ident))
import Vulkan.Core10.FundamentalTypes (Flags)
import Vulkan.Zero (Zero)
type DescriptorSetLayoutCreateFlags = DescriptorSetLayoutCreateFlagBits

-- | VkDescriptorSetLayoutCreateFlagBits - Bitmask specifying descriptor set
-- layout properties
--
-- = See Also
--
-- 'DescriptorSetLayoutCreateFlags'
newtype DescriptorSetLayoutCreateFlagBits = DescriptorSetLayoutCreateFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR' specifies that
-- descriptor sets /must/ not be allocated using this layout, and
-- descriptors are instead pushed by
-- 'Vulkan.Extensions.VK_KHR_push_descriptor.cmdPushDescriptorSetKHR'.
pattern DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR    = DescriptorSetLayoutCreateFlagBits 0x00000001
-- | 'DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT' specifies that
-- descriptor sets using this layout /must/ be allocated from a descriptor
-- pool created with the
-- 'Vulkan.Core10.Enums.DescriptorPoolCreateFlagBits.DESCRIPTOR_POOL_CREATE_UPDATE_AFTER_BIND_BIT'
-- bit set. Descriptor set layouts created with this bit set have alternate
-- limits for the maximum number of descriptors per-stage and per-pipeline
-- layout. The non-UpdateAfterBind limits only count descriptors in sets
-- created without this flag. The UpdateAfterBind limits count all
-- descriptors, but the limits /may/ be higher than the non-UpdateAfterBind
-- limits.
pattern DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT = DescriptorSetLayoutCreateFlagBits 0x00000002

conNameDescriptorSetLayoutCreateFlagBits :: String
conNameDescriptorSetLayoutCreateFlagBits = "DescriptorSetLayoutCreateFlagBits"

enumPrefixDescriptorSetLayoutCreateFlagBits :: String
enumPrefixDescriptorSetLayoutCreateFlagBits = "DESCRIPTOR_SET_LAYOUT_CREATE_"

showTableDescriptorSetLayoutCreateFlagBits :: [(DescriptorSetLayoutCreateFlagBits, String)]
showTableDescriptorSetLayoutCreateFlagBits =
  [ (DESCRIPTOR_SET_LAYOUT_CREATE_PUSH_DESCRIPTOR_BIT_KHR   , "PUSH_DESCRIPTOR_BIT_KHR")
  , (DESCRIPTOR_SET_LAYOUT_CREATE_UPDATE_AFTER_BIND_POOL_BIT, "UPDATE_AFTER_BIND_POOL_BIT")
  ]

instance Show DescriptorSetLayoutCreateFlagBits where
  showsPrec p e = case lookup e showTableDescriptorSetLayoutCreateFlagBits of
    Just s -> showString enumPrefixDescriptorSetLayoutCreateFlagBits . showString s
    Nothing ->
      let DescriptorSetLayoutCreateFlagBits x = e
      in  showParen (p >= 11) (showString conNameDescriptorSetLayoutCreateFlagBits . showString " 0x" . showHex x)

instance Read DescriptorSetLayoutCreateFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixDescriptorSetLayoutCreateFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableDescriptorSetLayoutCreateFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameDescriptorSetLayoutCreateFlagBits)
            v <- step readPrec
            pure (DescriptorSetLayoutCreateFlagBits v)
          )
    )

