require "import"
import "android.widget.*"
import "android.view.*"
import "java.io.File"
import "android.os.Environment"
本地目录=Environment.getExternalStorageDirectory().toString()
基础=[[版本(15)版本
文件名(c0.2.5.apk)文件名
网址(http://gts.gt-eam.cn/)网址
目录(/storage/emulated/0/GTSkey/)目录
标题(更新了测试版本c0.2.5)标题
内容(
2020-2-23  13:30 0.2.5
     增加QQ闪照查看
     增加我在人间凑数的日子
     

--测试版
2019-05-04  21:30 0.2.3
    增加GT团队新成员 GT初心
    优化项目布局（该功能将增加我们的更新速度）
    成立GTeam项目组
    GTXv7正式上线 慢加载版
    GT无名开始编写 GGlua加密合集3.0
    大家久等了！
    

2019-04-28 11:30 0.2.2(没上线)
    添加官网
    GT添加三名成员
      释怀
      Sam
      琅琊
    详情可访问我们的网站
    http://www.comgt.cn
  本次更新内容：
      gts5.2>>gts5.3
    大幅度优化

2019-04-37 15.37 0.2.1
    更新m3u8视频合并
    可以加入内测反馈QQ群：1016790132
    支持云天
    为云天提供新思路
    增加诺干bug
    
    
2019-04-18 11.03 2.0
    更新图片二维码生成
    布局不怎么好看
    下个版本优化
    感谢支持着
    版本号不够用
    加一个版本0
    ⊙▽⊙


2019-04-17 07:52 1.9
    暂时修复bug
    作者打算重新编写
    代码太乱……
    修复还不如重新编写
    非常抱歉我的支持着


2019-04-04 04:00 1.8
    更新了支付宝装逼功能
    暂时下架，没有开启的功能
    更新有人为我们负重前行！
    向4-1 30位英雄敬礼！！
    从此中国再也没有愚人节！！

2019-03-29 21:00
    紧急修复超大bug
    修复部分手机不兼容

2019-03-29 12:00
    修改包名
    修改软件名
    更新界面
    更新GTS5.2
    重组m3u8(暂时没有上架)

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
    添加关于p


2019-3月6日 00:10
     更新GTpor1.2
     更新直接让GG运行，修改部分bug！

2019-3月5日 23:40
     发布GTpor1.1 )内容

大小(1192530)大小

file1(/storage/emulated/0/)file1
path1(/storage/emulated/0/)path1
]]

基础=基础:gsub("文件名.-\n","文件名("..现在文件名..")文件名")
local QQ目录1="/tencent/MobileQQ/WebViewCheck/"
local TIM目录1="/tencent/Tim/WebViewCheck/"

iwc=本地目录
for iw in string.gmatch(QQ目录1,"%w+") do
  iwc=iwc.."/"..iw
  if File(iwc).isDirectory() then
   else
    os.execute("mkdir "..iwc)
  end
end
iwc=本地目录
for iw in string.gmatch(TIM目录1,"%w+") do
  iwc=iwc.."/"..iw
  if File(iwc).isDirectory() then
   else
    os.execute("mkdir "..iwc)
  end
end


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
      file:write(新)
      file:close()
    end
   else
    file=io.open(主目录.."/data.txt","r+")
    基础=file:read('*a')
    if string.find(基础,新)==nil then
      file:write(新)
    end
    file:close()
  end
end

if 安装提示 then --print(更新提示)
  import "android.app.AlertDialog"
  AlertDialog.Builder(this)
  .setTitle(更新提示)
  .setMessage(string.match(基础,"内容%((.-)%)内容"))--获取更新内容
  .setPositiveButton("确定",{onClick=function() end})
  --.setNeutralButton("中立",nil)
  --.setNegativeButton("否认",nil)
  .show()
  缓存("文件名(%(.-)%)文件名",现在文件名)
end