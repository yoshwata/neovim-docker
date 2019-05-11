" nnoremap [denite] <Nop>
" nmap <C-d> [denite]
" nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
" nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
" nnoremap <silent> [denite]p :<C-u>Denite file_rec<CR>
"
" call denite#custom#option('default', 'prompt', '>')
" call denite#custom#option('_', 'highlight_matched_range', 'None')
" call denite#custom#option('_', 'highlight_matched_char', 'None')
" call denite#custom#map('insert', "<Tab>", '<denite:move_to_next_line>')
" call denite#custom#map('insert', "<S-Tab>", '<denite:move_to_previous_line>')
" call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
" call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
" call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')
" call denite#custom#var('grep', 'command', ['pt', '--follow', '--nogroup', '--nocolor', '--hidden'])
" call denite#custom#var('grep', 'default_opts', [])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('file_rec', 'command', ['pt', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
"
"
" nnoremap [denite] <Nop>
" nmap <C-c> [denite]
"
" "現在開いているファイルのディレクトリ下のファイル一覧。
" nnoremap <silent> [denite]f :<C-u>DeniteBufferDir
"       \ -direction=topleft -cursor-wrap=true file file:new<CR>
" "バッファ一覧
" nnoremap <silent> [denite]b :<C-u>Denite -direction=topleft -cursor-wrap=true buffer<CR>
" "レジスタ一覧
" nnoremap <silent> [denite]r :<C-u>Denite -direction=topleft -cursor-wrap=true -buffer-name=register register<CR>
" "最近使用したファイル一覧
" nnoremap <silent> [denite]m :<C-u>Denite -direction=topleft -cursor-wrap=true file_mru<CR>
" "ブックマーク一覧
" nnoremap <silent> [denite]c :<C-u>Denite -direction=topleft -cursor-wrap=true bookmark<CR>
" "ブックマークに追加
" nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>
"
" ".git以下のディレクトリ検索
" nnoremap <silent> [denite]k :<C-u>Denite -direction=topleft -cursor-wrap=true
"       \ -path=`substitute(finddir('.git', './;'), '.git', '', 'g')`
"       \ file_rec/git<CR>
"
" call denite#custom#source('file'    , 'matchers', ['matcher_cpsm', 'matcher_fuzzy'])
"
" call denite#custom#source('buffer'  , 'matchers', ['matcher_regexp'])
" call denite#custom#source('file_mru', 'matchers', ['matcher_regexp'])
"
" call denite#custom#alias('source', 'file_rec/git', 'file_rec')
" call denite#custom#var('file_rec/git', 'command',
"   \ ['git', 'ls-files', '-co', '--exclude-standard'])
"
" call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '<C-W>', '<denite:move_up_path>', 'noremap')
