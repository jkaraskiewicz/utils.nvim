local M = {}

-- Declarations
M.arrays = {}
M.tables = {}

-- Arrays submodule
M.arrays.find_first = function(arr, pred)
  if type(arr) ~= 'table' then error('arr: Not an table') end
  if type(pred) ~= 'function' then error('pred: Not a function') end
  if not M.tables.is_array(arr) then error('arr: Not an array') end

  for k, v in ipairs(arr) do
    if pred(k, v) == true then return v end
  end

  return nil
end

-- Tables submodule
M.tables.find = function(tbl, pred)
  if type(tbl) ~= 'table' then error('tbl: Not an table') end
  if type(pred) ~= 'function' then error('pred: Not a function') end

  for k, v in pairs(tbl) do
    if pred(k, v) == true then return v end
  end

  return nil
end

M.tables.filter = function(tbl, pred)
  if type(tbl) ~= 'table' then error('tbl: Not an table') end
  if type(pred) ~= 'function' then error('pred: Not a function') end

  local ret = {}

  for k, v in pairs(tbl) do
    if pred(k, v) then ret[k] = v end
  end

  return ret
end

M.tables.filter_not = function(tbl, pred)
  if type(tbl) ~= 'table' then error('tbl: Not an table') end
  if type(pred) ~= 'function' then error('pred: Not a function') end

  local ret = {}

  for k, v in pairs(tbl) do
    if not pred(k, v) then ret[k] = v end
  end

  return ret
end

M.tables.is_array = function(tbl)
  if type(tbl) ~= 'table' then error('tbl: Not an table') end

  for k, _ in pairs(tbl) do
    if type(k) ~= 'number' then return false end
  end

  return true
end

M.tables.contains = function(tbl, cond)
  if type(cond) == 'function' then
    return M.tables.find(tbl, cond) ~= nil
  else
    local pred = function(_, el) return el == cond end
    return M.tables.find(tbl, pred) ~= nil
  end
end

M.tables.map = function(tbl, fn)
  if type(tbl) ~= 'table' then error('tbl: Not an table') end
  if type(fn) ~= 'function' then error('fn: Not a function') end

  local ret = {}

  for k, v in pairs(tbl) do
    local mk, mv = fn(k, v)
    ret[mk] = mv
  end

  return ret
end

return M
