" ---------------------------------------------------------
" Map.vim
" ---------------------------------------------------------

" ---------------------------------------------------------
" Leader key
" ---------------------------------------------------------
let mapleader = " "


" ---------------------------------------------------------
" Recharger la configuration de vim
" ---------------------------------------------------------
nnoremap <Leader>r :source .vimrc<CR>


" ---------------------------------------------------------
" Ouvrir / créer un fichier n'importe où
" ---------------------------------------------------------
nnoremap n :call CreateAnyFile()<CR>
nnoremap <leader>o :call OpenFileAnywhere()<CR>


" ---------------------------------------------------------
" Navigation dans le fichier
" ---------------------------------------------------------
" Aller en début de ligne
nnoremap £ 0
" En mode Normal : Entrée -> nouvelle ligne sous le curseur (comme 'o')
nnoremap <CR> o<Esc>


" ---------------------------------------------------------
" Navigation fenêtres
" ---------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap e :Ex<CR>


" ---------------------------------------------------------
" Buffers
" ---------------------------------------------------------
nnoremap b<Right> :bnext<CR>
nnoremap b<Left> :bprevious<CR>
nnoremap bf :bd<CR>
nnoremap <leader><Tab> :b#<CR>
nnoremap b :ls<CR>:b<Space>
nnoremap b1 :b 1<CR>
nnoremap b2 :b 2<CR>
nnoremap b3 :b 3<CR>
nnoremap b4 :b 4<CR>
nnoremap b5 :b 5<CR>
nnoremap b6 :b 6<CR>
nnoremap b7 :b 7<CR>
nnoremap b8 :b 8<CR>
nnoremap b9 :b 9<CR>
nnoremap b0 :b 10<CR>


" ---------------------------------------------------------
" Raccourcis pour OSINT / logs / fichiers texte
" ---------------------------------------------------------
" Tri des lignes sélectionnées
vnoremap <leader>s :sort<CR>
" Suppression des lignes dupliquées (Visual mode)
vnoremap <leader>u :sort u<CR>
" Aligner des colonnes (nécessite column dans le système)
vnoremap <leader>a :!column -t<CR>
" Recherche d'IP dans le fichier
nnoremap <leader>fi /\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}<CR>
" Recherche d'URLs
nnoremap <leader>fu /https\?:\/\/[^\s]\+<CR>
" Recherche d'emails
nnoremap <leader>fe /[a-zA-Z0-9._%+-]\+@[a-zA-Z0-9.-]\+\.[a-zA-Z]\{2,\}<CR>
" Recherche de hash MD5
nnoremap <leader>fm /\<[a-f0-9]\{32\}\><CR>
" Recherche de hash SHA256
nnoremap <leader>fs /\<[a-f0-9]\{64\}\><CR>
" Timestamp to date (sélectionner timestamp puis <leader>td)
vnoremap <leader>td y:r !date -d @<C-r>"<CR>
