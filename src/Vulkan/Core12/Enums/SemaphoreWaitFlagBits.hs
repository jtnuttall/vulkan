{-# language CPP #-}
-- No documentation found for Chapter "SemaphoreWaitFlagBits"
module Vulkan.Core12.Enums.SemaphoreWaitFlagBits  ( SemaphoreWaitFlags
                                                  , SemaphoreWaitFlagBits( SEMAPHORE_WAIT_ANY_BIT
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
type SemaphoreWaitFlags = SemaphoreWaitFlagBits

-- | VkSemaphoreWaitFlagBits - Bitmask specifying additional parameters of a
-- semaphore wait operation
--
-- = See Also
--
-- 'SemaphoreWaitFlags'
newtype SemaphoreWaitFlagBits = SemaphoreWaitFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'SEMAPHORE_WAIT_ANY_BIT' specifies that the semaphore wait condition is
-- that at least one of the semaphores in
-- 'Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.SemaphoreWaitInfo'::@pSemaphores@
-- has reached the value specified by the corresponding element of
-- 'Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.SemaphoreWaitInfo'::@pValues@.
-- If 'SEMAPHORE_WAIT_ANY_BIT' is not set, the semaphore wait condition is
-- that all of the semaphores in
-- 'Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.SemaphoreWaitInfo'::@pSemaphores@
-- have reached the value specified by the corresponding element of
-- 'Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.SemaphoreWaitInfo'::@pValues@.
pattern SEMAPHORE_WAIT_ANY_BIT = SemaphoreWaitFlagBits 0x00000001

conNameSemaphoreWaitFlagBits :: String
conNameSemaphoreWaitFlagBits = "SemaphoreWaitFlagBits"

enumPrefixSemaphoreWaitFlagBits :: String
enumPrefixSemaphoreWaitFlagBits = "SEMAPHORE_WAIT_ANY_BIT"

showTableSemaphoreWaitFlagBits :: [(SemaphoreWaitFlagBits, String)]
showTableSemaphoreWaitFlagBits = [(SEMAPHORE_WAIT_ANY_BIT, "")]

instance Show SemaphoreWaitFlagBits where
  showsPrec p e = case lookup e showTableSemaphoreWaitFlagBits of
    Just s -> showString enumPrefixSemaphoreWaitFlagBits . showString s
    Nothing ->
      let SemaphoreWaitFlagBits x = e
      in  showParen (p >= 11) (showString conNameSemaphoreWaitFlagBits . showString " 0x" . showHex x)

instance Read SemaphoreWaitFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixSemaphoreWaitFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableSemaphoreWaitFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameSemaphoreWaitFlagBits)
            v <- step readPrec
            pure (SemaphoreWaitFlagBits v)
          )
    )

