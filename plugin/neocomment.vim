""""""""""""""""""""""""""""""""""""""""""
"   LICENSE: MIT
"    Author: Cosson
"   Version: 0.1
"CreateTime: 2018-02-27 23:26:22
"LastUpdate: 2018-02-27 23:26:22
"      Desc: 
""""""""""""""""""""""""""""""""""""""""""

if exists('g:neo_comment_loaded')
  finish
endif
let g:neo_comment_loaded = 1

command InsertFileComment :call neocomment#insert_file_comment()
command UpdateChangeTime :call neocomment#update_last_change_time()

