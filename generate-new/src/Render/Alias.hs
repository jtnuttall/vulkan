module Render.Alias
  where

import           Relude                  hiding ( Reader
                                                , ask
                                                , lift
                                                )
import           Data.Text.Prettyprint.Doc
import           Polysemy
import           Polysemy.Reader

import           Spec.Parse
import           Haskell                       as H
import           Error
import           Render.Element
import           Render.Type

renderAlias
  :: (HasErr r, Member (Reader RenderParams) r) => Alias -> Sem r RenderElement
renderAlias Alias {..} = context aName $ do
  RenderParams {..} <- ask
  genRe ("alias " <> aName) $ case aType of
    TypeAlias -> do
      let n = mkTyName aName
          t = mkTyName aTarget
      tellExport (EType n)
      tellImport (Import (mkName (toString t)) False)
      tellDoc $ "type" <+> pretty n <+> "=" <+> pretty t
    _ -> throw "unhandled alias type"
