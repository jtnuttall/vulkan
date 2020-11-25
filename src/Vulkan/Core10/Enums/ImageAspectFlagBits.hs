{-# language CPP #-}
-- No documentation found for Chapter "ImageAspectFlagBits"
module Vulkan.Core10.Enums.ImageAspectFlagBits  ( ImageAspectFlags
                                                , ImageAspectFlagBits( IMAGE_ASPECT_COLOR_BIT
                                                                     , IMAGE_ASPECT_DEPTH_BIT
                                                                     , IMAGE_ASPECT_STENCIL_BIT
                                                                     , IMAGE_ASPECT_METADATA_BIT
                                                                     , IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT
                                                                     , IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT
                                                                     , IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT
                                                                     , IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT
                                                                     , IMAGE_ASPECT_PLANE_2_BIT
                                                                     , IMAGE_ASPECT_PLANE_1_BIT
                                                                     , IMAGE_ASPECT_PLANE_0_BIT
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
type ImageAspectFlags = ImageAspectFlagBits

-- | VkImageAspectFlagBits - Bitmask specifying which aspects of an image are
-- included in a view
--
-- = See Also
--
-- 'Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.BindImagePlaneMemoryInfo',
-- 'ImageAspectFlags',
-- 'Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.ImagePlaneMemoryRequirementsInfo'
newtype ImageAspectFlagBits = ImageAspectFlagBits Flags
  deriving newtype (Eq, Ord, Storable, Zero, Bits, FiniteBits)

-- | 'IMAGE_ASPECT_COLOR_BIT' specifies the color aspect.
pattern IMAGE_ASPECT_COLOR_BIT              = ImageAspectFlagBits 0x00000001
-- | 'IMAGE_ASPECT_DEPTH_BIT' specifies the depth aspect.
pattern IMAGE_ASPECT_DEPTH_BIT              = ImageAspectFlagBits 0x00000002
-- | 'IMAGE_ASPECT_STENCIL_BIT' specifies the stencil aspect.
pattern IMAGE_ASPECT_STENCIL_BIT            = ImageAspectFlagBits 0x00000004
-- | 'IMAGE_ASPECT_METADATA_BIT' specifies the metadata aspect, used for
-- sparse
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#sparsememory sparse resource>
-- operations.
pattern IMAGE_ASPECT_METADATA_BIT           = ImageAspectFlagBits 0x00000008
-- | 'IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT' specifies /memory plane/ 3.
pattern IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT = ImageAspectFlagBits 0x00000400
-- | 'IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT' specifies /memory plane/ 2.
pattern IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT = ImageAspectFlagBits 0x00000200
-- | 'IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT' specifies /memory plane/ 1.
pattern IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT = ImageAspectFlagBits 0x00000100
-- | 'IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT' specifies /memory plane/ 0.
pattern IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT = ImageAspectFlagBits 0x00000080
-- | 'IMAGE_ASPECT_PLANE_2_BIT' specifies plane 2 of a /multi-planar/ image
-- format.
pattern IMAGE_ASPECT_PLANE_2_BIT            = ImageAspectFlagBits 0x00000040
-- | 'IMAGE_ASPECT_PLANE_1_BIT' specifies plane 1 of a /multi-planar/ image
-- format.
pattern IMAGE_ASPECT_PLANE_1_BIT            = ImageAspectFlagBits 0x00000020
-- | 'IMAGE_ASPECT_PLANE_0_BIT' specifies plane 0 of a /multi-planar/ image
-- format.
pattern IMAGE_ASPECT_PLANE_0_BIT            = ImageAspectFlagBits 0x00000010

conNameImageAspectFlagBits :: String
conNameImageAspectFlagBits = "ImageAspectFlagBits"

enumPrefixImageAspectFlagBits :: String
enumPrefixImageAspectFlagBits = "IMAGE_ASPECT_"

showTableImageAspectFlagBits :: [(ImageAspectFlagBits, String)]
showTableImageAspectFlagBits =
  [ (IMAGE_ASPECT_COLOR_BIT             , "COLOR_BIT")
  , (IMAGE_ASPECT_DEPTH_BIT             , "DEPTH_BIT")
  , (IMAGE_ASPECT_STENCIL_BIT           , "STENCIL_BIT")
  , (IMAGE_ASPECT_METADATA_BIT          , "METADATA_BIT")
  , (IMAGE_ASPECT_MEMORY_PLANE_3_BIT_EXT, "MEMORY_PLANE_3_BIT_EXT")
  , (IMAGE_ASPECT_MEMORY_PLANE_2_BIT_EXT, "MEMORY_PLANE_2_BIT_EXT")
  , (IMAGE_ASPECT_MEMORY_PLANE_1_BIT_EXT, "MEMORY_PLANE_1_BIT_EXT")
  , (IMAGE_ASPECT_MEMORY_PLANE_0_BIT_EXT, "MEMORY_PLANE_0_BIT_EXT")
  , (IMAGE_ASPECT_PLANE_2_BIT           , "PLANE_2_BIT")
  , (IMAGE_ASPECT_PLANE_1_BIT           , "PLANE_1_BIT")
  , (IMAGE_ASPECT_PLANE_0_BIT           , "PLANE_0_BIT")
  ]

instance Show ImageAspectFlagBits where
  showsPrec p e = case lookup e showTableImageAspectFlagBits of
    Just s -> showString enumPrefixImageAspectFlagBits . showString s
    Nothing ->
      let ImageAspectFlagBits x = e
      in  showParen (p >= 11) (showString conNameImageAspectFlagBits . showString " 0x" . showHex x)

instance Read ImageAspectFlagBits where
  readPrec = parens
    (   Text.ParserCombinators.ReadPrec.lift
        (do
          skipSpaces
          _ <- string enumPrefixImageAspectFlagBits
          asum ((\(e, s) -> e <$ string s) <$> showTableImageAspectFlagBits)
        )
    +++ prec
          10
          (do
            expectP (Ident conNameImageAspectFlagBits)
            v <- step readPrec
            pure (ImageAspectFlagBits v)
          )
    )

