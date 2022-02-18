require "import"
import "android.widget.ArrayAdapter"
import "android.widget.LinearLayout"
import "android.widget.TextView"
import "java.io.File"
import "android.widget.ListView"
import "android.app.AlertDialog"
function ChoiceFile(StartPath)
  --创建ListView作为文件列表
  lv=ListView(activity).setFastScrollEnabled(true)
  --创建路径标签
  cp=TextView(activity)
  lay=LinearLayout(activity).setOrientation(1).addView(cp).addView(lv)
  function SetItem(path)
    path=tostring(path)
    ls=File(path).listFiles()
    if ls~=nil then
      ls=luajava.astable(File(path).listFiles()) --全局文件列表变量
      table.sort(ls,function(a,b)
        return (a.isDirectory()~=b.isDirectory() and a.isDirectory()) or ((a.isDirectory()==b.isDirectory()) and a.Name<b.Name)
      end)
     else
      ls={}
    end
    QQ={}
    for index,c in ipairs(ls) do
      if string.find(c.Name,"config.json")~=nil then
        QQ[#QQ+1]=c.Name:gsub("config.json","")
      end
      --print(c.Name)
    end
  end
  SetItem(StartPath)
end
QQ目录= 本地目录.."/tencent/MobileQQ/WebViewCheck/"
ChoiceFile(QQ目录)
TIM目录= 本地目录.."/tencent/Tim/WebViewCheck/"
ChoiceFile(TIM目录)
--print(QQ[2])


function 加载图片(目录,QQ)
  qqjpg.setImageBitmap(loadbitmap(目录..QQ[1]..".png"))
end

function 下载png(QQH)
  thread(function(QQH,目录,QQ)
    require "import"
    import "http"
    import "java.io.File"
    QQ图片="http://q.qlogo.cn/headimg_dl?bs=qq&dst_uin="..QQH.."&src_uin=www.feifeiboke.com&fid=blog&spec=640"
    http.download(QQ图片,目录..QQH..".png")
      if File(tostring(目录..QQ[1]..".png")).length() > 30 then
        call("加载图片",目录,QQ)
      end
  end,QQH,目录,QQ)
end




--获取图片
import "http"
if QQ[1]~=nil then
  if File(目录..QQ[1]..".png").isFile() then
    if File(tostring(目录..QQ[1]..".png")).length() > 30 then
      qqjpg.setImageBitmap(loadbitmap(目录..QQ[1]..".png"))
     else
      qqjpg.setImageBitmap(loadbitmap("icon.png"))
      下载png(QQ[1])
      -- os.remove(目录..QQ[1]..".png")
    end
   else
    if 网络>2 then
      下载png(QQ[1])
      -- qqjpg.setImageBitmap(loadbitmap(目录..QQ[1]..".png"))
     else
      qqjpg.setImageBitmap(loadbitmap("icon.png"))
      -- os.remove(目录..QQ[1]..".png")
    end
  end
 else
  print("没有检测到QQ号,无法加载图片……")
  qqjpg.setImageBitmap(loadbitmap("icon.png"))
end
-- then
--搭配图片
--qqjpg.setImageBitmap(loadbitmap("imgs/1.jpg"))
--end
for i=1,#QQ do
  缓存("\nQQ"..i..":.-:QQ"..i,"\nQQ"..i..":"..QQ[i]..":QQ"..i.."\n")
end