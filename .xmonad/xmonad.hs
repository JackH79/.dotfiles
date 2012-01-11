--------------------------------------------
-- ~/.xmonad/xmonad.hs
--
-- Jack Holborn (https://github.com/JackH79)
--
-- This Version: Jan 2012
--------------------------------------------

-- CONTENTS
--   imports       20
--   defaults      49
--   rodent rules  68
--   workspaces    72
--   hooks         75
--   layouts       97
--   dzen2        104
--   bindings     121


-- IMPORTS
import XMonad

import XMonad.Layout.Spacing          -- allow spaces around windows
import XMonad.Layout.NoBorders        -- no border for fullscreen layout
import XMonad.Layout.Named            -- custom layout names
import XMonad.Layout.Grid             -- add grid layout
import XMonad.Layout.MagicFocus       -- add magic focus layout modifyer
import XMonad.Layout.Minimize         -- add minimise windows
import XMonad.Layout.ToggleLayouts    -- add toggle layout keybind
import XMonad.Layout.Magnifier        -- add magnifier layout modifier
import XMonad.Actions.RotSlaves       -- rotates Windows anti-/clockwise

import XMonad.Hooks.DynamicLog        -- status output for dock
import XMonad.Hooks.ManageDocks       -- don't meddle with the dock
import XMonad.Hooks.ManageHelpers     (isDialog, isFullscreen, doFullFloat, doCenterFloat)

import XMonad.Util.Run (spawnPipe)    -- needed for spawnPipe (dzen)
import Data.Monoid
import System.Exit
import System.IO (hPutStrLn)          -- hPutStrLn

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Control.Monad (liftM2)         -- for viewShift


-- DEFAULTS
main = do
    status <- spawnPipe jackDzenStatus
    conky  <- spawnPipe jackDzenConky
    conky  <- spawnPipe jackDzenTime
    xmonad $ defaultConfig
        { terminal           = "urxvtc"
        , modMask            = mod4Mask
        , normalBorderColor  = "#1a1a1a"
        , focusedBorderColor = "#1f6080"
        , focusFollowsMouse  = jackFocusFollowsMouse
        , workspaces         = jackWorkspaces
        , keys               = jackKeys
        , layoutHook         = jackLayoutHook
        , manageHook         = jackManageHook
        , handleEventHook    = docksEventHook
        , logHook            = jackLogHook status
        }

-- RODENT RULES
jackFocusFollowsMouse :: Bool
jackFocusFollowsMouse = False

-- WORKSPACES
jackWorkspaces = [ "1-term" , "2-net" , "3-vid" , "4-pic" , "5-music" ] ++ map show [ 6..9 :: Int ]

-- HOOKS
jackManageHook :: ManageHook
jackManageHook = composeAll $ concat
    [ [ manageDocks                                      ]
    , [ jackRules                                        ]
    , [ manageHook defaultConfig                         ]
    , [ isDialog     --> doCenterFloat                   ]
    , [ isFullscreen --> doF W.focusDown <+> doFullFloat ]
    ]

jackRules = composeAll
    [ className =? "MPlayer"     --> (doFloat <+> viewShift "3-vid")
    , className =? "Vlc"         --> viewShift "3-vid"
    , className =? "sxiv"        --> viewShift "4-pic"
    , className =? "Firefox"     --> doShift   "2-net"
    , className =? "Opera"       --> doShift   "2-net"
    , title     =? "ncmpcpp"     --> viewShift "5-music"
    , title     =? "wicd-curses" --> viewShift "9"
    , className =? "Gimp"        --> doFloat
    ]
    where viewShift = doF . liftM2 (.) W.greedyView W.shift

-- LAYOUTS
jackLayoutHook = smartBorders $ toggleLayouts Full $ ( tile ||| focus ||| grid ||| full )
    where tile	= named "tile"  $ avoidStruts $ spacing 3 $ minimize              $ Tall 1 (3/100) (1/2)
          focus	= named "focus" $ avoidStruts $ spacing 3 $ minimize $ magicFocus $ Tall 1 (3/100) (3/4)
          grid  = named "grid"  $ avoidStruts $ spacing 3 $ minimize $ Grid
          full	= named "full"  $ noBorders   $ Full

-- DZEN2
jackLogHook h  = dynamicLogWithPP $ jackDzenPP { ppOutput = hPutStrLn h }
jackDzenStyle  = " -fg '#b2b2b2' -bg '#1a1a1a' -fn '-*-terminus-*-*-*-*-10-*-*-*-*-*-*-*'"
jackDzenStatus = "dzen2 -w '1000' -ta 'l'" ++ jackDzenStyle
jackDzenConky  = "conky -c /home/jack/.xmonad/conkyrc | dzen2 -y '788' -w '1280' -ta 'r'" ++ jackDzenStyle
jackDzenTime   = "conky -c /home/jack/.xmonad/conkytime | dzen2 -x '1000' -w '280' -ta 'r'" ++ jackDzenStyle
jackDzenPP     :: PP
jackDzenPP     = dzenPP
    { ppCurrent         = dzenColor "#1a1a1a" "#329bcd" . pad
    , ppHidden          = dzenColor "#b2b2b2" ""        . pad
    , ppHiddenNoWindows = dzenColor "#1a1a1a" ""        . pad
    , ppUrgent          = dzenColor "#ffffff" "#ee0000" . pad
    , ppLayout          = dzenColor "#9bcd32" ""        . pad
    , ppSep             = "^fg(#9bcd32)::^fg()"
    , ppTitle           = dzenColor "#329bcd" ""        . pad
    }

-- BINDINGS
jackKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,                 xK_Return       ), spawn $ XMonad.terminal conf)
    , ((modm,                 xK_r            ), spawn "urxvtc -e ranger")
    , ((modm,                 xK_m            ), spawn "urxvtc -e ncmpcpp")
    , ((modm,                 xK_d            ), spawn "urxvtc -e wicd-curses")
    , ((modm,                 xK_grave        ), spawn "urxvtc -e htop")
    , ((modm,                 xK_t            ), spawn "remind_call")
    , ((modm,                 xK_o            ), spawn "opera")
    , ((modm,                 xK_f            ), spawn "firefox")
    , ((modm .|. shiftMask,   xK_z            ), spawn "slock")
    , ((modm,                 xK_p            ), spawn "exe=`dmenu_run -fn -*-terminus-*-*-*-*-12-*-*-*-*-*-*-* -nb '#1a1a1a' -nf '#b2b2b2' -sb '#329bcd' -sf '#1a1a1a'` && eval \"exec $exe\"")
    -- Volume / MPD control
    , ((modm,                 xK_F7           ), spawn "mpc prev")
    , ((modm,                 xK_F8           ), spawn "mpc toggle")
    , ((modm,                 xK_F9           ), spawn "mpc next")
    , ((modm,                 xK_F10          ), spawn "amixer -q sset Master toggle")
    , ((modm,                 xK_F11          ), spawn "amixer -q sset Master 2dB-")
    , ((modm,                 xK_F12          ), spawn "amixer -q sset Master 2dB+")
    -- Windows
    , ((modm,                 xK_Tab          ), windows W.focusDown)
    , ((modm,                 xK_Left         ), windows W.focusDown)
    , ((modm,                 xK_Right        ), windows W.focusUp)
    , ((modm .|. shiftMask,   xK_Left         ), windows W.swapDown)
    , ((modm .|. shiftMask,   xK_Right        ), windows W.swapUp)
    , ((modm .|. controlMask, xK_Left         ), sendMessage Shrink)
    , ((modm .|. controlMask, xK_Right        ), sendMessage Expand)
    , ((modm .|. shiftMask,   xK_r            ), refresh)
    -- rotate Windows anti-/clockwise
    , ((modm .|. shiftMask,   xK_bracketleft  ), rotAllUp)
    , ((modm .|. shiftMask,   xK_bracketright ), rotAllDown)
    -- maximise
    , ((modm .|. shiftMask,   xK_f            ), sendMessage ToggleLayout)
    -- minimise
    , ((modm,                 xK_n            ), withFocused minimizeWindow)
    , ((modm .|. shiftMask,   xK_n            ), sendMessage RestoreNextMinimizedWin)

    , ((modm .|. shiftMask,   xK_c            ), kill)
    -- swap focused window to master area
    , ((modm .|. shiftMask,   xK_Return       ), windows W.swapMaster)

    -- push window back into tiling
    , ((modm .|. shiftMask,   xK_t            ), withFocused $ windows . W.sink)
    -- change the number of windows in the master area
    , ((modm,                 xK_comma        ), sendMessage (IncMasterN 1))
    , ((modm,                 xK_period       ), sendMessage (IncMasterN (-1)))
    
    -- Layouts
    , ((modm,                 xK_space        ), sendMessage NextLayout)
    , ((modm .|. shiftMask,   xK_space        ), setLayout $ XMonad.layoutHook conf)
    
    -- XMonad
    , ((modm,                 xK_q            ), spawn "killall conky dzen2; xmonad --recompile; xmonad --restart")
    , ((modm .|. shiftMask,   xK_q            ), io (exitWith ExitSuccess))
    ]
    ++
    -- Workspaces
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
    ]
