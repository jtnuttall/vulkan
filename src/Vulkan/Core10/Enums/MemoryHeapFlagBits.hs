{-# language CPP #-}
-- No documentation found for Chapter "MemoryHeapFlagBits"
module Vulkan.Core10.Enums.MemoryHeapFlagBits  ( MemoryHeapFlags
                                               , MemoryHeapFlagBits( MEMORY_HEAP_DEVICE_LOCAL_BIT
                                                                   , MEMORY_HEAP_MULTI_INSTANCE_BIT
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
type MemoryHeapFlags = MemoryHeapFlagBits

-- | VkMemoryHeapFlagBits - Bitmask specifying attribute flags for a heap
--
-- = See Also
--
-- 'MemoryHeapFlags'
newtype MemoryHeapFlagBits = MemoryHeapFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'MEMORY_HEAP_DEVICE_LOCAL_BIT' specifies that the heap corresponds to
-- device local memory. Device local memory /may/ have different
-- performance characteristics than host local memory, and /may/ support
-- different memory property flags.
pattern MEMORY_HEAP_DEVICE_LOCAL_BIT   = MemoryHeapFlagBits 0x00000001
-- | 'MEMORY_HEAP_MULTI_INSTANCE_BIT' specifies that in a logical device
-- representing more than one physical device, there is a per-physical
-- device instance of the heap memory. By default, an allocation from such
-- a heap will be replicated to each physical device’s instance of the
-- heap.
pattern MEMORY_HEAP_MULTI_INSTANCE_BIT = MemoryHeapFlagBits 0x00000002

conNameMemoryHeapFlagBits :: String
conNameMemoryHeapFlagBits = "MemoryHeapFlagBits"

enumPrefixMemoryHeapFlagBits :: String
enumPrefixMemoryHeapFlagBits = "MEMORY_HEAP_"

showTableMemoryHeapFlagBits :: [(MemoryHeapFlagBits, String)]
showTableMemoryHeapFlagBits =
  [(MEMORY_HEAP_DEVICE_LOCAL_BIT, "DEVICE_LOCAL_BIT"), (MEMORY_HEAP_MULTI_INSTANCE_BIT, "MULTI_INSTANCE_BIT")]

instance Show MemoryHeapFlagBits where
  showsPrec p e = case lookup e showTableMemoryHeapFlagBits of
    Just s -> showString enumPrefixMemoryHeapFlagBits . showString s
    Nothing ->
      let MemoryHeapFlagBits x = e
      in  showParen (p >= 11) (showString conNameMemoryHeapFlagBits . showString " 0x" . showHex x)

instance Read MemoryHeapFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixMemoryHeapFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableMemoryHeapFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameMemoryHeapFlagBits)
            v <- step readPrec
            pure (MemoryHeapFlagBits v)
          )
    )

