require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "java.io.File"

activity.setTheme(R.AndLua1)
activity.setTitle("闪照查看器")
activity.setContentView(loadlayout(layout))





lb={
  LinearLayout;
  layout_width="-1";
  orientation="vertical";
  padding="5dp";
  layout_height="-2";
  {
    CardView;
    id="lbkp";
    radius="10dp";
    layout_width="110dp";
    layout_height="-2";
    layout_gravity="center";
    elevation="0dp";
    {
      LinearLayout;
      layout_width="-1";
      layout_height="-2";
      {
        ImageView;
        layout_width="110dp";
        id="lbtp";
        scaleType="fitXY";
        layout_height="110dp";

      };
    };
  };


  {
    TextView;
    id="wb";
  };

};




function 字符串切割(内容,切割内容)
  if not 内容 then return nil end
  local m = string.format("([^%s]+)",切割内容)
  local t = {}
  local k = 1
  for v in string.gmatch(内容, m) do
    t[k] = v
    k = k + 1
  end
  return t
end




function sh(cmd)
  local p=io.popen(string.format('%s',cmd))
  local s=p:read("*a")
  p:close()
  return s
end




function 查看闪照()
  图片路径=sh("find /storage/emulated/0/tencent/MobileQQ/chatpic/chatimg/*/Cache_*_fp")
  搜索数量=sh("find /storage/emulated/0/tencent/MobileQQ/chatpic/chatimg/*/Cache_*_fp|wc -l")
  图片数量=string.gsub(搜索数量,"\n","")
  print("查找到的数量为:"..图片数量.."个")
  adp=LuaAdapter(activity,lb)
  for i=1,图片数量 do
    返回值=字符串切割(图片路径,"\n")
    adp.add({lbtp=返回值[i]})
  end
  wg.Adapter=adp
end






tittle={"清空缓存","查看闪照"}
function onCreateOptionsMenu(menu)
  for k,v in ipairs(tittle) do
    if tittle[v] then
      local m=menu.addSubMenu(v)
      for k,v in ipairs(tittle[v]) do
        m.add(v)
      end
     else
      local m=menu.add(v)
      m.setShowAsActionFlags(1)
    end
  end
end
function onMenuItemSelected(id,tittle)
  if y[tittle.getTitle()] then
    y[tittle.getTitle()]()
  end
end

y={}
y["清空缓存"]=function()
  --事件
  os.execute("rm -rf /storage/emulated/0/tencent/MobileQQ/chatpic/chatimg/*")
  print("已清空全部闪照图片，如需查看请退出QQ重新打开闪照")
  查看闪照()
end


y["查看闪照"]=function()
  查看闪照()
end

--[[

function onCreateOptionsMenu(menu)
  menu.add("清空缓存").onMenuItemClick=function(a)
    os.execute("rm -rf /storage/emulated/0/tencent/MobileQQ/chatpic/chatimg/*")
    print("已清空全部闪照图片，如需查看请退出QQ重新打开闪照")
  end
  menu.add("查看闪照").onMenuItemClick=function(a)
    查看闪照()
  end
end
]]




wg.onItemClick=function(l,v,p,id)
  图片路径内容=字符串切割(图片路径,"\n")
  路径=图片路径内容[id]
  提示={
    LinearLayout;
    orientation="vertical";
    layout_width="fill";
    layout_height="fill";
    gravity="center";
    {
      ImageView;
      layout_width="110dp";
      -- src=路径;
      id="显示图片";
      scaleType="fitXY";
      layout_height="110dp";
    };
  };
  local dl=AlertDialog.Builder(activity)
  .setView(loadlayout(提示))
  .setMessage("是否保存该图片")
  .setPositiveButton("确定",function()
    os.execute("mv "..路径.." "..路径..".jpg")
    os.execute("mv "..路径..".jpg /storage/emulated/0/DCIM/Camera/")
    print("已经保存到:/storage/emulated/0/DCIM/Camera/")
  end)
  .setNegativeButton("取消",nil)
  dialog=dl.show()
end



AlertDialog.Builder(this)
.setTitle("关于")
.setMessage("本附件是云天从网上白嫖的，云天进行小部分优化🌝")
.setPositiveButton("好的",{onClick=function(v) print"点击了积极按钮"end})
.show()



查看闪照()









