""""""""""""""""""""""""""""""""""""""""""
"    LICENSE: MIT
"     Author: Cosson
"    Version: 0.1
" CreateTime: 2018-02-27 23:29:34
" LastUpdate: 2018-02-27 23:29:56
"       Desc: 
""""""""""""""""""""""""""""""""""""""""""

function! neocomment#insert_file_comment()
	lua << EOF
	content = require "neocomment"
	content.insert_file_comment()
EOF
endfunction

function! neocomment#update_last_change_time()
	lua << EOF
	content = require "neocomment"
	content.update_last_change_time()
EOF
endfunction
