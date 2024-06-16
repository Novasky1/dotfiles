return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- Instala todos los parsers disponibles
      ensure_installed = "all",
      highlight = {
        enable = true,              -- Habilita el resaltado de sintaxis
        additional_vim_regex_highlighting = false,
      },
      -- Puedes añadir más módulos aquí si lo deseas
    }
  end,
}
