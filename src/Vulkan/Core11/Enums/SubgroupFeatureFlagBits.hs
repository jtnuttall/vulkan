{-# language CPP #-}
-- No documentation found for Chapter "SubgroupFeatureFlagBits"
module Vulkan.Core11.Enums.SubgroupFeatureFlagBits  ( SubgroupFeatureFlags
                                                    , SubgroupFeatureFlagBits( SUBGROUP_FEATURE_BASIC_BIT
                                                                             , SUBGROUP_FEATURE_VOTE_BIT
                                                                             , SUBGROUP_FEATURE_ARITHMETIC_BIT
                                                                             , SUBGROUP_FEATURE_BALLOT_BIT
                                                                             , SUBGROUP_FEATURE_SHUFFLE_BIT
                                                                             , SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT
                                                                             , SUBGROUP_FEATURE_CLUSTERED_BIT
                                                                             , SUBGROUP_FEATURE_QUAD_BIT
                                                                             , SUBGROUP_FEATURE_PARTITIONED_BIT_NV
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
type SubgroupFeatureFlags = SubgroupFeatureFlagBits

-- | VkSubgroupFeatureFlagBits - Enum describing what group operations are
-- supported with subgroup scope
--
-- = See Also
--
-- 'SubgroupFeatureFlags'
newtype SubgroupFeatureFlagBits = SubgroupFeatureFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | #features-subgroup-basic# 'SUBGROUP_FEATURE_BASIC_BIT' specifies the
-- device will accept SPIR-V shader modules containing the
-- @GroupNonUniform@ capability.
pattern SUBGROUP_FEATURE_BASIC_BIT            = SubgroupFeatureFlagBits 0x00000001
-- | #features-subgroup-vote# 'SUBGROUP_FEATURE_VOTE_BIT' specifies the
-- device will accept SPIR-V shader modules containing the
-- @GroupNonUniformVote@ capability.
pattern SUBGROUP_FEATURE_VOTE_BIT             = SubgroupFeatureFlagBits 0x00000002
-- | #features-subgroup-arithmetic# 'SUBGROUP_FEATURE_ARITHMETIC_BIT'
-- specifies the device will accept SPIR-V shader modules containing the
-- @GroupNonUniformArithmetic@ capability.
pattern SUBGROUP_FEATURE_ARITHMETIC_BIT       = SubgroupFeatureFlagBits 0x00000004
-- | #features-subgroup-ballot# 'SUBGROUP_FEATURE_BALLOT_BIT' specifies the
-- device will accept SPIR-V shader modules containing the
-- @GroupNonUniformBallot@ capability.
pattern SUBGROUP_FEATURE_BALLOT_BIT           = SubgroupFeatureFlagBits 0x00000008
-- | #features-subgroup-shuffle# 'SUBGROUP_FEATURE_SHUFFLE_BIT' specifies the
-- device will accept SPIR-V shader modules containing the
-- @GroupNonUniformShuffle@ capability.
pattern SUBGROUP_FEATURE_SHUFFLE_BIT          = SubgroupFeatureFlagBits 0x00000010
-- | #features-subgroup-shuffle-relative#
-- 'SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT' specifies the device will accept
-- SPIR-V shader modules containing the @GroupNonUniformShuffleRelative@
-- capability.
pattern SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT = SubgroupFeatureFlagBits 0x00000020
-- | #features-subgroup-clustered# 'SUBGROUP_FEATURE_CLUSTERED_BIT' specifies
-- the device will accept SPIR-V shader modules containing the
-- @GroupNonUniformClustered@ capability.
pattern SUBGROUP_FEATURE_CLUSTERED_BIT        = SubgroupFeatureFlagBits 0x00000040
-- | #features-subgroup-quad# 'SUBGROUP_FEATURE_QUAD_BIT' specifies the
-- device will accept SPIR-V shader modules containing the
-- @GroupNonUniformQuad@ capability.
pattern SUBGROUP_FEATURE_QUAD_BIT             = SubgroupFeatureFlagBits 0x00000080
-- | #features-subgroup-partitioned# 'SUBGROUP_FEATURE_PARTITIONED_BIT_NV'
-- specifies the device will accept SPIR-V shader modules containing the
-- @GroupNonUniformPartitionedNV@ capability.
pattern SUBGROUP_FEATURE_PARTITIONED_BIT_NV   = SubgroupFeatureFlagBits 0x00000100

conNameSubgroupFeatureFlagBits :: String
conNameSubgroupFeatureFlagBits = "SubgroupFeatureFlagBits"

enumPrefixSubgroupFeatureFlagBits :: String
enumPrefixSubgroupFeatureFlagBits = "SUBGROUP_FEATURE_"

showTableSubgroupFeatureFlagBits :: [(SubgroupFeatureFlagBits, String)]
showTableSubgroupFeatureFlagBits =
  [ (SUBGROUP_FEATURE_BASIC_BIT           , "BASIC_BIT")
  , (SUBGROUP_FEATURE_VOTE_BIT            , "VOTE_BIT")
  , (SUBGROUP_FEATURE_ARITHMETIC_BIT      , "ARITHMETIC_BIT")
  , (SUBGROUP_FEATURE_BALLOT_BIT          , "BALLOT_BIT")
  , (SUBGROUP_FEATURE_SHUFFLE_BIT         , "SHUFFLE_BIT")
  , (SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT, "SHUFFLE_RELATIVE_BIT")
  , (SUBGROUP_FEATURE_CLUSTERED_BIT       , "CLUSTERED_BIT")
  , (SUBGROUP_FEATURE_QUAD_BIT            , "QUAD_BIT")
  , (SUBGROUP_FEATURE_PARTITIONED_BIT_NV  , "PARTITIONED_BIT_NV")
  ]

instance Show SubgroupFeatureFlagBits where
  showsPrec p e = case lookup e showTableSubgroupFeatureFlagBits of
    Just s -> showString enumPrefixSubgroupFeatureFlagBits . showString s
    Nothing ->
      let SubgroupFeatureFlagBits x = e
      in  showParen (p >= 11) (showString conNameSubgroupFeatureFlagBits . showString " 0x" . showHex x)

instance Read SubgroupFeatureFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixSubgroupFeatureFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableSubgroupFeatureFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameSubgroupFeatureFlagBits)
            v <- step readPrec
            pure (SubgroupFeatureFlagBits v)
          )
    )

