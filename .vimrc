" =========================================================
"  VIMRC — configuration sobre, stable, sans plugin
" =========================================================
" Objectif :
" - Vim prévisible
" - Assistance discrète
" - Aucun comportement surprenant
" - Configuration modulaire
" =========================================================

" ---------------------------------------------------------
" Mode moderne (obligatoire)
" ---------------------------------------------------------
set nocompatible          " désactive le mode vi historique
set encoding=utf-8        " encodage standard
set hidden                " permet de changer de buffer sans sauvegarder
set nomodeline            " sécurité : aucun fichier ne peut exécuter de code
set mouse=a
filetype plugin indent on " détection intelligente du type de fichier
set shell=/bin/zsh
set shortmess+=c
set signcolumn=yes

" ---------------------------------------------------------
" Affichage & lisibilité
" ---------------------------------------------------------
set number                " numéros de lignes absolus
set relativenumber        " numéros relatifs pour les déplacements
set showcmd               " affiche les commandes en cours
set ruler                 " affiche la position du curseur
set laststatus=2          " toujours afficher la statusline
set wildmenu              " menu amélioré pour complétion commandes
set wildmode=longest:full,full
syntax on                 " coloration syntaxique
set background=dark       " thème sombre
colorscheme slate         " simple et lisible
set cursorline            " surligne la ligne courante
set showmatch             " montre les parenthèses correspondantes
set scrolloff=5           " garde 5 lignes visibles au-dessus/en dessous du curseur


" ---------------------------------------------------------
" Indentation & texte
" ---------------------------------------------------------
set tabstop=4             " largeur d'une tabulation
set shiftwidth=4          " largeur d'indentation
set expandtab             " convertit les tabs en espaces
set smartindent           " indentation intelligente
set autoindent            " conserve l'indentation de la ligne précédente
set list                  " affiche les caractères invisibles
set listchars=tab:→\ ,trail:·,nbsp:␣,extends:⟩,precedes:⟨
set wrap                  " retour à la ligne visuel
set linebreak             " coupe aux mots, pas au milieu


" ---------------------------------------------------------
" Performance & réactivité
" ---------------------------------------------------------
set updatetime=300
set timeoutlen=500
set lazyredraw             " ne redessine pas pendant les macros
set ttyfast                " connexion rapide


" ---------------------------------------------------------
" Recherche
" ---------------------------------------------------------
set ignorecase             " recherche insensible à la casse
set smartcase              " sauf si majuscule utilisée
set incsearch              " recherche incrémentale
set hlsearch               " surbrillance des résultats

" ---------------------------------------------------------
" Statusline personnalisée
" ---------------------------------------------------------
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %f                    " chemin du fichier
set statusline+=\ %#LineNr#
set statusline+=\ %m%r%h%w              " flags (modifié, readonly, help)
set statusline+=%=                      " séparateur gauche/droite
set statusline+=\ %y                    " type de fichier
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ [%{&fileformat}]
set statusline+=\ %p%%                  " pourcentage dans le fichier
set statusline+=\ %l:%c                 " ligne:colonne
set statusline+=\ 


" ---------------------------------------------------------
" Sauvegarde & historique
" ---------------------------------------------------------
set undofile               " undo persistant
set undodir=~/.vim/undo    " dossier de sauvegarde undo
set backupdir=~/.vim/backup " dossier de sauvegarde
set directory=~/.vim/swap   " dossier des fichiers swap
set history=1000           " historique de commandes étendu
set undolevels=1000        " niveaux d'annulation étendus

" Créer les répertoires s'ils n'existent pas
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p", 0700)
endif
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p", 0700)
endif
if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p", 0700)
endif


" ---------------------------------------------------------
" Fenêtres & splits
" ---------------------------------------------------------
set splitbelow             " split horizontal en bas
set splitright             " split vertical à droite


" ---------------------------------------------------------
" Amélioration de la sécurité
" ---------------------------------------------------------
set nobackup               " pas de backup pour les fichiers sensibles
set nowritebackup
set viminfo='20,<1000,s1000 " limite les données sauvegardées


" ---------------------------------------------------------
" Nettoyage automatique de la recherche
" ---------------------------------------------------------
autocmd InsertEnter * set nohlsearch


" ---------------------------------------------------------
" Restaurer la position du curseur à l'ouverture
" ---------------------------------------------------------
augroup remember_cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute "normal! g`\"" |
        \ endif
augroup END


" ---------------------------------------------------------
" Fichiers spécifiques
" ---------------------------------------------------------
" Configuration automatique pour logs
autocmd BufRead,BufNewFile *.log setlocal nowrap noswapfile
autocmd BufRead,BufNewFile *.log nnoremap <buffer> <leader>t :e<CR>G " tail -f like

" JSON formatting (si jq est installé)
autocmd FileType json nnoremap <buffer> <leader>j :%!jq .<CR>

" XML formatting (si xmllint est installé)
autocmd FileType xml nnoremap <buffer> <leader>x :%!xmllint --format -<CR>

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Python
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab


" ---------------------------------------------------------
" Commandes personnalisées
" ---------------------------------------------------------
" Enlever les espaces en fin de ligne
command! TrimWhitespace %s/\s\+$//e
" Convertir tabs en espaces
command! Tab2Space %s/\t/    /g
" Afficher les différences depuis la dernière sauvegarde
command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_
      \ | diffthis | wincmd p | diffthis
" Hexdump du fichier courant
command! Hexdump %!xxd
" Retour du hexdump
command! Hexrestore %!xxd -r


" ---------------------------------------------------------
" Configuration modulaire
" ---------------------------------------------------------
" Dossier de config perso
let s:confdir = expand('~/.vim/config')

" Charger tous les fichiers *.vim de ~/.vim/config
if isdirectory(s:confdir)
  for s:f in split(glob(s:confdir . '/*.vim'), '\n')
    execute 'source' s:f
  endfor
endif


" ---------------------------------------------------------
" Fin du vimrc
" ---------------------------------------------------------
