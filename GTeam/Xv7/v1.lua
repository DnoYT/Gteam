function er()
  SXX2="local XX={XXjh}\nlocal XX = {} for i, v in pairs(XX) do XX[i] = v end XX.io = {} XX.gg = {} XX.string = {} for i, v in pairs(io) do XX.io[i] = v end for i, v in pairs(string) do XX.string[i] = v end for i, v in pairs(gg) do XX.gg[i] = v end local XXZ = {} XXZ.info = {}	for i, v in ipairs(XXZ.info) do XXZ[XXZ.setsList[i]] = v end g={} for index,value in pairs(g) do return value end "
  g={}
  g.last=gg.getFile()
  file = io.open(xx3,"r")
  assert(file)
  data= file:read("*a")
  file:close()
  XX=''
  math.randomseed(os.clock()*10000)
  for i=1,8 do
    XX=XX..math.random(0,255)..','
  end
  wzdm=string.gsub(SXX2,'XXjh',XX)
  test=load("local xx7_0='辛心v7.0加密 在场的各位都是弟弟' local XXXX666=function() local XXXX666=0 \n"..wzdm..data.."\nend XXXX666()")
  g.out = xx4.."XX"
  g.file = io.open(g.out, "w")
  aaa=string.dump(test,true)
  wzdm = string.gsub(aaa, "LuaR","LuaS")
  g.file:write(wzdm)
  g.file:close()
  gg.setVisible(true)
  print('加密后脚本保存到文件:\n'..g.out)
  os.exit() 
  end