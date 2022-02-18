require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.os.Environment"
本地目录=Environment.getExternalStorageDirectory().toString()
--file1.text=
import "GTS5.cache"
import "GTS5.File1"
import "GTS5.layout"
import "android.graphics.drawable.Drawable"
--加载布局
activity.setContentView(loadlayout(layout))
--关闭输入法弹出
activity.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_PAN);

items={
  TextView,
  layout_width="fill",
  Gravity="center|left",
  paddingLeft="40",
  textColor="#030303",
  textSize="15",
  id="name"
}

--activity.setContentView(loadlayout(layout))

--去滑条
--list.setVerticalScrollBarEnabled(false)

--maxText={"自动检测","中文","英文","日文","韩文","法文","俄文","西班牙文","1","2","3","4"}
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




lx={"file1"}
lxx={"加密文件","输出目录"}
for i=1,#lx do
  lxl=基础:match(lx[i].."%((.-)%)"..lx[i])
  if lxl~=nil then
    load(string.format("%s",lx[i])..".Text='"..string.format("%s",lxl).."'")()
    rj("感谢GT云天开发")
    rj("感谢GT释怀提供sh5.22")
    rj("感谢GTX-Star替换混淆内核")
    rj("感谢Sam提供编译")
    rj("继承"..lxx[i].."："..lxl)
  end
end

--home.setImageBitmap(loadbitmap"return.png")
--标题.text="GTs5"
--标题.background="#ff00BCD5";
home.onClick=function()
  --activity.moveTaskToBack(true)
  --返回桌面
  activity.finish()
end
--选择文件
--file2.onClick=function()
-- [[
file2.onClick=function()
  Startfile=file1.getText().toString()
  ChoiceFile(Startfile,function(file)
    file1.Text=file
    缓存("file1%((.-)%)file1",file)
    rj("选择加密文件："..file)
  end)
end

yx=0
function lx1(yx1)
  yx=yx+1
  if yx==1 then
    yx1=tostring(yx1)
    for z,x in ipairs(lx) do
      load(x..".Checked=false "..x.."c=false")()
    end
    load(yx1..".Checked=true "..yx1.."c=true")()
    sh5.Checked=false
    if gts53.Checked then
      sh5.Checked=true
    end
    if gts53.Checked then 
      rj(yx1.." 可以正常使用！")
     elseif gts52.Checked then
     rj(yx1.." 可以加密,但是已经停止维护！")
     else
      rj(yx1.." 加密还不能使用")
    end
    task(1,function() yx=0 end)
  end
end

--加密类型
lx={"gts53","gts52","gtxv7"}
for z,x in ipairs(lx) do
  load(x..[[.setOnCheckedChangeListener{
  onCheckedChanged=function(g,c)
    lx1(']]..x..[[')
  end}]])()
end


sh5j=0
sh5.setOnCheckedChangeListener{
  onCheckedChanged=function(g,c)
    if gts53.Checked then
      sh4=c
      sh5.Checked=true
      sh5j=sh5j+1
      if sh5j==1 then
        rj("为了保证作者的安全，我们的sh 5.2.2限制了修改器的版本,只能使用官方73.4版本的GG可以运行，在上方有我们为你们准备的下载链接")
      end
     else
      rj("该加密暂时不支导入 sh 5.2.2")
      sh5.Checked=false
    end
  end}

luar.setOnCheckedChangeListener{
  onCheckedChanged=function(g,c)
    luar.Checked=true
    AlertDialog.Builder(this)
    .setTitle("导出GGluaR 编译模板？")
    .setMessage("\n\t\t\t软件暂时不支持编译GGlua脚本\n\n\t你是否导出GGlua编译脚本？")
    .setPositiveButton("是",{onClick=function(v)
        local ggluar=[=[
--由GTeam 提供注释,技术 等技术支持
--本源码 GTeam 原创
--重视版权从我做起 © GTeam_by云天
gt=gg.prompt({"GTeam提供技术支持 选择文件:"},
{gg.getFile()},
{"file"})
if gt~=nil then
  gtload=loadfile(gt[1])
  if gtload~=nil then
    file=io.open(gt[1].."-gtr.lua","w")
    file:write(string.dump(gtload,gg.alert("文件是否可调试？","是","否")==2))
   else
    gg.toast("文件加载错误")
  end
 else
  gg.toast("没有选择")
end
  ]=]
        file=io.open(file1.text:gsub("/[^/]+$","").."/gtluaR.lua","w")
        file:write(ggluar)
        file:close()
        print("导出文件在 "..file1.text:gsub("/[^/]+$","").."/gtluaR.lua")
      end})
    .setNegativeButton("否",nil)
    .show()
  end}


--运行加密
rungts.onClick=function()
  file=file1.text
  path=file
  --print(file,path)
  if gts52c then
    import "GTS5.gts52"
    print("开始加密")
    task(800,function()
      import "GTS5.Progress"
      dldown=AlertDialog.Builder(activity)
      .setView(loadlayout(Progress))
      .show()
      .setCancelable(false)
      取消.onClick=function()
        dldown.dismiss()
      end

      task(800,function()
        gts5(file,path)
      end)
    end)
  elseif gts53c then
    import "GTS5.gts53"
    path=file.."-gts5.lua"
    import "GTS5.sh522"
    if not sh4 then sh522=""end
    gts53(file,"gg",path,sh522)
    else
    rj("请选择加密模式")
  end
end



--图片的

--隐藏状态栏
--activity.getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
--导航栏
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_NAVIGATION)
--id.setImageBitmap(loadbitmap(图片路径))
qq_ml.onClick=function()
  file1.text="/storage/emulated/0/tencent/QQfile_recv/"
end

gen_ml.onClick=function()
  file1.text="/storage/emulated/0/"
end

gg734.onClick=function()
  import "android.content.Intent"
  import "android.net.Uri"--加载网站
  url="http://734gg.oss-cn-beijing.aliyuncs.com/%E4%BF%AE%E6%94%B9%E5%99%A8%2873.4%29.apk"
  viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
  activity.startActivity(viewIntent)
end