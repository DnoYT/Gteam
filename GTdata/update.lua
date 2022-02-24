
import "http"
--import "download"
import "GTdata.download2"
htt="http://gts.gt-eam.cn"--输入对接网址

function ss1_1(body)
  版本=body:match("版本%((.-)%)版本")+0
  标题=body:match("标题%((.-)%)标题")
  内容=body:match("内容%((.-)%)内容")
  网址=body:match("网址%((.-)%)网址")
  目录=body:match("目录%((.-)%)目录")
  大小=body:match("大小%((.-)%)大小")
  安装包名=body:match("文件名%((.-)%)文件名")
  mls=目录:gsub("/[^/]+$","")
  mls1=mls.."/"
  缓存内容={"版本","标题","内容","网址","目录","大小"}
  for i=1,#缓存内容 do
    load("准备1="..缓存内容[i])()
    准备='缓存("'..缓存内容[i]..'%((.-)%)'..缓存内容[i]..'",[['..准备1..']])'
    load(准备)()
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
      大小1=string.format("%0.2f",大小/1024/1024)
      tz="下载("..大小1..")MB"
     else
      tz="安装"
      apk=false
    end
    AlertDialog.Builder(this)
    .setTitle(标题)
    .setMessage(内容)
    .setPositiveButton(tz,{onClick=function(v)
        if apk then
          if 网络>2 then
            更新()
           else
            print("没有网络,请连接网络开始下载")
          end
         else
          开始安装(目录,安装包名,大小)
        end
      end})
    .setNegativeButton("取消",nil)
    .show()
  end
end


body=http.get(htt)
if #body>200 and string.find(body,"404")==nil and 网络>2 then
 else
  body=基础
end
ss1_1(body)