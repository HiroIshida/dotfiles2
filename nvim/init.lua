-- >> Setup plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "github/copilot.vim",
	"junegunn/fzf.vim",
	"junegunn/fzf",
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})
-- << Setup plugin manager

-- >> Setip LSP
local lspconfig = require('lspconfig')
local mason = require("mason")
require("mason").setup {}
require("mason-lspconfig").setup {ensure_installed = { "pyright", "clangd" }, }
lspconfig.pyright.setup{}
lspconfig.clangd.setup{}

vim.keymap.set("n", "<leader>dd", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable(0)
    vim.notify("LSP Diagnostics OFF", vim.log.levels.INFO)
  else
    vim.diagnostic.enable(0)
    vim.notify("LSP Diagnostics ON", vim.log.levels.INFO)
  end
end, { desc = "LSP Diagnostics ON / OFF" })
-- << Setup LSP

-- >> Setup keymaps
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'grr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })
-- << Setup keymaps

-- >> Custom commands
vim.api.nvim_create_user_command("DOACTION", "w | !./action.sh", {})
vim.cmd([[
  cabbrev fzf Files
  cabbrev ww DOACTION
]])
-- << Custom commands

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = false
vim.opt.swapfile = false

vim.opt.hlsearch = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.clipboard:append("unnamedplus")
vim.cmd('colorscheme vim')
vim.cmd [[
  highlight NormalFloat guibg=#f5c8c6 guifg=#1d1f21
  highlight FloatBorder guibg=#1d1f21 guifg=#81a2be
]]
