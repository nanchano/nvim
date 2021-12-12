let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'go': ['gopls'],
\   'bash': ['bashate'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'autoimport', 'isort'],
\   'go': ['gofmt', 'golines', 'goimports'],
\   'bash': ['shfmt'],
\}

" Fixing
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
" Linting
let g:ale_set_signs = 0 " dont highlight on sign col
" These below lint under X change
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_filetype_changed = 1
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
" messages on airline bar
let g:airline#extensions#ale#enabled = 1
