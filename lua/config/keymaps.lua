-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- s = { '<cmd>HopLineStart<cr>', "Hop line start" },
-- S = { '<cmd>HopWord<cr>', "Hop word" },
-- l = { '<cmd>HopLine<cr>', "Hop line" },
-- p = { '<cmd>HopPattern<cr>', "Hop pattern" },

vim.keymap.set("n", "gT", ":BufferLineCyclePrev<cr>")
vim.keymap.set("n", "gt", ":BufferLineCycleNext<cr>")
