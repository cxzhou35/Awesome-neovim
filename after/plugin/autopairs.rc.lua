local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({disable_filetype = {"TelescopePrompt", "vim"}})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_setup, cmp_autopairs = pcall(require,
                                                 "nvim-autopairs.completion.cmp")
if not cmp_autopairs_setup then return end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then return end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
