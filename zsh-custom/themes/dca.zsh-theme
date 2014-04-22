# vim:ft=zsh:
# plugins required: vi-mode
#   mercurial must be configured for hg-prompt
# based on oh-my-zsh's rkj-repos theme
# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888

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
  echo "git:$(prompt_git_info)"
}

# alternate prompt with git & hg
PROMPT=$'
%{$fg[blue]%}%B[%b%{\e[0;33m%}'%D{"%Y-%m-%d %H:%M:%S"}%b$'%{$fg[blue]%}%B]%b%{\e[0m%}
%{$fg[blue]%}%B[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;33m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;33m%}%B:%b%/%{$fg[blue]%}%B]%b%{\e[0m%}
%{$fg[blue]%}%B[%{\e[1;35m%}$%{$fg[blue]%}%B] <%b%{$fg[white]%}$(mygit)$(hg_prompt_info)$(svn_prompt_info)%{$fg[blue]%}%B>%{\e[0m%}%b '
PS2=$'$fg[blue]%}%B>%{\e[0m%}%b '

RPROMPT='$(vi_mode_prompt_info)'
