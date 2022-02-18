
import "http"
--import "download"
import "download2"
htt="http://gts.gt-eam.cn"--输入对接网址
body=http.get(htt)
版本号=1

if #body>200 and string.find(body,"404")==nil then
  版本=body:match("版本%((.-)%)版本")+0
  标题=body:match("标题%((.-)%)标题")
  内容=body:match("内容%((.-)%)内容")
  网址=body:match("apk%((.-)%)apk")
  目录=body:match("file%((.-)%)file")
  大小=body:match("大小%((.-)%)大小")
  安装包名=body:match("文件名%((.-)%)文件名")
  mls=目录:gsub("/[^/]+$","")
  mls1=mls.."/"
  file1=io.open(mls1,"r")
  if file1==nil then
    os.execute("mkdir "..mls)
  end
 else
  版本=0
end


function 更新()
  if 网址~=nil then
下载("下载",网址..安装包名,目录..安装包名)--3.0
   -- 系统下载(安装包名,网址..安装包名)--2.0
    --http.download(网址,目录)--1.0
  end
end

if 版本>版本号 then
  if io.open(目录..安装包名,"r")==nil then
    apk=true
    tz="下载("..大小..")"
   else
    tz="安装"
    apk=false
  end
  AlertDialog.Builder(this)
  .setTitle(标题)
  .setMessage(内容)
  .setPositiveButton(tz,{onClick=function(v)
      if apk then 更新()
       else 
安装(目录,安装包名)
      end
    end})
  .setNegativeButton("取消",nil)
  .show()
end
