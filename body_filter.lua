local resp_body = ngx.arg[1]
local eof = ngx.arg[2]
local ctx_log = {}

local regex = [[You have an error in your SQL syntax]]

local m = ngx.re.match(resp_body, regex, 'jio')

if m then
	ctx_log.rule_match = m[0]
	ctx_log.Request_line = ngx.var.request
	ctx_log.Request_headers = ngx.req.get_headers()
	ngx.ctx.log = ctx_log
end