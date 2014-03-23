--[[

 
This program is free software: you can redistribute it and/or modify




This program is distributed in the hope that it will be useful,





along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-- Chisel description
description = "Shows the top files in terms of disk usage."
short_description = "top files by total bytes"
category = "IO"

-- Chisel argument list
args = {}

-- The number of items to show
TOP_NUMBER = 10

-- Argument notification callback
function on_set_arg(name, val)
	return false
end

-- Initialization callback
function on_init()
	chisel.exec("table_generator", 
		"fd.name",
		"Filename",
		"evt.rawarg.res",
		"Bytes",
		"fd.type=file and evt.is_io=true", 
		"" .. TOP_NUMBER,
		"bytes")
	return true
end
