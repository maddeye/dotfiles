-- helper
local keymap = vim.keymap

-- set leader key to space
vim.g.mapleader = " "

-- General Keymaps
keymap.set("n", "<leader>pv", ":Ex<CR>")
keymap.set("n", "<leader>nh", ":nohl<CR>")


-- Quicksave
keymap.set("i", "<C-s>", "<ESC><CMD>:w<CR>")

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("i", "<C-c>", "<Esc>")

keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window keymaps
keymap.set("n", "<leader>sv", "<C-w>v")     -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window navigation
keymap.set("n", "<leader>mh", "<C-w>h")
keymap.set("n", "<leader>mj", "<C-w>j")
keymap.set("n", "<leader>mk", "<C-w>k")
keymap.set("n", "<leader>ml", "<C-w>l")

--tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab

--maxizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

