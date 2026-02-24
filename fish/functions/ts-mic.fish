function ts-mic
    # Configuration
    set API_KEY "7N4I-IZAJ-DYNT-9GLD-BM95-7N5S"
    set HOST "localhost"
    set PORT 25639

    # 1. Query current status
    # We send 'whoami', which returns all client properties including mute status.
    # We use -w 1 (wait 1s) to ensure we catch the response before nc closes.
    set RESPONSE (echo -e "auth apikey=$API_KEY\nwhoami\nquit" | nc -w 1 $HOST $PORT)

    # 2. Check if currently muted
    if string match -q "*client_input_muted=1*" -- $RESPONSE
        # IS MUTED -> UNMUTE
        echo -e "auth apikey=$API_KEY\nclientupdate client_input_muted=0\nquit" | nc -w 0 $HOST $PORT
        echo "TeamSpeak: Microphone UNMUTED"
    else
        # IS UNMUTED -> MUTE
        echo -e "auth apikey=$API_KEY\nclientupdate client_input_muted=1\nquit" | nc -w 0 $HOST $PORT
        echo "TeamSpeak: Microphone MUTED"
    end
end
