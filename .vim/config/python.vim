" ---------------------------------------------------------
" Python Settings
" ---------------------------------------------------------

augroup python_settings
  autocmd!
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
  autocmd FileType python setlocal colorcolumn=79
  autocmd FileType python let python_highlight_all=1
augroup END

" Activer Jedi seulement pour Python
let g:jedi#enabled = 1

" Raccourci : Ctrl-Espace pour forcer la complétion
autocmd FileType python inoremap <buffer> <C-Space> <C-x><C-o>

" Popup automatique : dès que tu tapes un point ou des lettres
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_keyword = 1

" ---------------------------------------------------------
" Lancer flake8 depuis Vim (sans plugin)
" ---------------------------------------------------------

function! s:RunFlake8()
  " Lance flake8 sur le fichier courant et charge le résultat dans la quickfix
  cexpr system('flake8 --format=default '.shellescape(expand('%:p')))
  " Ouvre la fenêtre quickfix seulement s'il y a des erreurs
  if len(getqflist()) > 0
    cwindow
  else
    cclose
    echo "flake8: OK"
  endif
endfunction

" <leader>f dans un fichier Python : lancer flake8
autocmd FileType python nnoremap <buffer> <leader>f :w <CR>:call <SID>RunFlake8()<CR>

" Raccourcis globaux pour naviguer dans la quickfix
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>
