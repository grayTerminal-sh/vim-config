" ---------------------------------------------------------
" Completion
" ---------------------------------------------------------

"  --------------------------------------------------------
" Autocomplétion native
" ---------------------------------------------------------
set complete=.,w,b,u,t,i
set completeopt=menuone,noinsert,noselect

" Navigation dans le menu de complétion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tab intelligent pour chemins
inoremap <expr> ² pumvisible() ? "\<C-n>" : "\<C-x>\<C-f>"

" Autocomplétion seulement après 3 caractères
autocmd InsertCharPre * if col('.') > 3 && pumvisible() == 0 | silent! call feedkeys("\<C-n>", "n") | endif

" ---------------------------------------------------------
" Auto-fermeture simple des paires (sans plugin)
" ---------------------------------------------------------
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap < <><Left>

" Sauter par-dessus la parenthèse fermante
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
