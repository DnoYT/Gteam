require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "AndLua"

activity.setTheme(R.AndLua1)
activity.setTitle("我在人间凑数的日子")
yun={}
tittle={"加群"}
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
  if yun[tittle.getTitle()] then
    yun[tittle.getTitle()]()
  end
end
yun.加群=function()
  加群("616908783")
end


本版本="1.1"


gyb={
  LinearLayout;
  layout_width="fill";
  layout_height="fill";
  {
    TextView;
    layout_width="match_parent";
    layout_height="match_parent";
    gravity="center";
    text="";
    id="yu2"
  };
};


txt=[[
嗨！大家好
我是作者 段~云天
没办法这个是我的地方我想怎么打字就怎么打
你来打我啊！
哈哈！不皮了

这个页面 没错 你没有看错这个就是关于页面
好吧 我承认我偷懒了

作者：段家云天
ui：上面 +1
其他全部看上面那个帅逼就行

你们如果有好的想法 或者想和我一起编剧
这个软件可以加一下我们的讨论群：616908783

现在版本:本版本
最新版本:1.0
]]

import "http"
url="http://gts.gt-eam.cn/ppx"
v2=http.get(url.."/gy.txt")

if #v2>30 then
  txt=v2
end

txt=txt:gsub("本版本",本版本)

activity.setContentView(loadlayout(gyb))
yu2.text=txt;