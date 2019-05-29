import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaults
        { manageHook = manageDocks <+> manageHook defaults
        , layoutHook = avoidStruts  $  layoutHook defaults
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , startupHook = setWMName "LG3D"
        }

defaults = defaultConfig
  { terminal = "urxvt"
  , modMask = mod4Mask     -- Rebind Mod to the Windows key
  , normalBorderColor  = "#666666"
  , focusedBorderColor = "#dddddd"
  }
