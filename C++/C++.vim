" Use Clang Format to format file on write
function FormatFile()
  let l:lines="all"
  if has('python')
    pyf /usr/share/clang/clang-format-10/clang-format.py
  elseif has('python3')
    py3f /usr/share/clang/clang-format-10/clang-format.py
  endif
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp,*.hpp call FormatFile()


" Check for compile.vim file in the parent directories
function CheckCompileFile(file_path)
  if filereadable(a:file_path . "/compile.vim")
    execute "source " . a:file_path . "/compile.vim"
    return a:file_path
  else
    let l:new_file_path = fnamemodify( a:file_path,':h')
    if l:new_file_path!=#"/"
      return CheckCompileFile(l:new_file_path)
    endif
  endif
endfunction


let absolute_path = expand("%:p")
let absolute_path_p_dir = expand("%:p:h")
let p_dir = CheckCompileFile(absolute_path_p_dir)
let p_dir_len = strchars(p_dir)+1
let relative_path = absolute_path[p_dir_len:] 


let continue = 1 
function CheckDisallowList(ignore_list)
  for folder in path_list
    if has_key(a:ignore_list, folder)
      let continue = 0
    endif
  endfor
endfunction

let final_command = "cd ". p_dir 
for command in compile_commands
  let final_command = final_command . " && " . command
endfor
let final_command = final_command . " > /dev/null &"

function Compile(command)
  call system(a:command)
endfunction

autocmd BufWritePost *.h,*.cc,*.cpp,*.hpp call Compile(final_command)

