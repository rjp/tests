set volume 2
open location "spotify:user:zimpenfish:starred"
tell application "Spotify"
    set the sound volume to 0
    play
    repeat 10 times
        if sound volume is less than 80 then
            set sound volume to (sound volume + 10)
            delay 3
        end if
    end repeat
end tell
