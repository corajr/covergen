module CoverGenSpec (main, spec) where

import Test.Hspec
import Test.QuickCheck

import CoverGen

-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "coverGen" $ do
    it "generates a cover" $ pending
