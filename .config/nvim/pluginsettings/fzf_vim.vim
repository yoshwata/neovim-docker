" call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
" call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'Files' s:find_git_root()

nnoremap <silent> <C-p> :ProjectFiles<CR>
nnoremap <silent> <M-p> :History<CR>
