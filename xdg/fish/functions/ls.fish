function ls
  if exa >/dev/null 2>&1
    exa --color=always
  else if ls --color=always -d . >/dev/null 2>&1
    ls --color=always
  else if ls -G -d . >/dev/null 2>&1 # colorls is main system ls already
    ls -G
  else if \colorls -G -d . >/dev/null 2>&1
    colorls -G
  else # Solaris or other *NIX
    ls
  end
end
