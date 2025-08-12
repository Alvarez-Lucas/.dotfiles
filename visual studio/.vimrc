set relativenumber
set number
set ignorecase
set smartcase
set hlsearch
set incsearch
set nocursorline
set scrolloff=8
set tabstop=4
set shiftwidth=4
" This tends to add lag as the system clipboard slow downs? - Testing
"set clipboard=unnamed

let mapleader = " "

" indent without losing visual selection
vnoremap < <gv
vnoremap > >gv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

vnoremap gc :vsc Edit.ToggleLineComment<CR>
nnoremap gcc :vsc Edit.ToggleLineComment<CR>
nnoremap gco o<Esc>Vcx<Esc><c-o>:vsc Edit.CommentSelection<CR>fxa<bs> 
nnoremap gcO O<Esc>Vcx<Esc><c-o>:vsc Edit.CommentSelection<CR>fxa<bs> 
nmap ycc yygccp

" use to make navigating forward and backward work across tabs
nnoremap <C-o> :vsc View.NavigateBackward<CR>
nnoremap <C-i> :vsc View.NavigateForward<CR>

":command ReloadConfig source ~/.vimrc

" Code Reorganize
nnoremap cr :vsc CodeMaid.ReorganizeActiveDocument<CR>

" Clear highlights from search
"nnoremap <silent> <Esc> <Esc>:nohlsearch<CR>
nnoremap <Esc> <Esc>:nohlsearch<CR>

" Paste without copying what you pasted over
xnoremap p "_dP

" Maybe consider making c and d not copy, only yank copy

" Switch tabs
nnoremap L :vsc Window.NextTab<CR>
nnoremap H :vsc Window.PreviousTab<CR>
" Consider these instead of tab shifting?
" remap for beginning of line on H
" remap for end of line on L
"noremap H ^
"noremap L $

