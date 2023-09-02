require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    }
  end,
  ["rust_analyzer"] = function (server_name)
    local rt = require("rust-tools")

    rt.setup {
      server = {
        on_attach = function(_, bufnr)
          -- Hover actions
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          -- Code action groups
          vim.keymap.set("n", "<Leader>.", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
      },
      tools = {
        autoSetHints = true,
        runnables = {
          use_telescope = true,
        },
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = " » ",
          other_hints_prefix = " » ",
        },
      },
    }
  end,
}
