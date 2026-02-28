require("nvchad.mappings")

-- Unmap some NvChad defaults
vim.keymap.del("n", "<leader>ch")
vim.keymap.del("n", "<leader>cm")
vim.keymap.del("n", "<leader>ds")
vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader>gt")
vim.keymap.del("n", "<leader>ma")
vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>pt")
vim.keymap.del("n", "<leader>rn")
vim.keymap.del("n", "<leader>wK")
vim.keymap.del("n", "<leader>wk")
vim.keymap.del({ "n", "x" }, "<leader>fm")

-- A helper function to easily declare keymappings
local map = function(mode, lhs, rhs, opts)
  local options = {
    noremap = true,
    silent = true,
  }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- -----------------------------------------------------------------------------
-- General Mappings
-- -----------------------------------------------------------------------------

map("n", "<C-s>", "<cmd>w<CR>", {
  desc = "[S]ave file",
})

-- Better search navigation (centers screen and opens folds)
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward].'zzzv'", {
  expr = true,
  desc = "[N]ext Search Result",
})
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward].'zzzv'", {
  expr = true,
  desc = "Previous Search Result",
})

-- Better visual mode indentation
map("v", "<", "<gv", {
  desc = "Better indent left in visual mode.",
})
map("v", ">", ">gv", {
  desc = "Better indent right in visual mode.",
})

-- Move visually selected lines
map("v", "J", ":m '>+1<CR>gv=gv", {
  desc = "Move visually selected lines down.",
})
map("v", "K", ":m '<-2<CR>gv=gv", {
  desc = "Move visually selected lines up.",
})

-- Move handling word wrap
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move down handling word wrap",
})
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move up handling word wrap",
})

-- Telescope mappings
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", {
  desc = "Telescope [F]ind [M]arks",
})
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", {
  desc = "Telescope [F]ind [T]erminals",
})

-- Terminal mappings
map("t", "<Esc><Esc>", "<C-\\><C-n>", {
  desc = "[E]xit Terminal Mode",
})

-- -----------------------------------------------------------------------------
-- Competitive Programming / C++ Scripts
-- -----------------------------------------------------------------------------

local CP_TERM_WIN = nil
local CP_TERM_BUF = nil

map("n", "<leader>cr", function()
  local ft = vim.bo.filetype
  if ft ~= "cpp" and ft ~= "c" then
    vim.notify("Not a C/C++ file!", vim.log.levels.WARN)
    return
  end

  local curr_win = vim.api.nvim_get_current_win()

  vim.cmd("silent! wall")

  local file_path = vim.fn.expand("%:p")
  local file_dir = vim.fn.expand("%:p:h")
  local escaped_file = vim.fn.shellescape(file_path)
  local bin_out = vim.fn.tempname()
  local escaped_bin = vim.fn.shellescape(bin_out)

  local compiler = ft == "cpp" and "clang++" or "clang"
  local std = ft == "cpp" and "-std=c++17" or "-std=c11"
  local flags =
    string.format("-DDBG_MACRO_NO_WARNING -DDDBG_MACRO_FORCE_COLOR -DLOCAL -O2 %s -Wall -Wextra -Wshadow", std)

  local time_cmd = vim.fn.executable("gtime") == 1 and "gtime" or "/usr/bin/time"
  local time_fmt = [[$'\nReal: \e[1;36m\%e s\e[0m\tUser: \e[1;32m\%U s\e[0m\tMem: \e[1;33m\%M KB\e[0m']]

  local in_file = file_dir .. "/in"
  local has_input = vim.fn.filereadable(in_file) == 1 and vim.fn.getfsize(in_file) > 0

  local run_cmd = escaped_bin
  if has_input then
    run_cmd = run_cmd .. " < " .. vim.fn.shellescape(in_file)
  end

  local cmd = string.format(
    "%s %s %s -o %s && %s -f %s %s",
    compiler,
    flags,
    escaped_file,
    escaped_bin,
    time_cmd,
    time_fmt,
    run_cmd
  )

  if CP_TERM_WIN and vim.api.nvim_win_is_valid(CP_TERM_WIN) then
    vim.api.nvim_win_close(CP_TERM_WIN, true)
  end

  vim.cmd("botright 18split | term " .. cmd)

  CP_TERM_WIN = vim.api.nvim_get_current_win()
  CP_TERM_BUF = vim.api.nvim_get_current_buf()

  vim.bo[CP_TERM_BUF].buflisted = false
  vim.bo[CP_TERM_BUF].bufhidden = "wipe"

  map("n", "q", function()
    if vim.api.nvim_win_is_valid(curr_win) then
      vim.api.nvim_set_current_win(curr_win)
    end
    if vim.api.nvim_win_is_valid(CP_TERM_WIN) then
      vim.api.nvim_win_close(CP_TERM_WIN, true)
    end
  end, {
    buffer = CP_TERM_BUF,
    desc = "Return to code and close terminal",
  })

  if has_input then
    vim.cmd("stopinsert")
    vim.cmd("normal! gg")
  else
    vim.cmd("startinsert")
  end
end, {
  desc = "[C]ompile and [R]un CP Script",
})

map("n", "<leader>ci", function()
  local target_win = nil
  local file_dir = vim.fn.expand("%:p:h")
  local in_file = file_dir .. "/in"

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_name(buf) == in_file then
      target_win = win
      break
    end
  end

  if target_win then
    vim.api.nvim_set_current_win(target_win)
  else
    vim.cmd("vsplit " .. vim.fn.fnameescape(in_file))
  end

  local bufnr = vim.api.nvim_get_current_buf()

  vim.bo[bufnr].buflisted = false
  vim.bo[bufnr].bufhidden = "wipe"

  map("n", "q", "<cmd>w | close<CR>", {
    buffer = bufnr,
    desc = "Save and close input file",
  })

  vim.api.nvim_buf_set_lines(0, 0, -1, false, { "" })
  vim.cmd("startinsert")
end, {
  desc = "[C]lear [I]nput file (Smart)",
})