nnoremap Y y$
nnoremap gi `i

" Code runner
"nnoremap <leader>r :vsc Debug.Start<CR>
"nnoremap <leader>r :vsc Debug.Restart<CR>:vsc Debug.Start<CR>
nnoremap <leader>t :vsc Debug.StopDebugging<CR>
" remap to yank to end of line

"let @p='oDebug.Print("")<Left><Left>'

" window binds
"nnoremap <C-J> <C-W>J
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W>K
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W>L
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W>H
"nnoremap <C-H> <C-W><C-H>

" Close window, check vim config if this is the actual bind we use
nnoremap <leader>w :vsc File.Close<cr>

" Goto solution explorer
"nnoremap <leader>e :vsc View.SolutionExplorer<cr>
nnoremap <leader>e :vsc SolutionExplorer.SyncWithActiveDocument<cr>:vsc View.SolutionExplorer<cr>

nmap ]e :vsc View.NextError<cr>
nmap [e :vsc View.PreviousError<cr>

nmap ]t :vsc View.PreviousTask<cr>
nmap [t :vsc View.NextTask<cr>

nnoremap <bs> <c-^>

nnoremap <leader>gg :vsc View.GitRepositoryWindow<cr>
nnoremap <leader>gc :vsc View.GitWindow<cr>

nnoremap <leader>q :vsc View.ErrorList<cr>

" Snacks Picker Keymaps
nnoremap <leader>f :vsc Edit.GoToFile<cr>
nnoremap <leader>g :vsc Edit.GoToText<cr>
"nnoremap <leader>F :vsc Edit.GoToRecentFile<cr>
"nnoremap :vsc Edit.GoToSymbol<cr>
"nnoremap :vsc Edit.GoToMember<cr>
" :vsc Edit.QuickFindSymbol requires argument


" already have keymaps for members ctrl + p
" Goes to a specific member, mapped to ctrl + P
"
"nnoremap :vsc Edit.SwitchToQuickFind<cr>
"nnoremap :vsc Edit.SwitchToQuickReplace<cr>
"nnoremap :vsc Edit.Quick<cr>
" keymaps source https://harrisoncramer.me/debugging-in-neovim/
"nnoremap <leader>dc :vsc Debug.Start<cr>
nnoremap <leader>ds :vsc Debug.Restart<CR>:vsc Debug.Start<CR>
nnoremap <leader>di :vsc Debug.QuickWatch<cr>
"nnoremap <leader>dC :vsc Debug.DeleteAllBreakpoints<cr>
"nnoremap <leader>dh :vsc Debug.RunToCursor<cr>
" toggle breakpoints TODO: Confirm
nnoremap <leader>db :vsc Debug.ToggleBreakpoint<cr>
"nnoremap <leader>dl :vsc Debug.StepOver<cr>
"nnoremap <leader>dl :vsc Debug.StepInto<cr>
"nnoremap <leader>dk :vsc Debug.Stepout<cr>
nnoremap <leader>de :vsc Debug.StopDebugging<cr>
nnoremap <leader>dE :vsc Debug.StopDebugging<Cr>:vsc Debug.DeleteAllBreakpoints<cr>

vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>p "+p

vnoremap <C-X> "+x
vnoremap <C-C> "+y

nnoremap n nzz
nnoremap N Nzz

"Doesn't work, need to find star search
"vnoremap * "zy/\V<C-r>=escape(@z, '\/')<CR><CR>

nnoremap [[ :vsc Edit.NextMethod<cr>
nnoremap [m :vsc Edit.NextMethod<cr>
nnoremap ]] :vsc Edit.PreviousMethod<cr>
nnoremap ]m :vsc Edit.PreviousMethod<cr>

" LSP Keymaps
nnoremap grn :vsc Refactor.Rename<cr>
nnoremap gra :vsc View.QuickActions<cr>
nnoremap grr :vsc Edit.FindAllReferences<cr>
nnoremap grd :vsc Edit.GoToDefinition<cr>
nnoremap grt :vsc Edit.GoToType<cr>
"nnoremap grt :vsc Edit.GoToTypeDefinition<cr>
nnoremap gO :vsc View.DocumentOutline<cr>
" TODO
nnoremap K :vsc Edit.QuickInfo<cr>
inoremap <c-s> <c-o>:vsc Edit.ParameterInfo<cr>
nnoremap gk :vsc Edit.ParameterInfo<cr>
"nnoremap <leader>ck :vsc Edit.PeekHelp<cr>
"nnoremap :vsc EditorContextMenus.CodeWindow.QuickActionsForPosition<cr>
"nnoremap :vsc View.QuickActions<cr>
"nnoremap :vsc View.QuickActionsForPosition<cr>


" Consider changing these back, but with testing its nice not to have it
" constantly overwrite the clipboard
" TODO: consider adding to your config
"noremap d "_d
"noremap dd "_dd
"noremap c "_c
"noremap cc "_cc
"noremap r "_r

noremap <leader>s :w<cr>

noremap <leader>o :vsc View.Output<cr>

" last insert


" faster macros
nnoremap Q @n

vnoremap J :move '>+1<CR>gv-gv<CR>gv=gv
vnoremap K :move '<-2<CR>gv-gv<CR>gv=gv

nnoremap <c-e> :vsc View.HarpoonToolWindow<cr>
nnoremap <leader>a :vsc Harpoon.AppendTab<cr>
nnoremap <leader>hc :vsc Harpoon.ClearAll<cr>
nnoremap <leader>1 :vsc Harpoon.SwitchToTab0<cr>
nnoremap <leader>2 :vsc Harpoon.SwitchToTab1<cr>
nnoremap <leader>3 :vsc Harpoon.SwitchToTab2<cr>
nnoremap <leader>4 :vsc Harpoon.SwitchToTab3<cr>
nnoremap <leader>5 :vsc Harpoon.SwitchToTab4<cr>
nnoremap <leader>6 :vsc Harpoon.SwitchToTab5<cr>
nnoremap <leader>7 :vsc Harpoon.SwitchToTab6<cr>
nnoremap <leader>8 :vsc Harpoon.SwitchToTab7<cr>
nnoremap <leader>9 :vsc Harpoon.SwitchToTab8<cr>
nnoremap <leader>hd :vsc Harpoon.DeleteTab<cr>
"nnoremap <leader>hh :vsc Harpoon.SwapLeft<cr>
"nnoremap <leader>hl :vsc Harpoon.SwapRight<cr>
"nnoremap <c-h> :vsc Harpoon.PreviousTab<cr>
"nnoremap <c-l> :vsc Harpoon.NextTab<cr>
