return {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup(
        {'*';},
        {
          RGB      = true;         -- #RGB formato
          RRGGBB   = true;         -- #RRGGBB formato
          names    = true;         -- "Name" los colores como Blue o Red
          RRGGBBAA = true;         -- #RRGGBBAA formato
          rgb_fn   = true;         -- CSS rgb() y rgba() funciones
          hsl_fn   = true;         -- CSS hsl() y hsla() funciones
          css      = true;         -- Habilita todos los CSS * propiedades
          css_fn   = true;         -- Habilita todas las funciones CSS como rgba()
          -- En caso de necesitarlo, puedes agregar otros archivos
          -- mode     = 'background'; -- Modo de visualización de color: 'foreground' o 'background'
        })
    end
  }

