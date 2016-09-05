{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
module CoverGen where

import Diagrams.Backend.SVG.CmdLine
import Diagrams.Prelude
import Data.Ratio ((%))

flake' :: Int -> Int -> Diagram B
flake' n 0 = regPoly n 1 # lwN 0.003
flake' n k = appends
               fCenter
               (zip vs (repeat (rotateBy (1/2) fOutside)))
  where vs = iterateN n (rotateBy (fromRational (1 % fromIntegral n)))
           . (if odd k then negated else id)
           $ unitY
        fCenter = flake' n (k-1)
        fOutside = fCenter # opacity (1.7 / fromIntegral k)

frontCover :: Diagram B
frontCover = padX 1.05 $ vcat [flake' 8 4, strutY 100]

cliMain :: IO ()
cliMain = mainWith frontCover
