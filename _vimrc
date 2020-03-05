" vim: set fdm=marker : 
""""""""""""""""""""""""""""
" Start of Vim-plug:  {{{1
""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""
" Plug list block
""""""""""""""""""""""""""""
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

"Vim plugin that counts your keypresses and saves statistics to Code::Stats, a
"free stats tracking service for programmers.
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" WakaTime for Vim Vim The open source plugin for productivity metrics, goals, leaderboards, and automatic time tracking.
"Plug 'https://github.com/wakatime/vim-wakatime.git'
Plug 'wakatime/vim-wakatime'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" :colorscheme wombat256 or :colorscheme wombat256mod
" version of Wombat256mod vim theme
Plug 'wombat256.vim'
""""""""""""""""""""""""""""

" Add plugins   to &runtimepath
call plug#end()
""""""""""""""""""""""""""""
" End of Vim-plug
"""""""""""""""""""""""""""
"Reload .vimrc and :PlugInstall to install plugins.
""""""""""""""""""""""""}}}1
" Start of My setings
""""""""""""""""""""""""""""
" set for russin keys  {{{2
""""""""""""""""""""""""""""
set keymap=russian-jcukenwin 
set iminsert=0
function! MyKeyMapHighlight()
	if &iminsert == 0
		hi StatusLine ctermfg=DarkBlue guifg=DarkBlue
	else
		hi StatusLine ctermfg=DarkGreen guifg=DarkGreen
	endif
endfunction
" Вызываем функцию, чтобы она установила цвета при запуске Vim'a
call MyKeyMapHighlight()

" При изменении активного окна будет выполняться обновление
" индикации текущей раскладки
au WinEnter * :call MyKeyMapHighlight()

":map <C-K> i
"cmap <silent> <C-f> <C-^>
imap <silent> <C-f> <C-^>X<Esc>:call MyKeyMapHighlight()<CR>a<C-H>
"nmap <silent> <C-f> a<C-^><Esc>:call MyKeyMapHighlight()<CR>
"vmap <silent> <C-f> <Esc>a<C-^><Esc>:call MyKeyMapHighlight()<CR>gv
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" *** Other setings *** {{{2
""""""""""""""""""""""""""""
" Precede each line with its line number.
set number
set relativenumber
set nocompatible
set mouse=a
set autoindent  
"display the current cursor position
set ruler
"Display an incomplete command
set showcmd
"1.Filetype detection.  2.Using filetype plugin files 3.Using indent files
filetype plugin indent on
"break text to 78 characters plain text.  
autocmd FileType text setlocal textwidth=240
"char showe 
"set list
"set listchars=tab:\|\<Space>
" > is shown at the beginning, - throughout
set listchars=tab:>-     
syntax enable
"Spell cheking enabling for ru and eng by default
"]s — Перейти к следующей ошбке
"[s — К предыдущей ошибке
"z= — Выдать список возможных замен
"zG — Добавить слово в словарь
"zW — Пометить слово как ошибочное
set nospell
"setlocal spell spelllang=ru
" Allow keys to move to the previous/next line on the first/last character
set whichwrap=b,<,>,[,],l,h
set backspace=indent,eol
"" Список кодировок файлов для автоопределения
set fileencodings=utf-8,cp1251,koi8-r,cp866
" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" *** Plagins setings *** {{{2
""""""""""""""""""""""""""""
"Code::Stats plugin for Vim
" REQUIRED: set your API key
let g:codestats_api_key = 'SFMyNTY.UW5WWmJnPT0jI05qQXdNZz09.1h4hpvckNRH1BiYBcsaJmzeKYp_-HvbAzwkIcpEkHNg'
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" Setting colors and theme {{{2
""""""""""""""""""""""""""""
colorscheme wombat256mod
""""""""""""""""""""""""""""
au BufRead,BufNewFile *.txt set filetype=txt
" Просмотр нетекстовых файлов в Vim -->
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" Indent(Tabs) Setings {{{2
""""""""""""""""""""""""""""
"  filetype plugin indent on
"  show existing tab with 4 spaces width
set tabstop=3
"  when indenting with '>', use 4 spaces width
set shiftwidth=3
"  On pressing tab, insert 4 spaces
"  set expandtab
""""""""""""""""""""""""""""
"  kind of folding used Possible values :
"  manual indent expr  marker syntax diff  
"  setlocal foldmethod=manual,indent,marker
setlocal foldmethod=indent
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" Completion Setings {{{2
""""""""""""""""""""""""""""
"	This option specifies how keyword completion |ins-completion| works
"	when CTRL-P or CTRL-N are used.  It is also used for whole-line
"	completion |i_CTRL-X_CTRL-L|.  It indicates the type of completion
"	and the places to scan.  It is a comma separated list of flags:
"'complete' 'cpt'	string	(default: ".,w,b,u,t,i")
set completeopt=longest,menu
""""""""""""""""""""""""""""
set wildmode=longest,list,full
""""""""""""""""""""""""""""
" Mapings for UltiSnips
""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets=<c-tab>
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories=[".vim/UltiSnips"]
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" *** Menu block *** 
""""""""""""""""""""""""""""
" Settings menu {{{2
""""""""""""""""""""""""""""
"Functio SeeTab01{{{
fu! SeeTab01()
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 1
    let g:SeeTab_list = &list
    let g:SeeTab_listchars = &listchars
    let regA = @a
    redir @a
    hi SpecialKey
    redir END
    let g:SeeTabSpecialKey = @a
    let @a = regA
    silent! hi SpecialKey guifg=black guibg=magenta ctermfg=black ctermbg=magenta
    set list
    set listchars=tab:\|\
  else
    let &list = g:SeeTab_list
    let &listchars = &listchars
    silent! exe "hi ".substitute(g:SeeTabSpecialKey,'xxx','','e')
    unlet g:SeeTabEnabled g:SeeTab_list g:SeeTab_listchars
  endif
endfunc
"}}}
"Functio SeeTab01" {{{
fu! SeeTab02()
  if !exists("g:SeeTabEnabled")
    let g:SeeTabEnabled = 0
  end
  if g:SeeTabEnabled==0
    syn match leadspace /^\s\+/ contains=syntab
    exe "syn match syntab /\\s\\{" . &sw . "}/hs=s,he=s+1 contained"
    hi syntab guibg=Grey
    let g:SeeTabEnabled=1
  else
    syn clear leadspace
    syn clear syntab
    let g:SeeTabEnabled=0
  end
endfunc
"""""""""""""""""""""""""""""}}}
"wildmenu"{{{
set wildmenu
set wcm=<Tab>
menu Mset.Simbols.SeeTab01  :call SeeTab01()
menu Mset.Simbols.SeeTab02  :call SeeTab02()
menu Mset.Paste.on     :set paste<CR>
menu Mset.Paste.off    :set nopaste<CR>
menu Mset.todo.add(ta)    :!addrt %:t %:p<CR>
menu Mset.todo.edit(te)    :!wvim "/cygdrive/d/tools.win/Fast/TehnoMage_fast/starttodo.cmd"<CR>
menu Mset.VimRC.reload(rF5)    :so $MYVIMRC<CR>
menu Mset.export.emacs(em)    :!emag %:p %:t <CR>
menu Mset.syntax.txt  	 	 :set filetype=txt<CR>
menu Mset.syntax.conf	    :set filetype=conf<CR>
menu Mset.syntax.text  	 	 :set filetype=text<CR>
menu Mset.syntax.vim  	 	 :set filetype=vim <CR>
menu Mset.syntax.ino(i)  	 	 :set filetype=ino <CR>
menu Mset.syntax.2html 	 	 :set filetype=2html<CR>
menu Mset.syntax.c	 	 	 :set filetype=c<CR>
menu Mset.syntax.sh	 	 	 :set filetype=sh<CR>
menu Mset.Folding.manual    :setlocal foldmethod=manual<CR>
menu Mset.Folding.indent    :setlocal foldmethod=indent<CR>
menu Mset.Folding.syntax    :setlocal foldmethod=syntax<CR>
menu Mset.Folding.marker(f)    :setlocal foldmethod=marker<CR>
"menu Mset.Spell.ru     :set spell spelllang=<CR>:set enc=koi8-r<CR>:set spell spelllang=ru<CR>
menu Mset.Spell.ru     :set spell spelllang=<CR>:set spell spelllang=ru<CR>
"menu Mset.Spell.ru,en  :set spell spelllang=<CR>:set enc=koi8-r<CR>:set spell spelllang=ru,en<CR>
menu Mset.Spell.ru,en  :set spell spelllang=<CR>:set spell spelllang=ru,en<CR>
menu Mset.Spell.en     :set spell spelllang=<CR>:set spell spelllang=en<CR>
menu Mset.Spell.off    :set nospell<CR>
map <F9> :emenu Mset.<Tab>
"""""""""""""""""""""""""""""}}}
"fast key maping"{{{
map g<F9>f :setlocal foldmethod=marker<CR>
map g<F9>em :!emag %:p %:t <CR>
map g<F9>ta :!addrt %:t %:p<CR><CR>
map g<F9>te :!wvim "/cygdrive/d/tools.win/Fast/TehnoMage_fast/starttodo.cmd"<CR><CR>
map g<F9>i :set filetype=ino <CR>
map g<F9>r<F5> :so $MYVIMRC
"""""""""""""""""""""""""""""}}}
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" *** Mapings block *** {{{2
""""""""""""""""""""""""""""
""""""""""""""""""""""""""""
" Mapings for clipbord{{{
""""""""""""""""""""""""""""
map cp "*p
map cP "*P
map co o<C-R>+<ESC>
map cO O<C-R>+<ESC>
map cy "*y
map cY "*yy
map cX "*dd
"""""""""""""""""""""""""""""}}}
"Insert a single character{{{
""""""""""""""""""""""""""""
"  nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR> 
":nnoremap ,i i_<Esc>r
":nnoremap ,a a_<Esc>r
":nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
":nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
function! RepeatChar(char, count)
  return repeat(a:char, a:count)
endfunction
nnoremap <silent> <Space> :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
nnoremap <silent> <Enter> :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>
"""""""""""""""""""""""""""""}}}
"Savind file keys{{{
""""""""""""""""""""""""""""
imap <F2> <Esc>:w!<CR>
map <F2> :w!<CR>
map <S-F2> :mkview<CR>
map <F3> :mkview<CR>
"""""""""""""""""""""""""""""}}}
" Loding File keys{{{
""""""""""""""""""""""""""""
map <C-F5> :loadview<CR>
map <F5> :edit<CR>
map <S-F5> :!edit<CR>
"""""""""""""""""""""""""""""}}}
" Search keys{{{
""""""""""""""""""""""""""""
map <F7> :%s/<C-R>"/<C-R>"/gc<C-F>2T/
"""""""""""""""""""""""""}}}
" Tabs keys{{{
""""""""""""""""""""""""""""
map gWW :tabf ~/.vim/commanots.txt<CR>
map gWT :tabe %<CR>
map gww :tabf ~/.vim/commanots.txt<CR>
map gwt :tabe %<CR>
map gwe :Te<CR>
"""""""""""""""""""""""""}}}
" Movement keys{{{
""""""""""""""""""""""""""""
map gh g^
map gl g$
map zh [z
map zl ]z
" Select All
map <C-a> ggVG
"Ctrl+a: Go to beginning of the line [Normal Mode && Insert Mode]
"Ctrl+e: Go to end of line [Normal Mode && Insert Mode]
"Alt+f: Backward a word [Insert Mode]
"Alt+b: Forward a word [Insert Mode]
"Alt+d: Delete a word (backward) [Insert Mode]
imap <C-a> <ESC>I
imap <C-e> <ESC>A
inoremap <M-f> <ESC><Space>Wi
inoremap <M-b> <Esc>Bi
inoremap <M-d> <ESC>cW
"""""""""""""""""""""""""""""}}}
" Move&Duble lines keys{{{
""""""""""""""""""""""""""""
"noremap <c-s-up> :m .+1<CR>==
noremap mp :t.<CR>
noremap mP :t-.<CR>
noremap <c-s-up> j:-1m 'a-1<CR><c-i>
noremap <c-up> :m .-2<CR>==
noremap mk :m .-2<CR>
noremap <c-down> :m .+1<CR>==
noremap mj :m .+1<CR>
"""""""""""""""""""""""""""""}}}
" change setings keys{{{
""""""""""""""""""""""""""""
nnoremap f<F9>f :setlocal foldmethod=marker<CR>

"""""""""""""""""""""""""""""}}}
" Run scripts keys{{{
""""""""""""""""""""""""""""
let $BASH_ENV = "~/.bash_aliases"
nnoremap <F10> :.w !bash<CR><CR>
nnoremap <S-F10> yymp:r !<C-R>"<backspace><cr>'p
inoremap <F10> <ESC>:.w !bash<CR>
"""""""""""""""""""""""""""""}}}
""""""""""""""""""""""""}}}2
""""""""""""""""""""""""""""
" End of My setings
""""""""""""""""""""""""""""
    
