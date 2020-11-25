{-# language CPP #-}
-- No documentation found for Chapter "DependencyFlagBits"
module Vulkan.Core10.Enums.DependencyFlagBits  ( DependencyFlags
                                               , DependencyFlagBits( DEPENDENCY_BY_REGION_BIT
                                                                   , DEPENDENCY_VIEW_LOCAL_BIT
                                                                   , DEPENDENCY_DEVICE_GROUP_BIT
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
type DependencyFlags = DependencyFlagBits

-- | VkDependencyFlagBits - Bitmask specifying how execution and memory
-- dependencies are formed
--
-- = See Also
--
-- 'DependencyFlags'
newtype DependencyFlagBits = DependencyFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'DEPENDENCY_BY_REGION_BIT' specifies that dependencies will be
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-local>.
pattern DEPENDENCY_BY_REGION_BIT    = DependencyFlagBits 0x00000001
-- | 'DEPENDENCY_VIEW_LOCAL_BIT' specifies that a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-barriers-subpass-self-dependencies subpass has more than one view>.
pattern DEPENDENCY_VIEW_LOCAL_BIT   = DependencyFlagBits 0x00000002
-- | 'DEPENDENCY_DEVICE_GROUP_BIT' specifies that dependencies are
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-device-local-dependencies non-device-local dependency>.
pattern DEPENDENCY_DEVICE_GROUP_BIT = DependencyFlagBits 0x00000004

conNameDependencyFlagBits :: String
conNameDependencyFlagBits = "DependencyFlagBits"

enumPrefixDependencyFlagBits :: String
enumPrefixDependencyFlagBits = "DEPENDENCY_"

showTableDependencyFlagBits :: [(DependencyFlagBits, String)]
showTableDependencyFlagBits =
  [ (DEPENDENCY_BY_REGION_BIT   , "BY_REGION_BIT")
  , (DEPENDENCY_VIEW_LOCAL_BIT  , "VIEW_LOCAL_BIT")
  , (DEPENDENCY_DEVICE_GROUP_BIT, "DEVICE_GROUP_BIT")
  ]

instance Show DependencyFlagBits where
  showsPrec p e = case lookup e showTableDependencyFlagBits of
    Just s -> showString enumPrefixDependencyFlagBits . showString s
    Nothing ->
      let DependencyFlagBits x = e
      in  showParen (p >= 11) (showString conNameDependencyFlagBits . showString " 0x" . showHex x)

instance Read DependencyFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixDependencyFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableDependencyFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameDependencyFlagBits)
            v <- step readPrec
            pure (DependencyFlagBits v)
          )
    )

