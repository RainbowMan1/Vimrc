function FormatFile()
  let l:lines="all"
  if has('python')
    pyf /usr/share/clang/clang-format-10/clang-format.py
  elseif has('python3')
    py3f /usr/share/clang/clang-format-10/clang-format.py
  endif
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call FormatFile()

function CheckCompileFile(file_path)
  if filereadable(a:file_path . "/compile.vim")
    execute "source " . a:file_path . "/compile.vim"
  else
    let l:new_file_path = fnamemodify( a:file_path,':h')
    if l:new_file_path!=#"/"
      call CheckCompileFile(l:new_file_path)
    endif
  endif
endfunction


call CheckCompileFile(expand("%:p:h"))
