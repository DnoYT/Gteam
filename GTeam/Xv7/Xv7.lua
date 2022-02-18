
function XXv7(XX)
  本地目录=Environment.getExternalStorageDirectory().toString()
  xx1=XX[1]:gsub('/[^/]+$','')--目录
  xx2=XX[1]:gsub(xx1..'/','')--文件
  -- xx3='/storage/emulated/0/Pictures/xx.回调'
  xx3=本地目录.."/Android/data/GTS.GTeam.byYT"
  import "java.io.File"--导入File类
  File(xx3).mkdir()
  local xx13=""
  local i
  for i=1,math.random(8,13) do
    xx13=xx13..math.random(0,9)
  end
  xx3=xx3.."/"..xx13..".lua"
  xx4=XX[1]
  file = io.open(XX[1],'r')
  jz = file:read('*a')
  file:close()
  file = io.open(xx3,"w")
  file:write(jz)
  file:close()--源码
  --装逼
  ZB=[[
--未完善
]]
  file = io.open(xx3,'r')
  jz = file:read('*a')
  file:close()
  file = io.open(xx3, "w")
  file:write(ZB)
  file:close()
  file = io.open(xx3, "a")
  file:write(jz)
  file:close()

  if XX[3]==true then--防改名
    daima=[[
local name = gg.getFile():match('[^/]+$')
if name~="xxxxxx" then
os.remove(gg.getFile())
gg.alert("验证失败，请重新下载原文件") 
os.exit() while true do os.exit() end 
end
]]
    daima=string.gsub(daima,"xxxxxx",XX[2])
    file = io.open(xx3,'r')
    jz = file:read('*a')
    file:close()
    file = io.open(xx3, "w")
    file:write(daima)
    file:close()
    file = io.open(xx3, "a")
    file:write(jz)
    file:close()
    rj("防更改原文件名: "..XX[2].." 成功")
  end

  if XX[5]==true then--设置密码
    daima=[[
mima="mmmm"
key=gg.prompt({
"ssss"}, 
{[1]=""}, {[1]="text\\n"}) 
if key == nil then 
os.exit() while true do end end
if key[1] ~= mima then gg.alert("密码错误！") 
os.exit() while true do os.exit() end end 
]]
    daima=string.gsub(daima,"mmmm",XX[4])
    daima=string.gsub(daima,"ssss",XX[6])
    file = io.open(xx3,'r')
    jz = file:read('*a')
    file:close()
    file = io.open(xx3, "w")
    file:write(daima)
    file:close()
    file = io.open(xx3, "a")
    file:write(jz)
    file:close()
    rj("设置密码: "..XX[4].." 成功")
  end

  xxh=[["]]
  xxhh=[[']]
  file = io.open(xx3)
  code = file:read("*a")
  file:close()
  function X(code)res=''
    for i in ipairs(code)do
      res=res..string.char(code[i])
    end
    return res
  end
  code=string.gsub(code,X({92,110}),"\n")
  code=string.gsub(code,X({92,114}),"\r")
  code=string.gsub(code,X({92,116}),"\t")
  p = xxh .. "(.-)" .. xxh
  for i in code:gmatch(p) do
    i = "X({" .. table.concat({i:byte(0, -1)}, ",") .. "})"
    n = n and n + 1 or 1
    code = code:gsub(p, i, 1)
  end
  if n then
    io.open(xx3, "w"):write(( mf or "") .. code):close()
    p = xxhh .. "(.-)" .. xxhh
    mf ="function X(code)res=''for i in ipairs(code)do res=res..string.char(code[i])end return res end "
    for i in code:gmatch(p) do
      i = "X({" .. table.concat({i:byte(0, -1)}, ",") .. "})"
      n = n and n + 1 or 1
      code = code:gsub(p, i, 1)
    end
    io.open(xx3, "w"):write((mf or "") .. code):close()
    rj("隐藏字符串 成功")
    import "xv7_1"
    import "xv7_2"
    import "xv7_3"
    file = io.open(xx3,'r')
    jz = file:read('*a')
    file:close()
    file = io.open(xx3, "w")
    file:write(hx1,hx3)
    file:close()
    file = io.open(xx3, "a")
    file:write(jz)
    file:close()
    file = io.open(xx3, "a")
    file:write(hx2)
    file:close()
    local data=io.open(xx3,"rb"):read("*a")
    data=data:gsub("xxxxxx","\\n")
    io.open(xx3,"w+"):write(data):close()
    rj("混淆防反编译 成功")
    v6= xx4.."XX"
    v6=xx4:gsub("/([^/]+)$","/"..XX[2])
    import "v2"
    file=io.open(v6,"w")
    v7=v3:gsub("xx4",string.format("'%s'",xx4)):gsub("xx3",string.format("'%s'",xx3))
    -- file:write(v7)
    -- file:close()
    --rj(v3:gsub("xx4",string.format("'%s'",xx4)):gsub("xx3",string.format("'%s'",xx3)))
    if XX[3] then
      rj("注意不要改名字")
    end
    --[[er(v7)
end
--调用防反编译
function er()]]
    SXX2="local XX={XXjh}\nlocal XX = {} for i, v in pairs(XX) do XX[i] = v end XX.io = {} XX.gg = {} XX.string = {} for i, v in pairs(io) do XX.io[i] = v end for i, v in pairs(string) do XX.string[i] = v end for i, v in pairs(gg) do XX.gg[i] = v end local XXZ = {} XXZ.info = {}	for i, v in ipairs(XXZ.info) do XXZ[XXZ.setsList[i]] = v end g={} for index,value in pairs(g) do return value end "
    g={}
    -- g.last=gg.getFile()
    file = io.open(xx3,"r")
    assert(file)
    data= file:read("*a")
    file:close()
    os.remove(xx3)
    XX=''
    --math.randomseed(os.clock()*10000)
    for i=1,8 do
      XX=XX..math.random(0,255)..','
    end
    wzdm=string.gsub(SXX2,'XXjh',XX)
    --test=load()
    test="local xx7_0=' GTXv7 辛心7.0加密  GTeam提供技术支持' local XXXX666=function() local XXXX666=0 \n"..wzdm..data.."\nend XXXX666()"
    -- g.out = xx4.."XX"
    --  g.file = io.open(g.out, "w")
    -- aaa=string.dump(test,true)
    import "com.luxts.network.Networks"
    if(Networks.isVpnUsed()) then
      AlertDialog.Builder(this)
      .setTitle("请关闭VPN")
      .setMessage("   本加密因为包涵源码，所以禁止使用VPN！\n如果你需要使用网络编译，也可以找我们合作！\n我们的联系方式在'关于我们'哪里有！\n\n   If you are a friend abroad, hello!\nThe use of this software requires a connection to the network, so the use of VPN is prohibited,It is possible that you need a VPN to connect to our Chinese server!\n\nIf you really like our products, you can contact us and find us to customize your foreign products!\n\n\t\tIf you want to contact us, you can check out about us!")
      .setPositiveButton("确定",nil)
      .show()
     else
      import "by"
      GT_dump(test,v6)
    end
    --wzdm = string.gsub(aaa, "LuaR","LuaS")
    --[[  g.file:write(wzdm)
  g.file:close()
  gg.setVisible(true)]]
    --rj('加密后脚本保存到文件:\n'..g.out)
    -- os.exit()
   else
    rj("隐藏字符串失败!")
  end
end