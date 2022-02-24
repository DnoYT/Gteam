require "import"
import "android.widget.*"
import "android.view.*"
import "java.io.File"

基础=[[版本(6)版本
文件名(1.1.apk)文件名
网址(http://gts.gt-eam.cn/)网址
目录(/storage/emulated/0/GTSkey/)目录
标题(更新了1.1)标题
内容(
2019-3月6日 2:29
    更新 基础m3u8视频合并
    修复bug
    修复bug
    后面加强版 m3u8真在编写中  
    压缩图片

2019-3月6日 13:18
    更新GTpor1.4
    修复数字GG运行
    添加DZSH加密
    添加关于

2019-3月6日 00:10
     更新GTpor1.2
     更新直接让GG运行，修改部分bug！

2019-3月5日 23:40
     发布GTpor1.1 )内容

大小(2858580)大小
file1(/storage/emulated/0/)file1
path1(/storage/emulated/0/)path1
]]


--生成主目录
主目录= 本地目录.."/GTSkey"
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