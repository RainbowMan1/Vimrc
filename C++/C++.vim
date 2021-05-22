function FormatFile()
  let l:lines="all"
  if has('python')
    pyf /usr/share/clang/clang-format-10/clang-format.py
  elseif has('python3')
    py3f /usr/share/clang/clang-format-10/clang-format.py
  endif
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call FormatFile()
