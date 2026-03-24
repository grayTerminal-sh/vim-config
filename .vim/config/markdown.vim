" Détection Markdown
augroup markdown_settings
  autocmd!
  autocmd FileType markdown call s:MarkdownSettings()
augroup END

function! s:MarkdownSettings()
  " Afficher les titres plus visibles
  setlocal conceallevel=2
  setlocal tabstop=2 shiftwidth=2 expandtab

  " Activer les folds par titres Markdown
  setlocal foldmethod=expr
  setlocal foldexpr=MarkdownFold(v:lnum)
  setlocal foldlevel=1
endfunction

" Fonction de folding par titres Markdown
function! MarkdownFold(lnum)
  let line = getline(a:lnum)
  if line =~ '^#'
    " niveau du titre = nombre de # au début
    return '>' . matchend(line, '^#\+')
  endif
  return '='
endfunction

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
