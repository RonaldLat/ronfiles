local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- format
-- Fast saving
map("n", "++", "<cmd>write!<CR>", opts)

-- Some useful quickfix shortcuts for quickfix
map("n", "<C-n>", "<cmd>cnext<CR>zz", opts)
map("n", "<C-m>", "<cmd>cprev<CR>zz", opts)
map("n", "<leader>a", "<cmd>cclose<CR>", opts)

-- Exit on jj and jk
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Exit on jj and jk
map("i", "jj", "<ESC>", opts)
map("i", "jk", "<ESC>", opts)
map("i", "kj", "<ESC>", opts)

map("n", ";", ":", opts)

map('n', '<leader>s', ':source %<CR>', opts)
-- Remove search highlight
map("n", "<leader>c", "<cmd>nohlsearch<CR>", opts)
-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>', opts)

-- Fast saving with <leader> and s
map('n', '<leader>w', ':w<CR>', opts)

-- Grab text between curly braces
map("n", "YY", "va{Vy", opts)

-- goodies
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- If I visually select words and paste from clipboard, don't replace my
-- clipboard with the selected word, instead keep my old word in the
-- clipboard
map("x", "p", '"_dP', opts)

-- Better split switching
-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Visually select lines, and move them up/down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- map("n", "<leader>c", ":bd<cr>", opts)
--
-- barbar mappings

-- Move to previous/next
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader-x>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
-- map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
-- map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
