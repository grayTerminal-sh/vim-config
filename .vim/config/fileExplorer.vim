" ---------------------------------------------------------
" Création d'un nouveau fichier
" ---------------------------------------------------------

" ---------------------------------------------------------
" Fonction
" ---------------------------------------------------------

" Création de fichier
function! CreateAnyFile()
let l:name = input('Fichier à ouvrir/créer: ', '', 'file')
if l:name != ''
execute 'edit' fnameescape(l:name)
endif
endfunction

" Ouverture de fichier
function! OpenFileAnywhere()
  let l:name = input('Ouvrir fichier: ', '', 'file')
  if filereadable(l:name)
    execute 'edit' fnameescape(l:name)
  else
    echo "Fichier introuvable: " . l:name
  endif
endfunction

" ---------------------------------------------------------
" Propriétés
"  --------------------------------------------------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 75
