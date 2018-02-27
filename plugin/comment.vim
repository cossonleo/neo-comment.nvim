if exists('g:neo_comment_loaded')
  finish
endif
let g:neo_comment_loaded = 1

command Insert_comment :call neocomment#insert_file_comment()
command update_comment :call neocomment#update_last_change_time()

