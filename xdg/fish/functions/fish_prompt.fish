function fish_prompt
  echo ""
  if jobs > /dev/null 
    jobs
  end

  echo (date "+%Y/%m/%d %H:%I:%S") 
  echo (echo $USER)'@'(echo -n $hostname)(set_color $fish_color_cwd) (pwd) (set_color normal) (__fish_vcs_prompt) '> '
end
