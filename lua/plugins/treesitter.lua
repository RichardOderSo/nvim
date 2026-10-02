return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",


    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup({})
        treesitter.install({
            "cpp", "python", "c", "lua", "vim", "vimdoc", "java",
            "typescript", "rust", "markdown", "markdown_inline"
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { '*' },
            callback = function() 
                pcall(function ()
                    --enable highlighting
                    vim.treesitter.start()
                    -- enable indents
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

                end)
            end,
        })
    end,
}
