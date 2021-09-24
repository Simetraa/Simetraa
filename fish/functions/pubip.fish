# Defined in - @ line 1
function pubip --wraps='dig +short myip.opendns.com @resolver1.opendns.com' --description 'alias pubip=dig +short myip.opendns.com @resolver1.opendns.com'
  dig +short myip.opendns.com @resolver1.opendns.com $argv;
end
