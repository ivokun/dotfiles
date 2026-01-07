-- Silence the "harmless" ESLint warning
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("eslint triggers a registerCapability handler") then
		return
	end
	notify(msg, ...)
end
