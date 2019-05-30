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
        , handleEventHook = handleEventHook defaults <+> docksEventHook
        , startupHook = setWMName "LG3D"
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock;xset dpms force off")
        , ((mod4Mask .|. shiftMask, xK_t), sendMessage ToggleStruts)
        , ((mod4Mask .|. shiftMask, xK_o), spawn "amixer -D pulse sset Master 5%+")
        , ((mod4Mask .|. shiftMask, xK_p), spawn "amixer -D pulse sset Master 5%-")
        , ((mod4Mask .|. shiftMask .|. controlMask, xK_o), spawn "xbacklight -inc 10")
        , ((mod4Mask .|. shiftMask .|. controlMask, xK_p), spawn "xbacklight -dec 10")
        , ((0, xK_Print), spawn "ksnapshot")
        ]

defaults = defaultConfig
  { terminal = "urxvt"
  , modMask = mod4Mask     -- Rebind Mod to the Windows key
  , normalBorderColor  = "#666666"
  , focusedBorderColor = "#dddddd"
  }
