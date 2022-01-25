call plug#begin('~/.config/nvim')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-eunuch'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'arithran/vim-delete-hidden-buffers'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'romgrk/nvim-treesitter-context'
Plug 'anuvyklack/pretty-fold.nvim'

"Themes
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

let g:python3_host_prog = expand('/usr/bin/python3')

"Neovide configurations
let g:neovide_refresh_rate = 120
let g:neovide_cursor_vfx_mode = "ripple"
let neovide_remember_window_size = v:true

noremap Y "*y
nnoremap <F5> :DeleteHiddenBuffers<CR>
inoremap jk <ESC>

"Blamer
let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_show_in_insert_modes = 0

"CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt                  
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath 

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
if (has("termguicolors"))
  set termguicolors
endif
colorscheme gruvbox
"colorscheme palenight
"
"set t_Co=256
"set background=dark
"colorscheme PaperColor

" au ColorScheme * hi Normal ctermbg=none guibg=none
" au ColorScheme gruvbox hi Normal ctermbg=none guibg=none
" highlight Normal ctermbg=none

set encoding=utf8

set breakindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nowritebackup
set noswapfile
set nobackup

set rnu

"Font
set guifont=Fira\ Code\ 10

"Vue
let g:vue_pre_processors = ['scss']

"Telescope
lua << EOF
require("telescope").setup{ 
  defaults = {
    file_ignore_patterns = {"node_modules"},
    prompt_prefix = ">",
    initial_mode = "insert"
  },
  pickers = {
    find_files = { layout_strategy = "vertical", winblend = 10, layout_config = { vertical = {width = 0.6}} },
    live_grep = { layout_strategy = "vertical", winblend = 10 }
  },
  extensions = {
    fzf = {
     fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
require("nvim_comment").setup()
require("telescope").load_extension("coc")
require('telescope').load_extension('fzf')
-- require('bufferline').setup()

require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '🟩', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '🟩', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '🟥', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,
  numhl = true,
  current_line_blame = true,
  watch_gitdir = {
    interval = 500
  }
}

require('nvim-treesitter.configs').setup{
  highlight = { enable = true }
}

require('treesitter-context').setup{
  enable = true,
  throttle = true,
  max_lines = 0,
  patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true, 
    }
}

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent guifg=#F9F1A5 gui=nocombine]]

require('indent_blankline').setup{
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  char_highlight_list = {
    'IndentBlanklineIndent',
  },
  show_trailing_blankline_indent = true,
}

require('pretty-fold').setup{}
require('pretty-fold.preview').setup()

EOF

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_char = ''
let g:indent_blankline_context_char = '|'

" Telescope COC
nnoremap <leader>fd <cmd>Telescope coc diagnostics<cr>
nnoremap <leader>fk <cmd>Telescope coc type_definitions<cr>
nnoremap <leader>fn <cmd>Telescope coc definitions<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep{ cwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1] }<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').quickfix()<cr>

" Linter
" Code completion

" Airlines
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

autocmd BufEnter * silent! lcd %:p:h

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json',
  \ ]

" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
set cmdheight=2
set signcolumn=yes:1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
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
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

  "True colors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" let g:LanguageClient_serverCommands = {
"     \ 'vue': ['vls']
"     \ }

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{coc#status()}%{get(b:,'coc_current_function','')}%{get(b:,'gitsigns_status','')}

autocmd BufEnter *.vue syntax sync fromstart "prevent syntax highlight break on large vue files

"Custom statusline
function! MyStatusLine()
  let g:airline_section_b = "%{get(b:,'gitsigns_head','')}%{get(b:,'gitsigns_status', '')}"
endfunction
autocmd VimEnter * call MyStatusLine()
