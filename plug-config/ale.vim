" autocomplete
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\   'go': ['gopls', 'golint'],
\   'bash': ['bashate'],
\   'rust': ['cargo'],
\   'scala': ['sbtserver'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoflake', 'autoimport', 'isort', 'black'],
\   'go': ['gofmt', 'golines', 'goimports'],
\   'bash': ['shfmt'],
\   'rust': ['rustfmt'],
\   'scala': ['scalafmt']
\}

" Fixing
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1

" Linting
let g:ale_lint_on_save = 1
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

" Python linting/fixing config
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=E266,501 --max-complexity=18 --select=B,C,E,F,W,T4'
let g:ale_python_mypy_options = '--ignore-missing-imports=true'
