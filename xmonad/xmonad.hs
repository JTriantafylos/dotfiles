import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.WorkspaceHistory
import XMonad.Util.Run

wallpaper = "/home/james/.dotfiles/wallpaper/wallpaper.jpg"

main = do
    xmproc0 <- spawnPipe "xmobar"
    xmonad desktopConfig {
        terminal    = "termite"
        , modMask     = mod1Mask -- Left alt
        , startupHook = do
               startupHook desktopConfig
               spawn ("feh --bg-scale " ++ wallpaper)
        , logHook = dynamicLogWithPP $ def { ppOutput = hPutStrLn xmproc0 }
    }

