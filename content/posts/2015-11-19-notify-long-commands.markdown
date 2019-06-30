---
layout: post
title:  "Get notified on slow commands"
date:   2015-11-19 00:00:00
categories:
  - fish
  - shell
aliases:
  - /fish/shell/2015/11/19/notify-long-commands.html
---
We are all lazy and we get distracted. One thing happens often… You run some slow command in your shell, switch to the browser, and bam… you are distracted.

What about sending an OS notification? Every time any command needs longer to run than let’s say 10 seconds then there is some notification to show so you can get right back to work each time.

Note: This is for [Fish shell](http://fishshell.com/), which is a modern shell and really nice to use.

![Fish shell](http://fishshell.com/assets/img/Terminal_Logo_CRT_Small.png)

__Update:__: There is a well written plugin with a logo now: https://github.com/fisherman/done

Ignore the rest of this post :)

After each command a new line is printed and the shell prints out the prompt.
At that time, we could provide a notification.

Let’s create a new file and call it functions/rprompt.fish

{{< highlight bash >}}
function fish_right_prompt
    if test $CMD_DURATION
        # Store duration of last command
        set duration (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}')

        # OS X notification when a command takes longer than notify_duration
        set notify_duration 10000
        set exclude_cmd "zsh|bash|less|man|more|ssh|drush php"
        if begin
                test $CMD_DURATION -gt $notify_duration
                and echo $history[1] | grep -vqE "^($exclude_cmd).*"
            end

            # Only show the notification if iTerm is not focused
            echo "
                tell application \"System Events\"
                    set activeApp to name of first application process whose frontmost is true
                    if \"iTerm\" is not in activeApp then
                        display notification \"Finished in $duration\" with title \"$history[1]\"
                    end if
                end tell
                " | osascript
        end
    end
end
{{< / highlight >}}

Reference rprompt.fish inside the main fish config file: <code>~/.config/fish/config.fish</code>:

{{< highlight bash >}}
. ~/.config/fish/functions/rprompt.fish
{{< / highlight >}}