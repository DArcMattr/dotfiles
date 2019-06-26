function fish_prompt
  echo ""
  if jobs > /dev/null 
    jobs
  end

  echo '['(date "+%Y/%m/%d %H:%I:%S")']'
  echo "<$USER@$hostname:$PWD>"
  echo (__fish_vcs_prompt) ' '
end
