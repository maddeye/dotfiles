-- helper
local keymap = vim.keymap.set

--  leader key to space
vim.g.mapleader = " "

-- General keymaps
keymap("n", "<leader>pv", "<cmd>Ex<CR>")
keymap("n", "<leader>nh", "<cmd>nohl<CR>")
keymap("n", "<C-l>", "<cmd>nohlsearch<CR>")
keymap("n", "<space><space>x", "<cmd>source %<CR>")
keymap("i", "<C-c>", "<Esc>")

keymap("n", "U", "<C-r>", {})                                -- Use 'U' for redo

keymap("n", "b", "_")                                        -- jump to first non whitespace character of line

keymap("n", "<leader>ya", "<cmd>keepjumps normal! ggyG<CR>") -- copy all
keymap("n", "<leader>a", "ggvG<CR>")                         -- select all

-- Text manipulation
keymap("n", "<S-up>", "<Esc><cmd>m -2<CR>")   -- Move line up
keymap("n", "<S-down>", "<Esc><cmd>m +1<CR>") -- Move line down

keymap("n", "<A-u>", "guiw~w")                -- Capitalize Word
keymap("n", "<A-U>", "gUiww")                 -- Capitatlize inner word
keymap("n", "<A-l>", "guiww")                 -- Lower word

keymap("n", "<leader>r", [[:%s\<<C-r><C-w>\><C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keymap("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- Insert empty line without entering insert mode
keymap("n", "<leader>o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>')
keymap("n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>')

-- window keymaps
keymap("n", "<leader>sv", "<C-w>v")                     -- split vertically
keymap("n", "<leader>sh", "<C-w>s")                     -- split horizontally
keymap("n", "<leader>se", "<C-w>=")                     -- make split windows equal width
keymap("n", "<leader>sx", ":close<CR>")                 -- close current split window
keymap("n", "<leader>ss", ":vertical resize -5<CR>")    -- decrease window size
keymap("n", "<leader>sg", ":vertical resize +5<CR>")    -- increase window size
keymap("n", "<leader>ssh", ":horizontal resize -5<CR>") -- decrease window height
keymap("n", "<leader>sgh", ":horizontal resize +5<CR>") -- increase window height

-- window navigation
keymap("n", "<leader>mh", "<C-w>h")
keymap("n", "<leader>mj", "<C-w>j")
keymap("n", "<leader>mk", "<C-w>k")
keymap("n", "<leader>ml", "<C-w>l")

--maxizer
keymap("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

--diagnostic
keymap("n", "[se", vim.diagnostic.open_float) -- show diagnostics for line
keymap("n", "[p", vim.diagnostic.goto_prev)   -- jump to previous diagnostic in buffer
keymap("n", "[n", vim.diagnostic.goto_next)   -- jump to next diagnostic in buffer
