-- local notify = require("notify")
-- local timer = vim.loop.new_timer()
--
-- function start_timer(duration)
--   timer:start(duration, 0, function()
-- 	-- notify("timer is going");
--     notify("Timer finished!", "info", { timeout = 5000 , replace = notifier})
--     timer:stop()
--   end)
-- end
--
-- function toggle_timer()
--   if timer:is_active() then
--     timer:stop()
--     notify("Timer paused", "info")
--   else
--     local duration = vim.fn.input("Enter timer duration (in seconds): ")
--     if duration ~= "" then
--       local seconds = tonumber(duration)
--       if seconds then
--         start_timer(seconds * 1000)
--         notify("Timer started", "info", {timeout = false})
--       else
--         notify("Invalid duration", "error")
--       end
--     end
--   end
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>bb", ":lua toggle_timer()<CR>", { noremap = true, silent = true })
--

-- vim.notify = require"Notify"

local timer = vim.loop.timer()

local notifier = vim.notify("starting ....", "info", {timeout = false})

ti

