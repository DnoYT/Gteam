--[[
Author: your name
Date: 2022-02-18 23:39:58
LastEditTime: 2022-02-24 11:43:36
LastEditors: your name
Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
FilePath: \gteam\rz\cj.lua
--]]
require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "http"




url="http://gts.gt-eam.cn/ppx"
function 下载()
  url="http://gts.gt-eam.cn/ppx"
  require "import"
  import "http"
  local v1=http.get(url.."/data.txt")
  if v1 then
    if v1:find("404 Not Found") then
      print("网络错误 404")
      return false
    end
    --print(v1)
    路径=activity.getLuaDir().."/data.txt"
    内容=v1

    import "java.io.File"
    f=File(tostring(File(tostring(路径)).getParentFile())).mkdirs()
    io.open(tostring(路径),"w"):write(tostring(内容)):close()

   else
    print("网络错误")
    return false
  end

end


function 添加(txt)
  v2=http.post(url.."/tj.php","txt="..txt)
  print(v2)
end


function 导出()
  ml=activity.getLuaDir().."/data.txt"
  local v1=io.readall(ml)
  if not v1 then
    print("请重新安装软件")
  end


  处理1={}
  for w in string.gmatch(v1, "[^\n]+") do
    -- print(w)    --连续输出每个单词
    table.insert(处理1,w)
  end

  --print(dump(处理1))

  txt=[[
  
  
  本文出自 《我在人间凑数的日子》
  作者：皮友 记住不是抖有什么其他友是皮友！！！ 皮友 皮友！！
  编剧：皮友
  出版社：没有
  
  --ps 如果不行被骂si  请不要抄袭 有本事你们自己写
  --这个是我们经历的事  请你们自重
  
  
  
  ]]

  空格="\n                "
  for i=1,#处理1 do
    -- table.insert(处理,处理1[#处理1-i+1])
    w=处理1[#处理1-i+1]
    w1=w:gsub("—.+","")
    w2=w:match("——(.+)")
    if not w2 then
      w2=""
    end
    txt=txt.."\n\n"..w1..空格..w2
  end
  scml="/storage/emulated/0/我在人间凑数的日子.txt"
  f2=io.open(scml,"w")
  f2:write(txt)
  f2:close()
  print("输出在",scml)
end

