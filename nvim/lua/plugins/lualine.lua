local function format(component, text, hl_group)
  if not hl_group then
    return text
  end

  component.hl_cache = component.hl_cache or {}
  local lualine_hl_group = component.hl_cache[hl_group]
  if not lualine_hl_group then
    local utils = require("lualine.utils.utils")
    local mygui = function()
      local mybold = utils.extract_highlight_colors(hl_group, "bold") and "bold"
      local myitalic = utils.extract_highlight_colors(hl_group, "italic") and "italic"
      if mybold and myitalic then
        return mybold .. "," .. myitalic
      elseif mybold then
        return mybold
      elseif myitalic then
        return myitalic
      else
        return ""
      end
    end

    lualine_hl_group = component:create_hl({
      fg = utils.extract_highlight_colors(hl_group, "fg"),
      gui = mygui(),
    }, "LV_" .. hl_group)
    component.hl_cache[hl_group] = lualine_hl_group
  end
  return component:format_hl(lualine_hl_group) .. text .. component:get_default_hl()
end

local function pretty_path(opts)
  opts = vim.tbl_extend("force", {
    relative = "cwd",
    modified_hl = "MatchParen",
    filename_hl = "Bold",
    dirpath_hl = "Conceal",
  }, opts or {})

  return function(self)
    local path = vim.fn.expand("%:p")
    if path == "" then
      return ""
    end

    local cwd = vim.fn.getcwd()

    if opts.relative == "cwd" and path:find(cwd, 1, true) == 1 then
      path = path:sub(#cwd + 2)
    else
      local root = vim.fn.fnamemodify(path, ":h")
      path = path:sub(#root + 2)
    end

    local sep = package.config:sub(1, 1)
    local parts = vim.split(path, "[\\/]")

    if #parts > 3 then
      parts = { parts[1], "…", parts[#parts - 1], parts[#parts] }
    end

    if opts.modified_hl and vim.bo.modified then
      parts[#parts] = format(self, parts[#parts], opts.modified_hl)
    else
      parts[#parts] = format(self, parts[#parts], opts.filename_hl)
    end

    local dirpath = ""
    if #parts > 1 then
      dirpath = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
      dirpath = format(self, dirpath .. sep, opts.dirpath_hl)
    end
    return dirpath .. parts[#parts]
  end
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Initialize opts.sections if nil
      opts.sections = opts.sections or {}

      opts.options = {
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      }

      -- Initialize opts.sections.lualine_a if nil
      opts.sections.lualine_a = opts.sections.lualine_a or {}
      opts.sections.lualine_a = {
        {
          function()
            return ""
          end,
          padding = { left = 1, right = 0 },
          separator = "",
        },
        "mode",
      }

      -- Initialize opts.sections.lualine_c if nil
      opts.sections.lualine_c = opts.sections.lualine_c or {}
      opts.sections.lualine_c[4] = { pretty_path() }

      -- Initialize opts.sections.lualine_y if nil
      opts.sections.lualine_y = opts.sections.lualine_y or {}
      opts.sections.lualine_y = { "progress" }

      -- Initialize opts.sections.lualine_z if nil
      opts.sections.lualine_z = opts.sections.lualine_z or {}
      opts.sections.lualine_z = {
        { "location", separator = "" },
        {
          function()
            return ""
          end,
          padding = { left = 0, right = 1 },
        },
      }

      return opts
    end,
  },
}

