local logger = require "socket" --加载logger socket库
local cjson = require "cjson.safe" --加载cjson库

if not logger.initted() then --初始化logger
	local ok,err = logger.init{
			host = "127.0.0.1", --splunk IP
			port = 8888,		--splunk端口
			sock_type = "tcp",	--日志socket类型
			flush_limit = 1,
			}
	if not ok then --初始化失败处理
		ngx.log(ngx.ERR,"failed to initialize the logger: ",err)
		return
	end
end

local log = ngx.ctx.log --接收ngx.ctx.log跨阶段传过来的日志信息

if type(log) == "table" then --判断日志不为空则记录
	local bytes, err = logger.log(cjson.encode(log) .. "\r\n")
	if err then
		ngx.log(ngx.ERR, "failed to log message: ", err)	
	end
end