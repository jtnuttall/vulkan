{-# LANGUAGE ApplicativeDo   #-}
{-# LANGUAGE RecordWildCards #-}

module Spec.Savvy.Command
  ( Command(..)
  , specCommands
  ) where

import           Data.Either.Validation
import           Data.Text
import           Data.Traversable
import qualified Spec.Command           as P
import           Spec.Savvy.Error
import           Spec.Savvy.Type
import qualified Spec.Spec              as P

data Command = Command
  { cName       :: Text
  , cReturnType :: Type
  , cParameters :: [Parameter]
  , cComment    :: Maybe Text
  }
  deriving (Show)

data Parameter = Parameter
  { pName :: Text
  , pType :: Type
  }
  deriving (Show)

specCommands :: TypeParseContext -> P.Spec -> Validation [SpecError] [Command]
specCommands pc P.Spec {..} = for sCommands $ \P.Command {..} -> do
  cReturnType <- eitherToValidation $ stringToType pc cReturnType
  cParameters <- for cParameters $ \P.Parameter {..} -> do
    pType <- eitherToValidation $ stringToType pc pType
    pure Parameter {..}
  pure Command {..}
