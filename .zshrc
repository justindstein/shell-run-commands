##########
## Path ##
##########

# WC SAMPLE
#  find . -name '*.java' | xargs -I {} cat {} | wc -l

# $HOME/bin is amazon-recommended best-practice
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/apache-maven-3.9.8/bin:$PATH

###########################
## Environment Variables ##
###########################

# JDK
export JAVA_HOME=$HOME/bin/jdk8u412-b08
export PATH=$JAVA_HOME/bin:$PATH

####################
## Command prompt ##
####################

PS1=$'%~ : '

##################
## Core aliases ##
##################

alias zshrc='vim ~/.zshrc'
alias bz='source ~/.zshrc'

alias whosts='vim ~/c/Windows/System32/Drivers/etc/hosts'
alias hosts='vim /etc/hosts'

alias h='history'

#alias o='explorer.exe .'
#alias o..='explorer.exe ..'

alias gitdiff='git diff --staged > ~/desktop/my.diff'
alias mci='mvn clean install'
alias gst='git status | gstrip'
alias ng='ngrok http host.docker.internal:8080'

###################
## Shell aliases ##
###################

# Open a file or folder in Windows File Explorer from WSL using explorer.exe.
# Example: o ./README.md — this will open the file in the default Windows app.
o() {
  explorer.exe "$1"
}

# Recursive grep that ignores binary files and suppresses error output.
# Example: gr pattern — searches all files in the current directory tree.
function gr() {
  grep -ir $* --binary-files=without-match . 2>/dev/null
}

# Recursive grep that returns only unique filenames containing the pattern.
# Ignores binary files and suppresses errors. Example: grl pattern
function grl() {
  grep -irl $* --binary-files=without-match . 2>/dev/null
}

# Search for files by name and grep them for a pattern (case-insensitive).
# Example: fgr "filename" "pattern" — finds all files matching "filename" and searches them for "pattern".
#function fgr() {
#  find ./ -name $1 -type f -exec grep -iH $2 {} +
#}

# Search for files matching a filename pattern and filter their contents using one or more grep patterns.
# Useful for narrowing down search results with multiple keywords.
# Example: fgr "*.log" "error" "timeout" "user123"
function fgr() {
  if [[ $# -lt 2 ]]; then
    echo "Usage: fgr <filename> <pattern1> [pattern2] [pattern3] ..."
    return 1
  fi

  # Extract the filename pattern
  local filename_pattern="$1"
  shift # Remove the first argument (filename pattern)

  # Run find and apply the first grep command
  local cmd="find ./ -name \"$filename_pattern\" -type f -exec grep -iH \"$1\" {} +"
  shift # Remove the first grep pattern

  # Chain additional grep filters
  while [[ $# -gt 0 ]]; do
    cmd+=" | grep -i \"$1\""
    shift
  done

  # Execute the constructed command
  eval "$cmd"
}

########################
## Navigation aliases ##
########################

alias c='cd ~/c/'
alias desktop='cd ~/desktop/'
alias usr='cd ~/usr/'
alias dev='cd ~/dev/'
alias trunk='cd ~/dev/trunk'
alias bin='cd ~/bin/'
alias tmp='cd ~/tmp/'
alias app='cd ~/app/'
alias ws='cd ~/dev/workflow-service'

alias ~='cd ~'
alias .='cd ..'
alias ..='cd ..; cd ..'
alias ...='cd ..; cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..; cd ..'
alias .....='cd ..; cd ..; cd ..; cd ..; cd ..'
alias ......='cd ..; cd ..; cd ..; cd ..; cd ..; cd ..'
alias .......='cd ..; cd ..; cd ..; cd ..; cd ..; cd ..; cd ..'

########################
## WSL Customizations ##
########################

# Check if running on WSL 2 and set up port forwarding
# function brdconfig() {
# if grep -q "Microsoft" /proc/version; then
#  ip=$(hostname -I | awk '{print $1}')
#  if [[ -n "$ip" ]]; then
#    powershell.exe -Command "netsh interface portproxy set v4tov4 listenport=1433 listenaddress=127.0.0.1 connectport=1433 connectaddress=$ip"
#  fi
#fi
#}

######################
## Disable zsh beep ##
######################

# Per https://blog.vghaisas.com/zsh-beep-sound/#tl-dr
# Turn off all beeps
# unsetopt BEEP
# Turn off autocomplete beeps
# unsetopt LIST_BEEP
