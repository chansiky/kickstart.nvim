-- Sort the snacks explorer tree by modification time (newest first).
--
-- snacks hardcodes the explorer's ordering (dirs first, then name) inside
-- `Tree:walk`, with no option to change it, so we replace that method on the
-- tree singleton with a copy that uses our own comparator.
--
-- Press `S` in the explorer to toggle between "mtime" and "name".
-- NOTE: a directory's mtime only changes when entries are added/removed/renamed
-- in it, not when a file inside it is edited.

local M = { mode = 'mtime' } ---@type {mode: "mtime"|"name", patched?: boolean}

local function patch()
  if M.patched then
    return
  end
  M.patched = true
  local Tree = require 'snacks.explorer.tree'

  ---@param node snacks.picker.explorer.Node
  ---@param fn fun(node: snacks.picker.explorer.Node):boolean?
  ---@param opts? {all?: boolean}
  function Tree:walk(node, fn, opts)
    local abort = fn(node) ---@type boolean?
    if abort ~= nil then
      return abort
    end
    local children = vim.tbl_values(node.children) ---@type snacks.picker.explorer.Node[]
    local mtime = {} ---@type table<snacks.picker.explorer.Node, number>
    if M.mode == 'mtime' then
      for _, c in ipairs(children) do
        local stat = vim.uv.fs_stat(c.path)
        mtime[c] = stat and stat.mtime.sec or 0
      end
    end
    table.sort(children, function(a, b)
      if a.dir ~= b.dir then
        return a.dir == true -- keep directories on top
      end
      if M.mode == 'mtime' and mtime[a] ~= mtime[b] then
        return mtime[a] > mtime[b]
      end
      return a.name < b.name
    end)
    for c, child in ipairs(children) do
      child.last = c == #children
      if child.dir and (child.open or (opts and opts.all)) then
        abort = self:walk(child, fn, opts)
      else
        abort = fn(child)
      end
      if abort then
        return true
      end
    end
    return false
  end
end

return {
  {
    'snacks.nvim',
    opts = {
      picker = {
        sources = {
          explorer = {
            -- wraps the default source setup so the patch is applied the first time the explorer opens
            config = function(opts)
              patch()
              return require('snacks.picker.source.explorer').setup(opts)
            end,
            actions = {
              explorer_toggle_sort = function(picker)
                M.mode = M.mode == 'mtime' and 'name' or 'mtime'
                require('snacks.explorer.actions').update(picker, { refresh = true })
                vim.notify('Explorer sort: ' .. M.mode, vim.log.levels.INFO, { title = 'Snacks Explorer' })
              end,
            },
            win = { list = { keys = { ['S'] = 'explorer_toggle_sort' } } },
          },
        },
      },
    },
  },
}
