require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

for _, mode in pairs({ 'n', 'i', 'v', 'x'}) do
  for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>'}) do
    map(mode, key, '<nop>')
  end
end
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
