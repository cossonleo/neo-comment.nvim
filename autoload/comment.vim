function neocomment#insert_file_comment()
	nvim_execute_lua(require("content").insert_file_name())
endfunction

function neocomment#update_last_change_time()
	nvim_execute_lua(require("content").update_last_update())
endfunction
