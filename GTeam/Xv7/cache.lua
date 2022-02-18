require "import"
import "android.widget.*"
import "android.view.*"
import "java.io.File"

基础=[[
xv7file(/storage/emulated/0/)xv7file
]]


--生成主目录
主目录= 本地目录.."/GTSkey"
if File(主目录).isDirectory() then
 else
  os.execute("mkdir "..主目录)
end

主目录= 本地目录.."/GTSkey/xv7data"
if File(主目录).isDirectory() then
 else
  os.execute("mkdir "..主目录)
  file=io.open(主目录.."/data.txt","w")
  file:write(基础)
  file:close()
end

if File(主目录.."/data.txt").isFile() then
 else
  file=io.open(主目录.."/data.txt","w")
  file:write(基础)
  file:close()
end

function 缓存(旧,新)
  if #旧>0 then
    基础1 = io.open(主目录.."/data.txt","r")
    基础=基础1:read('*a')
    基础1:close()
    if string.find(基础,旧)~=nil then
      输出=基础:gsub(基础:match(旧),新)
      file=io.open(主目录.."/data.txt","w")
      file:write(输出)
      file:close()
     else
      file=io.open(主目录.."/data.txt","r+")
      基础=file:read('*a')
      新1=旧:match("%(%.%-%)")
      if 新1 ~= nil then
        新 = 旧:gsub("%(%.%-%)","("..新..")")
        新=新:gsub("%%.","")
      end
      file:write("\n"..新)
      file:close()
    end
   else
    file=io.open(主目录.."/data.txt","r+")
    基础=file:read('*a')
    if string.find(基础,新)==nil then
      file:write("\n"..新)
    end
    file:close()
  end
end
基础1 = io.open(主目录.."/data.txt","r")
基础=基础1:read('*a')
基础1:close()