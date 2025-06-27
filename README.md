# Neovim Utils

A lightweight and general-purpose utility library for Neovim plugins, providing a collection of helper functions for common data manipulation tasks.

## Installation

Install using your favorite plugin manager.

### Packer

```lua
use 'jkaraskiewicz/utils.nvim'
```

### vim-plug

```vim
Plug 'jkaraskiewicz/utils.nvim'
```

## API

### `utils.arrays`

#### `find_first(arr, pred)`

Finds the first element in an array that satisfies the predicate.

-   `arr`: An array to search.
-   `pred`: A function that takes `(key, value)` and returns `true` for a match.

*Example:*

```lua
local utils = require('utils')
local arr = { 'a', 'b', 'c' }
local found = utils.arrays.find_first(arr, function(k, v)
  return v == 'b'
end)
-- found will be 'b'
```

### `utils.tables`

#### `find(tbl, pred)`

Finds the first element in a table that satisfies the predicate.

-   `tbl`: A table to search.
-   `pred`: A function that takes `(key, value)` and returns `true` for a match.

*Example:*

```lua
local utils = require('utils')
local tbl = { a = 1, b = 2, c = 3 }
local found = utils.tables.find(tbl, function(k, v)
  return v == 2
end)
-- found will be 2
```

#### `filter(tbl, pred)`

Filters a table, returning a new table with only the elements that satisfy the predicate.

-   `tbl`: A table to filter.
-   `pred`: A function that takes `(key, value)` and returns `true` to keep the element.

*Example:*

```lua
local utils = require('utils')
local tbl = { a = 1, b = 2, c = 3 }
local filtered = utils.tables.filter(tbl, function(k, v)
  return v > 1
end)
-- filtered will be { b = 2, c = 3 }
```

#### `filter_not(tbl, pred)`

Filters a table, returning a new table with only the elements that *do not* satisfy the predicate.

-   `tbl`: A table to filter.
-   `pred`: A function that takes `(key, value)` and returns `true` to exclude the element.

*Example:*

```lua
local utils = require('utils')
local tbl = { a = 1, b = 2, c = 3 }
local filtered = utils.tables.filter_not(tbl, function(k, v)
  return v > 1
end)
-- filtered will be { a = 1 }
```

#### `is_array(tbl)`

Checks if a table is an array (i.e., all keys are numbers).

-   `tbl`: The table to check.

*Example:*

```lua
local utils = require('utils')
local arr = { 1, 2, 3 }
local obj = { a = 1, b = 2 }
utils.tables.is_array(arr) -- returns true
utils.tables.is_array(obj) -- returns false
```

#### `contains(tbl, cond)`

Checks if a table contains a value or an element satisfying a predicate.

-   `tbl`: The table to check.
-   `cond`: A value to search for or a predicate function `(key, value)`.

*Example:*

```lua
local utils = require('utils')
local tbl = { a = 1, b = 2, c = 3 }
utils.tables.contains(tbl, 2) -- returns true
utils.tables.contains(tbl, function(k, v)
  return v == 2
end) -- returns true
```

#### `map(tbl, fn)`

Applies a function to each element of a table and returns a new table with the results.

-   `tbl`: The table to map over.
-   `fn`: A function that takes `(key, value)` and returns a new `(key, value)` pair.

*Example:*

```lua
local utils = require('utils')
local tbl = { a = 1, b = 2, c = 3 }
local mapped = utils.tables.map(tbl, function(k, v)
  return k, v * 2
end)
-- mapped will be { a = 2, b = 4, c = 6 }
```
