require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
--import "android.os.Environment"
本地目录=Environment.getExternalStorageDirectory().toString()
import "cache"
import "File1"
import "layout"
import "Xv7"
--加载布局
activity.setContentView(loadlayout(layout))
--关闭输入法弹出
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);
items={
  TextView,
  layout_width="fill",
  --layout_height="30dp",
  Gravity="center|left",
  paddingLeft="40",
  textColor="#808080",
  textSize="15",
  id="name"
}

--activity.setContentView(loadlayout(layout))

--去滑条
--list.setVerticalScrollBarEnabled(false)

rji=0
maxText={}
数据={}
function rj(maxtext)
  rji=rji+1
  maxText[rji]=maxtext
  table.insert(数据,{name=maxText[rji]})
  --[[for i=1,#maxText do
    table.insert(数据,{name=maxText[i]})
  end]]
  adp=LuaAdapter(activity,数据,items)
  list.setAdapter(adp)
  --[[取消点击
  list.setOnItemClickListener(AdapterView.OnItemClickListener{
    onItemClick=function(parent,v,pos,id)
      print(id)
      activity.result{maxText[pos+1]}
      activity.finish()
    end
  })]]
end




lx={"xv7file"}
lxx={"加密文件"}
for i=1,#lx do
  lxl=基础:match(lx[i].."%((.-)%)"..lx[i])
  if lxl~=nil then
    load(string.format("%s",lx[i])..".Text='"..string.format("%s",lxl).."'")()
    rj("感谢 GT释怀提供防logsh5.22")
    rj("感谢 GT云天开发 项目布局程序化设计")
    rj("感谢 GT辛心开发源码")
    rj("感谢 GTSam提供编译支持")
    rj("当前是慢速加载版，加载速度很慢，后期会开发快速版")
    rj("继承"..lxx[i].."："..lxl)
    --f_1.text
    f_1_b=lxl:match("/([^/]+)$")
    if f_1_b~=nil then
      f_1.text=string.format("%s_GTX-v7.lua",f_1_b)
    end
  end
end

--home.setImageBitmap(loadbitmap"return.png")
--标题.text="GTs5"
--标题.background="#ff00BCD5";
home.onClick=function()
  --activity.moveTaskToBack(true)
  --关闭
  activity.finish()
end
--选择文件
--file2.onClick=function()
-- [[
file2.onClick=function()
  Startfile=xv7file.getText().toString()
  ChoiceFile(Startfile,function(file)
    xv7file.Text=file
    缓存("xv7file%((.-)%)xv7file",file)
    rj("选择加密文件："..file)
    f_1_b=file:match("/([^/]+)$")
    if f_1_b~=nil then
      f_1.text=string.format("%s_GTX-v7.lua",f_1_b)
    end
  end)
end






function ks()
  file=xv7file.getText().toString()
  XX={file,
    f_1.text,
    f_b_z,
    m_2.text,
    m_b_z,
    m_1.text,
    true}
  tg=true
  if XX[3] then
    if #XX[2] < 2 then
      rj("文件名不能小于 2个字节")
      tg=false
     else
      tg=true
    end
  end
  if XX[5] then
    if #XX[4] < 2 then
      rj("密码不能小于2字节")
      tg=false
     elseif #XX[6] < 2 then
      tg=false
      rj("密码提示不能小于2字节")
    end
  end
  if tg then
    XXv7(XX)
  end
end

--运行加密

rungts1.onClick=function()
  ks()
end
--监听 m_b 的布尔值
m_b.setOnCheckedChangeListener{
  onCheckedChanged=function(g,c)
    --l=g.findViewById(c)
    m_b_z=c
  end}

--监听 m_b 的布尔值
f_b.setOnCheckedChangeListener{
  onCheckedChanged=function(g,c)
    --l=g.findViewById(c)
    f_b_z=c
  end}

--图片的

--隐藏状态栏
--activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
--导航栏
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)



--id.setImageBitmap(loadbitmap(图片路径))


qq_ml.onClick=function()
  xv7file.text="/storage/emulated/0/tencent/QQfile_recv/"
end

gen_ml.onClick=function()
  xv7file.text=本地目录
end


import "android.content.Intent"
import "android.net.Uri"
gg74.onClick=function() --加载网站

  url="https://www.lanzous.com/tp/i3wq0cd"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end

help.onClick=function()
  url="http://gts.gt-eam.cn/GTXhelp.html"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end