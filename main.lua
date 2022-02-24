require "import"
import "config"
import "android.os.Environment"
本地目录=Environment.getExternalStorageDirectory().toString()
import "GTdata.network"
import "GTdata.cache"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)



项目={
  {
    ["名"]="GTS5.3",
    ["介绍"]="第5代加密的升级版\n加密后编译一下效果会更好~",
    ["logo"]="GTS5/icon.png",
  },

  {
    ["名"]= "GTXv7",
    ["介绍"]= "GT团队辛心 加密第7个版本",
    ["logo"]= "Xv7/icon.png",
  },
  {
    ["名"]= "二维码制作",
    ["介绍"]= "一个简单快捷的带logo制作二维码工具",
    ["logo"]= "ewm/icon.png",
  },
  {
    ["名"]= "m3u8视频合并",
    ["介绍"]= "把m3u8视频合并成mp4",
    ["logo"]= "m3u8/icon.png",
  },
  {
    ["名"]= "支付宝装逼",
    ["介绍"]= "装逼必备",
    ["logo"]= "zfb/icon.png",
  },
  {
    ["名"]= "QQ闪照查看",
    ["介绍"]= "让乔碧罗永远留在手机里",
    ["logo"]= "QQ/icon.png",
  },
  {
    ["名"]= "我在人间凑数的日子",
    ["介绍"]= "我不想活理所当然",
    ["logo"]= "rz/icon.png",
  },
  {
    ["名"]= "我在人间凑数的日子2",
    ["介绍"]= "2022重著版",
    ["logo"]= "rz/icon.png",
  },
}

import "layout"
import "GTdata.update"
--activity.setContentView(loadlayout(layout))
import "GTbu.Main"
import "GTbu.wm"
--主题布局
adp=LuaAdapter(activity,wm)
for v,n in ipairs(项目) do
  --  adp.add{主题=n,介绍=介绍[v],图片=图片[v]}
  adp.add{主题=n["名"],介绍=n["介绍"],图片=n["logo"]}
end


function 对话框(b2)
  load(b2)()
  AlertDialog.Builder(this)
  .setTitle(题目)
  .setMessage(公告)
  .setPositiveButton(积极,{onClick=function() load(积极代码)() end})
  .setNegativeButton(否认,nil)
  .show()
end

function GTS5()
  thread(function(Yurl)
    require "import"
    import "http"
    import "android.app.*"
    import "android.os.*"
    import "android.widget.*"
    import "android.view.*"
    local v1= Yurl .."/cs022.png"
    b2,b3,b4=http.get(v1)
    if b4==200 then
      load(b2)()
      if 开关==1 then
        activity.newActivity("GTS5/GTs5")
       else
        call("对话框",b2)
      end
     else
      print("该软件需要网络才能进入")
    end
  end,Yurl)
end


function GTXv7()
  thread(function(Yurl)
    require "import"
    import "http"
    import "android.app.*"
    import "android.os.*"
    import "android.widget.*"
    import "android.view.*"
    local v1=Yurl .."/cs023.png"
    b2,b3,b4=http.get(v1)
    if b4==200 then
      load(b2)()
      if 开关==1 then
        activity.newActivity("Xv7/main")
       else
        call("对话框",b2)
      end
     else
      print("该软件需要网络才能进入")
    end
  end,Yurl)
end

lb.setAdapter(adp)
lb.onItemClick=function(parent, v, pos,id)
  id = 项目[id]["名"]
  switch id
   case "GTS5.3"
    GTS5()
    -- activity.newActivity("GTS5/GTs5")
   case "支付宝装逼"
    activity.newActivity("zfb/main")
   case "二维码制作"
    activity.newActivity("ewm/main")
   case "m3u8视频合并"
    activity.newActivity("m3u8/main")
   case "GTXv7"
    GTXv7()
    -- activity.newActivity("Xv7/main")
   case "QQ闪照查看"
    activity.newActivity("QQ/main")
   case "我在人间凑数的日子"
    activity.newActivity("rz/main")
   case "我在人间凑数的日子2"
    activity.newActivity("PPX/main",{_G["Yurl"],_G["Ykey"]})
  end
  return true
end

--侧滑栏布局
GTtv={"关于我们"}
adp=LuaAdapter(activity,GTSide)
for v,n in ipairs(GTtv) do
  adp.add{GTtv=n}
end
chlll.Adapter=adp
chlll.onItemClick=function(parent, v, pos,id)
  switch id
   case 1
    -- print("第一个")
    activity.newActivity("adout")
   case 2
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("1545496702")
    print("已经复制QQ:1545496702")
   case 7
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("693434973")
    print("已经复制QQ群:693434973")
   case 8
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("1545496702@qq.com")
    print("已经复制邮箱:1545496702@qq.com")
  end
end


lb.onItemLongClick=function(l,v,p,i)--长按
  -- print(i)
  print("恭喜你发现彩蛋")
  return true
end




import "GTdata.qqpng"--加载QQ图片
import "GTbu.Animation"
缓存("\n\n","\n")

meun1.onClick=function()
  pop=PopupMenu(activity,meun1)
  menu=pop.Menu
  menu.add("关于").onMenuItemClick=function(a)
    activity.newActivity("adout")
  end
  menu.add("捐赠").onMenuItemClick=function(a)
    activity.newActivity("zfb/cz")
  end
  pop.show()--显示
end

--activity.newActivity('adout')


--[[
--点击两次返回
参数=0
function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    if 参数+2 > tonumber(os.time()) then
      activity.finish()
     else
      Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT ) .show()
      参数=tonumber(os.time())
    end
    return true
  end
end
--]]