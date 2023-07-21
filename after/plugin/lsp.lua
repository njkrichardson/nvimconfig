local lsp = require('lsp-zero')
lsp.preset("recommended")

lsp.ensure_installed({
	'clangd',
	'bashls',
	'ansiblels',
	'dockerls',
	'jedi_language_server',
	'yamlls'
})

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }), 
    }
})

lsp.set_preferences({
 	sign_icons = { }
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
end)


-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
