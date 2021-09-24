# Defined in - @ line 1
function cdc --wraps='cd /mnt/c' --description 'alias cdc=cd /mnt/c'
  cd /mnt/c $argv;
end
