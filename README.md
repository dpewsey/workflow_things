# workflow_things 😎
Mostly made to send a link when people ask
neat things I've found to improve my workflow
# tools 
fzf   
nvim  
nc  
oh my zsh  
jq  
bspwm  
sxhkd  
sshuttle  

# zshrc
```
# alias when you know the filter for speed
alias lq='function _lq() { logcli query -t -q --include-label=line '{NOMAD_JOB_NAME='\"${1}\"'}' };_lq'`
# alias for when you want interactive search - requires fzf
alias lql='function _lql() { logcli query -t -q --include-label=line '{NOMAD_JOB_NAME='\"$(logcli labels NOMAD_JOB_NAME | fzf --s    ync)\"'}' };_lql'
#bind key to open on ctrl+l
lqll() { logcli query -t -q --include-label=line '{NOMAD_JOB_NAME='\"$(logcli labels NOMAD_JOB_NAME | fzf --sync)\"'}' }
zle -N lqll
bindkey ^l lqll

alias watch='watch '
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

alias gpull='ls | xargs -t -I{} git -C {} pull'
```
# sxkhd
```
super + g
    query=$(echo ' ' | dmenu -p "Search:") && xdg-open https://google.com/search\?q\=$query
super + Print
    maim -s --format=png /dev/stdout | xclip -selection clipboard -t image/png -i
super + shift + p
    sudo sh -c "echo mem > /sys/power/state"
super + {space,f,t}
    bspc node --state \~{floating,fullscreen,tiled}
super + w
    systemd-run --user --pty --property MemoryHigh=2G firefox
super + shift + r
    pkill -USR1 -x sxhkd && notify-send "Sxhkd" "Configuration Reloaded"
```
# bash snippets
```
for i in $(cat server); do ssh $i 'bash -s' < script.sh ;done

for i in {0..10} ; do echo $i ; done

for i in $(cat list);do  [[ $(ssh ${i} 'systemctl status service | grep Active') =~ dead ]] &&  echo "$i = InActive" || echo "$i = Active" ; done

while :; do nc -zv -w 2 10.10.10.10 22 ; sleep 0.5 ;done

diff <(ssh nginx-1 'cat /etc/nginx/nginx.conf') <(ssh nginx-2 'cat /etc/nginx/nginx.conf')

seq 1 20 | xargs -P10 -I{} curl -s -o /dev/null -w "%{remote_ip} - %{http_code}\n" https://google.com

```
