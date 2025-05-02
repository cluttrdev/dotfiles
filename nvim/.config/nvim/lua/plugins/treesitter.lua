return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = "*",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "bash",
          "c",
          "cmake",
          "c_sharp",
          "cpp",
          "css",
          "diff",
          "dockerfile",
          "git_config", "git_rebase", "gitcommit", "gitignore",
          "go", "gotmpl",
          "graphql",
          "hcl",
          "html",
          "javascript",
          "just",
          "lua",
          "make",
          "markdown", "markdown_inline",
          "proto",
          "python",
          "scss",
          "sql",
          "terraform",
          "toml",
          "xml",
          "yaml",
        },
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = false,

        -- Consistent syntax highlighting
        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },

        -- Indentation based on treesitter
        indent = {
          enable = true,
        },
      })

      -- language specifics
      vim.filetype.add({
        extension = {
          gotmpl = "gotmpl",
        },
        pattern = {
          [".*/templates/.*%.tpl"] = "helm",
          [".*/templates/.*%.ya?ml"] = "helm",
          ["helmfile.*%.ya?ml"] = "helm",
        },
      })

      -- let treesitter handle folding and indentation
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.opt.foldlevel = 99
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      opts = {
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {}
  },
}
