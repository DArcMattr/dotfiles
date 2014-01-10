# vim:ft=zsh:
# based on oh-my-zsh's rkj-repos theme
# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

function svn_prompt_info {
  # Set up defaults
  local svn_branch=""
  local svn_repository=""
  local svn_version=""
  local svn_change=""

  # only if we are in a directory that contains a .svn entry
  if [ -d ".svn" ]; then
    # query svn info and parse the results
    svn_branch=`svn info | grep '^URL:' | egrep -o '((tags|branches)/[^/]+|trunk).*' | sed -E -e 's/^(branches|tags)\///g'`
    svn_repository=`svn info | grep '^Repository Root:' | egrep -o '(http|https|file|svn|svn+ssh)/[^/]+' | egrep -o '[^/]+$'`
    svn_version=`svnversion -n`

    # this is the slowest test of the bunch
    change_count=`svn status | grep "?\|\!\|M\|A" | wc -l`
    if [ "$change_count" != "       0" ]; then
      svn_change=" [dirty]"
    else
      svn_change=""
    fi

    # show the results
    echo "svn:%{$fg[blue]%}$svn_repository/$svn_branch @ $svn_version%{$reset_color%}%{$fg[yellow]%}$svn_change%{$reset_color%}"

  fi
}
function hg_prompt_info {
    hg prompt --angle-brackets "\
<hg:%{$fg[magenta]%}<branch>%{$reset_color%}>\
</%{$fg[yellow]%}<tags|%{$reset_color%}, %{$fg[yellow]%}>%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}<
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}✱"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%}✈"

function mygit() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$( git_prompt_status )%{$reset_color%}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# alternate prompt with git & hg
PROMPT=$'
%{\e[0;34m%}%B[%b%{\e[0;33m%}'%D{"%Y-%m-%d %H:%M:%S"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;33m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;33m%}%B:%b%/%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B[%{\e[1;35m%}$%{\e[0;34m%}%B] <$(mygit)$(hg_prompt_info)$(svn_prompt_info)>%{\e[0m%}%b '
PS2=$' \e[0;34m%}%B>%{\e[0m%}%b '

