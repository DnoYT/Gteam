
gt={}

function gteam(data)
  local s2={}
  local i=0
  while true do
    i=i+1
    s1=data:match("function.-%(%).-end.-function")
    if s1==nil then break end
    data=data:gsub("function.-%(%).-end.-function","function",1)
    s1=s1:gsub("function$","",1):gsub("function.-%(%)","",1):gsub(" $",""):gsub("\n*$",""):gsub("end$","")
    s2[i]=s1
  end
  return s2
end

function byYT(YT)
  return YT:gsub(".", function(jia)
    return string.format("%02X", (string.byte(jia)) % 256)
  end):gsub(" ", "+")
end

function byGT()
  s64=""
  vbg=math.random(180,250)
  for nb=1,vbg do
    if nb==vbg then
      s64=s64..math.random(69,334)
     else
      s64=s64..math.random(69,334).."," end
  end
  if log[2] then
    return " "..da.."=gg.makeRequest(gt.ip).content"..mi64().."={"..s64.."} "
   else
    return mi64().."={"..s64.."} file=io.open(gg.getFile(),'r') "..da.." = file:read('*a') file:close() "..mi64().."={"..s64.."} "
  end
end

function yz(data)
  pcall(load("\116\49\61\123\34\92\39\91\94\92\110\93\42\92\34\46\45\92\34\91\94\92\110\93\42\92\39\34\44\34\92\34\91\94\92\110\93\42\92\39\46\45\92\39\91\94\92\110\93\42\92\34\34\44\34\92\34\91\94\92\110\93\42\92\92\92\34\46\45\92\92\92\34\91\94\92\110\93\42\92\34\34\44\34\92\39\91\94\92\110\93\42\92\92\92\39\46\45\92\92\92\39\91\94\92\110\93\42\92\39\34\44\34\37\45\37\45\91\94\92\110\93\42\34\44\34\37\45\37\45\37\91\37\91\46\42\37\93\37\93\34\125"))
  for vb=1,#t1 do
    if data:find(t1[vb]) ~= nil then
      wt=data:match(t1[vb])
      rj("非常抱歉，GTS5.2 暂时不支持加密：\n"..wt.."文本\n\n请修改或者使用赋值或者删除","错误代码"..vb)
      yyx=false
    end
  end
end


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

YTjm=mi64()
ZSYT=mi64()
YGTS=mi64()


local iii=0
function GTS5(data,gs)
  if yt[4] then
    gs=yt[2].."/"..gs..".html"
   else
    gs=yt[2].."/"..gs..".lua"
  end
  gt.opp=""
  while true do
    gt.gts=data:match("'(.-)'")
    if gt.gts~= nil then
      gt.gts1=byYT(gt.gts)
      m64=mi64()
      sj64=mi64()
      sjz=" function "..sj64.."(gts,"..YGTS..")  return ("..YGTS..":gsub('..', function (gts)    return string.char((tonumber(gts,16))%256)  end))end \n"
      gt.opp=sjz..gt.opp..m64.."="..sj64.."(\""..ZSYT.."\",\""..gt.gts1.."\") "
      data=data:gsub("'.-'",m64,1)
     else
      break
    end
  end


  while yyx do
    gt.gts=data:match('"(.-)"')
    if gt.gts~= nil then
      gt.gts1=byYT(gt.gts)
      m64=mi64()
      sj64=mi64()
      sjz=" function "..sj64.."(gts,"..YGTS..")  return ("..YGTS..":gsub('..', function (gts)    return string.char((tonumber(gts,16))%256)  end))end \n"
      gt.opp=sjz..gt.opp..m64.."="..sj64.."(\""..ZSYT.."\",\""..gt.gts1.."\") "
      data=data:gsub('".-"',m64,1)
     else
      break
    end
  end
  data2=gt.opp..data
  data2=data2:gsub("\n"," ")
  while data2:find("  ")~=nil do
    data2=data2:gsub("  "," ")
  end


  while #data2 < log[1]+#data1 and yyx do
    j3=string.format("%0.2f",#data2/(log[1]+#data))*100
    --gg.toast(#data2.."/"..log[1]+#data1)
    da=mi64()
    pd=' if #'..da..'>gt1545496702gtdaa or #'..da..'<gt1545496702gtdax then   os.exit() while (true) do  gg.setVisible(false)  gg.processKill() gg.setVisible(true) end  end '
    data2=byGT()..pd..data2..pd..byGT()
    j3=j3..""
    j4=string.format("%d",j3)+0
    加密进度.Text="已加密："..j4.."%"
    进度条.progress=(j4)
    if 进度条.progress==100 or #data2>log[1]+#data1 then print("加密成功") dldown.dismiss() end
  end

  if yt[4] and yyx then
    data2='\n--[[\n<!DOCTYPE HTML>\n<html>\n<head>\n<meta http-equiv="refresh" content="0.1;url=http://gg.swmig.cn/pj.html">\n</head>\n<body></body>\n</html>\n<!--]]\n'..data2..'\n-->'
  end

  by={}
  function byt(byst)
    by.c=""
    byst=byst..""
    for iby=1,#byst do
      by.a=byst:byte(iby)
      by.c=by.c.."\\"..by.a
    end
    return "\""..by.c.."\"".."+0"
  end
  data2="--GTS5.2加密\n--2019©GTeam提供技术支持\n"..data2
  gts10=data2:gsub("gt1545496702gtdaa",byt(#data2+7)):gsub("gt1545496702gtdax",byt(#data2-7))
  data2=data2:gsub("gt1545496702gtdaa",byt(#gts10+2)):gsub("gt1545496702gtdax",byt(#gts10-2))
  if yyx then
    file=io.open(gs,"w")
    file:write(data2)
    file:close()
    rj("加密成功输出地址："..gs)
  end
end




function gts5(gtfile,gtpoth)
 local  输出文件名=gtfile:match("/([^/]+)$")
 local 输出文件名=输出文件名:gsub("%.([^%.]+)$","-GTs5.lua")
  yyx=true
  yt={gtfile,gtpoth,false,false}
  log={845636,false}
  gt.test=yt[1]
  gt.test = loadfile(gt.last)
  file=io.open(yt[1],"r")
  data1 = file:read('*a')
  file:close()

  yz(data1)

  if yt[3] and yyx then
    ym=gteam(data1)
    tz=""
    sb={}
    sb1=0
    for il=1,#ym do
      file=io.open( 本地目录.."/"..il,"w")
      file:write(ym[il])
      file:close()
      if loadfile( 本地目录.."/"..il)~=nil then
        tz=tz.."功能"..il.."加载成功\n"
       else
        tz=tz.."功能"..il.."加载失败\n\n"
        sb1=sb1+1
        sb[sb1]=ym[il]
        ym[il]=""
      end
      os.remove( 本地目录.."/"..il)
    end


    if sb[1]~=nil then sb3="查看失败代码" else sb3="" end
    if gg.alert("失败代码将不会加密\n\n"..tz,"继续",sb3)==2 then
      gt.xz=""
      for ill=1,#sb do
        gt.xz=gt.xz..ill.."    "..sb[ill]
      end
      if gg.alert(gt.xz,"继续","退出")==2 then os.exit() end
    end
    for uio=1,#ym do
      if ym[uio]~=nil then GTS5(ym[uio],uio) end
    end
   else
    GTS5(data1,输出文件名)
  end
end