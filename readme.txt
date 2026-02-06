# vim-config

Configuration Vim simple, stable et modulaire, pensée pour un usage quotidien (dev, notes, OSINT) sans plugins exotiques.

## Contenu

- `.vimrc` : configuration principale (affichage, indentation, recherche, statusline, gestion des fichiers, etc.).
- `.vim/` :
  - `map.vim` : raccourcis clavier pour navigation, buffers, fenêtres, et quelques helpers OSINT (tri, dédup, recherche d’IP, URL, hash, etc.).
  - `completion.vim` : configuration de l’autocomplétion native de Vim.
  - `fileExplorer.vim` : fonctions simples pour créer/ouvrir des fichiers n’importe où.
  - `python.vim` : réglages spécifiques pour Python (indentation, colonne 79, flake8 intégré).

## Installation

```bash
git clone https://github.com/grayTerminal-sh/vim-config.git ~/Repo/vim-config

cd ~
ln -s ~/Repo/vim-config/.vimrc .vimrc
ln -s ~/Repo/vim-config/.vim .vim

