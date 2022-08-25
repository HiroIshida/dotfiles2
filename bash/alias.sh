alias kill='kill -9'
alias f='kill -9 %%; kill -9 %%'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias dc='cd'
alias cp='cp -r'
alias grep='grep --color=auto'
alias gr='grep'
alias grr='gr -r'
alias ..='cd ../'
alias ....='cd ../../'
alias j='julia --project'

alias a='./action.sh'
alias sudo='sudo '

alias addj='$HOME/dotfiles/script/editjump.py'

alias sshjsk4='ssh h-ishida@aries.jsk.t.u-tokyo.ac.jp -t ssh h-ishida@dlbox4.jsk.imi.i.u-tokyo.ac.jp'
alias sshjsk5='ssh h-ishida@aries.jsk.t.u-tokyo.ac.jp -t ssh h-ishida@dlbox5.jsk.imi.i.u-tokyo.ac.jp'
alias ssharies='ssh h-ishida@aries.jsk.t.u-tokyo.ac.jp'

# mohou commands

function mohou_from () {
    pn=$1
    from=$2
    rsync -av --progress $from:~/.mohou/$pn ~/.mohou/
}

function mohou_to () {
    pn=$1
    to=$2
    rsync -av --progress ~/.mohou/$pn $to:~/.mohou/
}

function mohou_diff () {
    cd ~/python/mohou && git --no-pager diff && git branch | grep "*" && echo "checked mohou"
    cd ~/python/bunsetsu && git --no-pager diff && git branch | grep "*" && echo "checked bunsetsu"
    cd ~/misc/ieee-icra-2023 && git --no-pager diff && git branch | grep "*" && echo "checked icra"
}

# python
alias argrep='grep argparse -A 20'

# alias related to git
source /usr/share/bash-completion/completions/git # to use auto compleation
alias ggc='git commit'
alias ggcp='git cherry-pick'
alias ggcpa='git cherry-pick --abort'
alias ggcpc='git cherry-pick --continue'
alias ggf='git fetch'
alias gga='git add'
alias ggap='git add -p'
alias ggd='git diff'
alias ggdc='git diff --cached'
alias ggdn='git diff --name-only'
alias ggdw='git diff --word-diff'
alias ggr='git reset'
alias ggrh='git reset HEAD'
alias ggt='git tree'
alias ggs='git stash'
alias ggsp='git stash pop'
alias ggm='git merge'
alias ggch='git checkout'
__git_complete ggch _git_checkout

alias ggbd='git branch -D'
alias ggchm='git checkout master'
alias ggcl='git clone'
alias ggp='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias ggupdate='git fetch origin && git rebase origin/$(git rev-parse --abbrev-ref HEAD)'
alias ggpf='ggp -f'
alias ggsa='git submodule add'
alias ggri='git rebase -i'
alias ggbd='git branch -D'

alias pudb="python -m pudb"
alias vbash='vim ~/.bashrc'
alias vbash2='vim ~/.bash/user_specific.sh'
alias vbash3='vim ~/.bash/alias.sh'
alias vlog='vim ~/Dropbox/articles/logs/log'
alias llog='less ~/Dropbox/articles/logs/log'
alias sbash='source ~/.bashrc'
alias vvim='vim ~/.vimrc'
alias gno='xdg-open .'
alias v='vim'
alias g='gedit'
alias addj='editjump.py'

# jump alias for ros
if [ -d "/opt/ros/noetic" ] || [ -d "/opt/ros/melodic" ]; then
  alias workstation='export ROS_MASTER_URI=http://hiro-workstation:11311'
  alias pr2='rossetip; rossetmaster pr1040'
  alias pr8='rossetip; rossetmaster pr1012'
  alias prw='rossetip; rossetmaster 133.11.216.79'
  alias ft='rossetip; rossetmaster fetch15'
  alias e='rlwrap roseus'
  # alias roseus='rlwrap roseus'

  alias rc='roscd'
  alias rr='rosrun'
  alias rl='roslaunch'
  # rostopic
  alias rt='rostopic'
  alias rtb='rostopic bw'
  alias rte='rostopic echo'
  alias rth='rostopic hz'
  alias rti='rostopic info'
  alias rtl='rostopic list'
  alias rtt='rostopic type'
  alias rtlg='rostopic list | grep -r'
  # rosnode
  alias rn='rosnode'
  alias rni='rosnode info'
  alias rnl='rosnode list'
  alias rnk='rosnode kill'


  # other
  alias rsl='rossetlocal'
  alias cbt="catkin bt"

  expand_xacro (){
    rosrun xacro xacro $1 --inorder >$2
  }

  show_urdf (){
    roslaunch urdf_tutorial display.launch model:=$1
  }

  show_xacro(){
    expand_xacro $1 tmp
    show_urdf tmp
    rm tmp
  }

fi

if [ -d "/opt/ros/galactic/" ]; then
    alias clear_log='rm -rf /home/h-ishida/.ros/log'
    # roscd
    _ros2pkglist() {
        _init_completion || return
        COMPREPLY=( $(compgen -W '$(ros2 pkg list)' -- "$cur") )
    }

    function roscd () {
        local prefix path src_path pkg_path
        prefix=${1%/}
        if [ $prefix ]; then
            path=`ros2 pkg prefix ${prefix} --share`
            src_path=`readlink -f $path/package.xml`
            pkg_path=(${src_path//package/ })
            cd ${pkg_path[0]}
        fi
    }
    complete -F _ros2pkglist -o "nospace" "roscd"

    alias cbps='colcon build --packages-select'
    complete -F _ros2pkglist -o "nospace" "cbps"

    function cdlatest () {
        cd ~/.ros/log 
        cd $(ls -td -- */ | head -n 1)
    }
fi

image_view () {
  local topic=$1
  shift
  rosrun image_view image_view image:=$topic $*
}
