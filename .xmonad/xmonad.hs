-- Imports
import XMonad
import System.IO
import System.Exit

import Control.Monad(liftM2)

import XMonad.Layout
import XMonad.Layout.Spacing
import XMonad.Layout.TwoPane
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
-- import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W

import XMonad.ManageHook

-- import Data.Bits ((.|.))
-- import Data.Monoid
import Data.Map( fromList )
import Data.Monoid( mappend )
-- import qualified Data.Map as M

import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig( additionalKeys )
-- import XMonad.Util.Dzen

-- import XMonad.Actions.CopyWindow( copy, kill1, copyToAll, killAllOtherCopies )
-- import XMonad.Actions.CycleWS
-- import XMonad.Actions.UpdatePointer
-- import System.Exit

modm = mod4Mask

myKeys =
  [
      (( mod4Mask, xK_g  ), spawn "google-chrome" )
    , (( mod4Mask, xK_w  ), spawn "firefox" )
    , (( mod4Mask, xK_s  ), spawn "skype" )
    , (( mod4Mask, xK_m  ), spawn "banshee" )
    , (( mod4Mask, xK_f  ), spawn "pcmanfm" )
    -- , (( mod4Mask, xK_f  ), sendMessage ToggleLayout )
    , (( mod4Mask, xK_o  ), spawn "openoffice.org" )
    , (( mod4Mask .|. shiftMask, xK_r  ), do
      screenWorkspace 0 >>= flip whenJust ( windows.W.view )
      ( windows . W.greedyView ) "1"
      screenWorkspace 1 >>= flip whenJust ( windows.W.view )
      ( windows . W.greedyView ) "8" )
    ]

myHardware =
  [
      ((        0, 0x1008FF11 ), spawn "amixer set Master 5%-" )
    , ((        0, 0x1008FF13 ), spawn "amixer set Master 5%+" )
    , ((        0, 0x1008FF12 ), spawn "amixer set Master toggle" )
  ]

myManageHookShift = composeAll $
  [
    className =? "banshee" --> viewShift "Music"
  ]
  where viewShift = doF.liftM2 (.) W.view W.shift

{-
myManageHookFloat = composeAll $
  [
    className =? "firefox" --> doFloat
  ]
-}

{-
myLayout =    ( spacing 8 $ ResizableTall 1 ( 1/100 ) ( 4/7 ) [] )
          ||| ( spacing 8 $ TwoPane ( 1/100 ) ( 4/7 ) )
          ||| ( spacing 3 $ ThreeColMid 1 ( 1/100 ) ( 16/35 ) )
          ||| ( spacing 8 $ Mirror 0.5 [] )
-}
myLayout = tile ||| mtile ||| full ||| three ||| tilem2 ||| tilem3
  where
    rt = ResizableTall 1 (2/100) (1/2) []
    rt2 = ResizableTall 2 ( 1/100 ) ( 1/2 ) []
    rt3 = ResizableTall 3 ( 1/100 ) ( 1/2 ) []
    tcm = ThreeColMid 1 ( 1/100 ) ( 16/35 )
    tile  = renamed [Replace "[]="] $ spacing 8 $ smartBorders rt
    --mtile = renamed [Replace "M[]="]$ spacing 8 $ smartBorders $ ( Mirror ( Mirror ( Mirror rt ) ) )
    mtile = renamed [Replace "M[]="]$ spacing 1 $ noBorders $ Mirror rt
    full  = renamed [Replace "[]"]  $ spacing 8 $ noBorders Full
    three = renamed [Replace "[=]"] $ spacing 3 $ smartBorders tcm
    tilem2 = renamed [Replace "[]=M2"]$ spacing 1 $ noBorders $ Mirror rt2
    tilem3 = renamed [Replace "[]=M3"]$ spacing 1 $ noBorders $ Mirror rt3


-- myWorkspaces = [ "  Main  ", "  Browser  ", "  Media  ", "  Work  ", "  Tray  ", "  Tmp1  ", "  Tmp2  ", "  Tmp3  ", "  Music  " ]

-- myWorkspaces = [ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 0 ", " - ", " ^ " ]

myWorkspaces = [ " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 " ]

-- myWorkspaces = ["1:work","2:web"] ++ map show [3..9]


main = do
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    { -- manageHook = manageDocks <+> manageHook defaultConfig
      manageHook = myManageHookShift  <+> myManageHookShift
    , workspaces = myWorkspaces
    , layoutHook = avoidStruts $ myLayout
    , logHook = dynamicLogWithPP $ xmobarPP
      { ppOutput = hPutStrLn xmproc
      , ppTitle = xmobarColor "green" "" . shorten 50
      -- , fadeInactiveLogHook 0xdddddddd
      }
    , terminal           = "gnome-terminal"
    , borderWidth        = 2
    , normalBorderColor  = "#333333"
    , focusedBorderColor = "#cd8b00"
    , modMask = mod4Mask
    }
    `additionalKeys` myKeys
    `additionalKeys` myHardware

