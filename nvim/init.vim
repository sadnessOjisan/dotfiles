call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cocopon/iceberg.vim'
call plug#end()

colorscheme iceberg

:set number
set autoread
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" yank to clipboard
set clipboard+=unnamed

" for peco
:set modifiable

" terminal
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert

" 隣接した{}で改行したらインデント
function! AddIndentWhenEnter()
    if getline(".")[col(".")-1] == "}" && getline(".")[col(".")-2] == "{"
        return "\n\t\n\<UP>\<END>"
    else
        return "\n"
    endif
endfunction
" Enterに割り当て
inoremap <silent> <expr> <CR> AddIndentWhenEnter()

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4

" netrw
set nocp                    " 'compatible' をオフにする
filetype plugin on          " プラグインを有効にする
let g:netrw_preview=1
let g:netrw_liststyle=3 " tree表示
let g:netrw_keepdir = 0
let g:netrw_banner = 0
"window サイズ
let g:netrw_winsize = 25
let g:netrw_browse_split = 4

"Netrw を toggle する関数を設定
"元処理と異なり Vex を呼び出すことで左 window に表示
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vex
    endif
endfunction

"ショートカットの設定
"= を 2 回連続押下で toggle 
noremap <silent><C-e> :call ToggleNetrw()<CR>

" coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
