--------------------------------------------------------------------------------
--     LICENSE: 
--      Author: 
--     Version: 
--  CreateTime: 2018-02-27 14:17:50
--  LastUpdate: 2018-02-27 14:17:50
--        Desc: 
--------------------------------------------------------------------------------


local license = string.format("%12s", "LICENSE: ")
local author = string.format("%12s", "Author: ")
local version = string.format("%12s", "Version: ")
local createTime = string.format("%12s", "CreateTime: ")
local lastUpdate = string.format("%12s", "LastUpdate: ")
local desc = string.format("%12s", "Desc: ")

local lua_headline = '--------------------------------------------------------------------------------'
local lua_bodyprefix = '--  '

local normal_headline = '/*********************************************************************************'
local normal_endline = '**********************************************************************************/'
local normal_bodyprefix = "**  "
-- /**/
-- //*/

local sh_healine = '################################################################################'
local sh_bodyprefix = "##  "
local script_prefix = "#! /usr/bin/bash"

local file_comment = {}

local function init_bash_file_comment()
	file_comment["head"] = sh_healine
	file_comment["license"] = sh_bodyprefix .. license
	file_comment["author"] = sh_bodyprefix .. author
	file_comment["version"] = sh_bodyprefix .. version
	file_comment["createTime"] = sh_bodyprefix .. createTime
	file_comment["lastUpdate"] = sh_bodyprefix .. lastUpdate
	file_comment["desc"] = sh_bodyprefix .. desc
	file_comment["end"] = {sh_healine, "#! /bin/bash", ""}
end

local function init_normal_file_comment()
	file_comment["head"] = normal_headline
	file_comment["license"] = normal_bodyprefix .. license
	file_comment["author"] = normal_bodyprefix .. author
	file_comment["version"] = normal_bodyprefix .. version
	file_comment["createTime"] = normal_bodyprefix .. createTime
	file_comment["lastUpdate"] = normal_bodyprefix .. lastUpdate
	file_comment["desc"] = normal_bodyprefix .. desc
	file_comment["end"] = { normal_endline , ""}
	
end

local function init_lua_file_comment()
	file_comment["head"] = lua_headline
	file_comment["license"] = lua_bodyprefix .. license
	file_comment["author"] = lua_bodyprefix .. author
	file_comment["version"] = lua_bodyprefix .. version
	file_comment["createTime"] = lua_bodyprefix .. createTime
	file_comment["lastUpdate"] = lua_bodyprefix .. lastUpdate
	file_comment["desc"] =  lua_bodyprefix .. desc 
	file_comment["end"] = { lua_headline , ""}
end

local function update_last_time() 
	local curBuf = vim.api.nvim_get_current_buf()
	local lcount = vim.api.nvim_buf_line_count(curBuf)
	for l = 1, lcount, 1 do
		line = vim.api.nvim_buf_get_lines(curBuf, l, l + 1, false)[1]
		res = string.match(line, file_comment["lastUpdate"])
		if res ~= nil 
		then
			vim.api.nvim_buf_set_lines(curBuf, l, l + 1, false, { file_comment["lastUpdate"] .. os.date("%Y-%m-%d %H:%M:%S") })
			break
		end
	end
end

local function insert_comment()
	local curBuf = vim.api.nvim_get_current_buf()
	local now = os.date("%Y-%m-%d %H:%M:%S")
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, file_comment["end"])
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, { file_comment["desc"] })
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, {file_comment["lastUpdate"] .. now})
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, {file_comment["createTime"] .. now})
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, { file_comment["version"] })
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, { file_comment["author"] })
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, { file_comment["license"] })
	vim.api.nvim_buf_set_lines(curBuf, 0, 0, false, { file_comment["head"] })
end

local normalft = {c = 1, cpp = 1, h = 1, hpp = 1, go = 1, java = 1, cs = 1, rust = 1}
local shft = {sh = 1, python = 1}
local luaft = {lua = 1}

local function init()
	local curBuf = vim.api.nvim_get_current_buf()
	local ft = vim.api.nvim_buf_get_option(curBuf, "ft")
	if normalft[ft] == 1
	then
		init_normal_file_comment()
	elseif shft[ft] == 1
	then
		init_bash_file_comment()
	elseif luaft[ft] == 1
	then
		init_lua_file_comment()
	end
end

local function insert_file_name()
	init()
	insert_comment()
end

local function update_last_update()
	init()
	update_last_time()
end

return {
	insert_file_name, 
	update_last_update,
}
