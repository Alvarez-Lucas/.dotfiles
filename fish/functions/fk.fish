function fk
    set -l pid (ps -ef | fzf --header="Select process to kill" --query="$argv" | awk '{print $2}')
    if test -n "$pid"
        echo "Killing $pid..."
        kill -9 $pid
    end
end
