
function mi64()
  local zm64={"a","b","c","d","e","f","g","h","m","z","k","l","i","o","p","s","j","z","x","v","n","y","t","r","u"}
  local hs=""
  local sz=""
  local lp=0
  local wll=math.random(32,64)
  for i=1,wll do
    local sj=math.random(1,25)
    local kl=math.random(1,4)
    local ko=math.random(1,6)
    if kl%2==0 and i>1 then zm66=zm64[sj] else
      zm66=string.upper(zm64[sj])
    end
    if ko%3==0 and lp<2 and i>1 then
      local zm66="_"
      local lp=lp+1
    end
    hs=hs..zm66
    sj,kl,ko=0,0,0
  end
  lp=0
  return hs
end