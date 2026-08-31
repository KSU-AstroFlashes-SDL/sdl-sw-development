vim.opt.encoding = "utf-8"
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.autoindent = true

-- Default indentation (applies to filetypes not overridden below)
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Register a custom filetype for *.fpp (Fprime-specific DSL, not Fortran).
vim.filetype.add({
  extension = {
    cpp = "cpp",
    cxx = "cpp",
    h = "cpp",
    hpp = "cpp",
    fpp = "fpp",
  },
})

-- C/C++ headers and sources: 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "cpp", "c", "h", "fpp" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Python: 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.expandtab = true
  end,
})
