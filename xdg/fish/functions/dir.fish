function dir
  {
    LL=$(ll "${@}")
    echo "${LL}" | awk '/^d/ {print $0}'
    echo "${LL}" | awk '! /^(d|total)/ {print $0}'
    echo "${LL}" | awk '/^total/ {print $0}'
  } | ${PAGER:-less}
end

