require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
--import "Dialog"
import "m3file"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
m38="/storage/emulated/0/GTSkey/m3u8"
file=io.open(m38,"r")
if file~=nil then
  data2 = file:read('*a')
  file:close()
  if #data2>10 then
    load(data2)()
   else
    data2=nil
  end
end
if data2==nil then
  data2={}
  data2[3]=Environment.getExternalStorageDirectory().toString()
  data2[1]=data2[3]
  data2[2]=data2[3]
end
activity.setContentView(loadlayout(layout))
m3r.text=data2[1]

import "item"
function 画表(data,m3f1)
  --为Adapter适配器载入Table数据
  adp=LuaAdapter(activity,data,item)
  list.setAdapter(adp)
  --  for n=1,#nuss do
  --插曲Table数据
  --table.insert(data,{tex={Text=tostring(nuss[n])},icd={Checked=true},})
  --end
  --print(dump(data))
  list.onItemClick=function(v,o,i,d)
    --解析Table数据并判断
    if data[d].icd["Checked"] then
      --对指定数据进行更改
      data[d].icd={Checked=false}
     else
      data[d].icd={Checked=true}
    end
    --修改数据需要更新列表不更新也可以用获取Tag标签的方法更新状态
    adp.notifyDataSetChanged()
  end
  i4(i2,true)
  --全选
  c1.onClick=function()
    for n=1,#data do
      data[n].icd["Checked"]=true
    end
    adp.notifyDataSetChanged()
  end
  --反选
  c2.onClick=function()
    for n=1,#data do
      if data[n].icd["Checked"] then
        data[n].icd["Checked"]=false
       else
        data[n].icd["Checked"]=true
      end
    end
    adp.notifyDataSetChanged()
  end
  --取消全部
  c3.onClick=function()
    for n=1,#data do
      data[n].icd["Checked"]=false
    end
    adp.notifyDataSetChanged()
  end

  jzz=0
  function 加载框(j1,j2)
    import "android.content.DialogInterface"
    jzz=jzz+1
    if jzz==1 then
      dialog4 = ProgressDialog.show(this,"输出中", "正在登陆中",false, true, DialogInterface.OnCancelListener{
        onCancel=function()
          t3=false
          print("取消输出")
          os.remove(m3f2)
        end})
     else
      dialog4.setTitle(string.format("%0.2f/100",j2/#data*100))
      dialog4.setMessage(string.format("输出 %s 成功",j1))
    end
    if jzz==#data then
      dialog4.dismiss()
      import "android.text.format.Formatter"
      print("输出成功，目录在："..m3f2)
    end
  end

  --打印全部数据
  dt.onClick=function()
    import "java.io.File"--导入File类
    路径="/storage/emulated/0/GTSkey/mp4"
    if not File(路径).isDirectory() then
      os.execute("mkdir "..路径)
    end
    t3=true
    m3f2=string.format("%s%s",路径,m3f1:match("/[^/]+$"))
    m3f2=m3f2:gsub("%..+$",".mp4")
    thread(function(t3,输出目录,data)
      require "import"
      import "android.app.*"
      失败={}
      v1=0
      v3=0
      f7=io.open(输出目录,"w")
      call("加载框")
      for n=1,#data do
        Thread.sleep(35)
        if t3 then
          t3=activity.get("t3")
        end
        if t3==false then
          break
        end
        if data[n].icd["Checked"] then
          f8=io.open(data[n].tex["Text"],"r")
          if f8==nil then
            v1=v1+1
            失败[v1]=data[n].tex["Text"]
           else
            v2= f8:read('*a')
            f8:close()
            f7:write(v2)
            call("加载框",data[n].tex["Text"],n)
            -- dialog4.setMessage(string.format("输出 %s %0.2f/100",data[n].tex["Text"],n/#data*100))
            -- print(n,data[n].tex["Text"])
          end
        end
      end
    end,t3,m3f2,data)
  end
end



function i4(i2,i5)
  if i5 then i3="VISIBLE"
   else
    i3="INVISIBLE"
  end
  for i1=1,#i2 do
    load(string.format("%s.setVisibility(View.%s)",i2[i1],i3))()
  end
end
i2={"c1","c2","c3","dt"}
i7={"全选","反选","取消","输出","内部储存","帮助"}
i4(i2,false)
i2[5]="gen"
i2[6]="help"
for y,t in ipairs(i2) do
  load(string.format("%s.onLongClick=function()print\'%s\' return true end",t,i7[y]))()
end


function 提示1(m3i)
  if m3i==0 then
    m3jz.text="请选择m3u8或者load文件"
   else
    m3jz.text=string.format("加载了%s个ts文件",m3i)
  end
end
--读取解析
function jx(m3f1)
  file=io.open(m3f1,"r")
  data1 = file:read('*a')
  file:close()
  thread(function(data1,m3f1)
    require "import"
    import "android.app.*"
    import "android.os.*"
    m3i=0
    nuss={}
    import "java.io.File"--导入File类
    if data1:find("/.-/.-")==nil then
      --不带目录输出
      m3f3=m3f1:gsub("/[^/]+$","")
      for w in string.gmatch(data1,"[^\n ]-%.ts") do
        if File(string.format("%s/%s",m3f3,w)).isFile() then
          m3i=m3i+1
          nuss[m3i]=string.format("%s/%s",m3f3,w)
          call("提示1",m3i)
        end
      end
     else
      --带目录的输出
      for w in string.gmatch(data1,"file.-%.ts") do
        w=w:match("(/s.*)")
        if File(w).isFile() then
          m3i=m3i+1
          call("提示1",m3i)
          nuss[m3i]=string.format("%s",w)
        end
      end
    end
    if #nuss<=1 then call("提示1",0) end
    import "item"
    data={}
    for n=1,#nuss do
      --插曲Table数据
      table.insert(data,{tex={Text=tostring(nuss[n])},icd={Checked=true},})
    end
    call("画表",data,m3f1)
    --print(dump(data))
  end,data1,m3f1)
end

--选择文件m3u8
m3f1.onClick=function()
  data2[1]=m3r.text
  --对话框(data)
  ChoiceFile(data2[1],function(m3f1)
    m3r.text=m3f1
    data2[1]=m3f1
    dasc=string.format("data2={%q,%q}",data2[1],data2[2])
    file=io.open(m38,"w")
    file:write(dasc)
    file:close()
    jx(m3f1)
  end)
end

help.onClick=function()
  activity.newActivity("help")
  end
home.onClick=function()
  activity.finish()
  end
gen.onClick=function()
m3r.text=Environment.getExternalStorageDirectory().toString()
end