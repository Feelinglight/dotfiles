local map = vim.api.nvim_set_keymap 


function handy_map(mode, key, command, opts)
  opts = opts or {}
  default_opts = {noremap = true}
    
  for k,v in pairs(default_opts) do 
    opts[k] = v 
  end
  map(mode, key, command, opts)
end


-- Normal, Visual, Select, Operator-pending
function nmap(key, command) 
  handy_map('n', key, command)
end

-- Insert
function imap(key, command)
  handy_map('i', key, command)
end

-- Visual and Select
function vmap(key, command)
  handy_map('v', key, command)
end

-- Terminal
function tmap(key, command)
  handy_map('t', key, command)
end

