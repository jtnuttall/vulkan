{-# language CPP #-}
-- No documentation found for Chapter "QueryType"
module Vulkan.Core10.Enums.QueryType  (QueryType( QUERY_TYPE_OCCLUSION
                                                , QUERY_TYPE_PIPELINE_STATISTICS
                                                , QUERY_TYPE_TIMESTAMP
                                                , QUERY_TYPE_PERFORMANCE_QUERY_INTEL
                                                , QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV
                                                , QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR
                                                , QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR
                                                , QUERY_TYPE_PERFORMANCE_QUERY_KHR
                                                , QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT
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
-- | VkQueryType - Specify the type of queries managed by a query pool
--
-- = See Also
--
-- 'Vulkan.Core10.Query.QueryPoolCreateInfo',
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.cmdWriteAccelerationStructuresPropertiesKHR',
-- 'Vulkan.Extensions.VK_NV_ray_tracing.cmdWriteAccelerationStructuresPropertiesNV',
-- 'Vulkan.Extensions.VK_KHR_acceleration_structure.writeAccelerationStructuresPropertiesKHR'
newtype QueryType = QueryType Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'QUERY_TYPE_OCCLUSION' specifies an
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-occlusion occlusion query>.
pattern QUERY_TYPE_OCCLUSION                     = QueryType 0
-- | 'QUERY_TYPE_PIPELINE_STATISTICS' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-pipestats pipeline statistics query>.
pattern QUERY_TYPE_PIPELINE_STATISTICS           = QueryType 1
-- | 'QUERY_TYPE_TIMESTAMP' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-timestamps timestamp query>.
pattern QUERY_TYPE_TIMESTAMP                     = QueryType 2
-- | 'QUERY_TYPE_PERFORMANCE_QUERY_INTEL' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-performance-intel Intel performance query>.
pattern QUERY_TYPE_PERFORMANCE_QUERY_INTEL       = QueryType 1000210000
-- No documentation found for Nested "VkQueryType" "VK_QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV"
pattern QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = QueryType 1000165000
-- | 'QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#acceleration-structure-copying serialization acceleration structure size query>
pattern QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = QueryType 1000150001
-- | 'QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#acceleration-structure-copying acceleration structure size query>.
pattern QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = QueryType 1000150000
-- | 'QUERY_TYPE_PERFORMANCE_QUERY_KHR' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-performance performance query>.
pattern QUERY_TYPE_PERFORMANCE_QUERY_KHR         = QueryType 1000116000
-- | 'QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT' specifies a
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#queries-transform-feedback transform feedback query>.
pattern QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT = QueryType 1000028004
{-# complete QUERY_TYPE_OCCLUSION,
             QUERY_TYPE_PIPELINE_STATISTICS,
             QUERY_TYPE_TIMESTAMP,
             QUERY_TYPE_PERFORMANCE_QUERY_INTEL,
             QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV,
             QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR,
             QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR,
             QUERY_TYPE_PERFORMANCE_QUERY_KHR,
             QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT :: QueryType #-}

conNameQueryType :: String
conNameQueryType = "QueryType"

enumPrefixQueryType :: String
enumPrefixQueryType = "QUERY_TYPE_"

showTableQueryType :: [(QueryType, String)]
showTableQueryType =
  [ (QUERY_TYPE_OCCLUSION                    , "OCCLUSION")
  , (QUERY_TYPE_PIPELINE_STATISTICS          , "PIPELINE_STATISTICS")
  , (QUERY_TYPE_TIMESTAMP                    , "TIMESTAMP")
  , (QUERY_TYPE_PERFORMANCE_QUERY_INTEL      , "PERFORMANCE_QUERY_INTEL")
  , (QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV, "ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV")
  , (QUERY_TYPE_ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR, "ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR")
  , (QUERY_TYPE_ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR, "ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR")
  , (QUERY_TYPE_PERFORMANCE_QUERY_KHR        , "PERFORMANCE_QUERY_KHR")
  , (QUERY_TYPE_TRANSFORM_FEEDBACK_STREAM_EXT, "TRANSFORM_FEEDBACK_STREAM_EXT")
  ]

instance Show QueryType where
  showsPrec p e = case lookup e showTableQueryType of
    Just s -> showString enumPrefixQueryType . showString s
    Nothing ->
      let QueryType x = e in showParen (p >= 11) (showString conNameQueryType . showString " " . showsPrec 11 x)

instance Read QueryType where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixQueryType
          asum ((\(e, s) -> e <$ string s) <$> showTableQueryType)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameQueryType)
            v <- step readPrec
            pure (QueryType v)
          )
    )

