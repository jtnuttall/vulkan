{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}

module Documentation.RunAsciiDoctor
  ( manTxtToDocbook
  ) where

import           Data.Semigroup
import           Data.Text
import qualified Data.Text               as T
import qualified Data.Text.Lazy          as T (toStrict)
import           Data.Text.Lazy.Encoding
import           Say
import           System.Environment
import           System.Exit
import           System.FilePath
import           System.Process.Typed

-- | Convert a man page from the Vulkan-Docs repo into docbook format using
-- 'asciidoctor'
--
-- This function also applies a few fixes to the output to make it more
-- friendly for Pandoc.
manTxtToDocbook
  :: FilePath
  -- ^ The 'Vulkan-Docs' directory, necessary to find plugins
  -> FilePath
  -- ^ The path to the man page to translate
  -> IO (Either Text Text)
  -- ^ Either an error if something went wrong, or the docbook xml
manTxtToDocbook vkPath manTxt =
  fmap fixupDocbookOutput <$> asciidoctor vkPath manTxt

asciidoctor
  :: FilePath
  -- ^ The 'Vulkan-Docs' directory, necessary to find plugins
  -> FilePath
  -- ^ The path to the man page to translate
  -> IO (Either Text Text)
asciidoctor vkPath manTxt = do
  let asciidoctorPath = "asciidoctor"
      args =
        [ "-r" , vkPath </> "config/tilde_open_block.rb"
        , "-r" , vkPath </> "config/vulkan-macros.rb"
        , "-r" , "asciidoctor-mathematical"
        , "--backend"
        , "docbook5"
        , manTxt
        , "--out-file" , "-"
        ]
      p = setStdin closed $ proc asciidoctorPath args
  (exitCode, out, err) <- readProcess p
  case exitCode of
    ExitFailure e ->
      pure
        .  Left
        $  "asciidoctor failed with code " <> T.pack (show e)
        <> ":\ncommand: "
        <> T.pack asciidoctorPath <> T.concat ((" " <>) . T.pack <$> args)
        <> "\noutput:" <> T.toStrict (decodeUtf8 err)
    ExitSuccess -> pure . Right $ T.toStrict (decodeUtf8 out)

-- | Some hacky replaces in the docbook XML to make pandoc cope better
-- TODO: Write an asciidoctor plugin to do these
fixupDocbookOutput :: Text -> Text
fixupDocbookOutput = replaceTag "sidebar" Nothing "section"
  . replaceTag "strong" (Just "class=\"purple\"") "emphasis"

replaceTag
  :: Text
  -- ^ Tag name
  -> Maybe Text
  -- ^ Optional attribute to search for
  -> Text
  -- ^ Replacement
  -> Text
  -- ^ Haystack
  -> Text
replaceTag needle maybeAttr replacement =
  let attr = maybe "" (" " <>) maybeAttr
  in  T.replace ("<" <> needle <> attr <> ">") ("<" <> replacement <> ">")
        . T.replace ("</" <> needle <> ">") ("</" <> replacement <> ">")

main :: IO ()
main = do
  [d, m] <- getArgs
  manTxtToDocbook d m >>= \case
    Left  e -> sayErr e
    Right d -> say d
