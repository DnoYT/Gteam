require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

import "android.graphics.SweepGradient"
import "com.androlua.LuaDrawable"
import "android.graphics.RectF"
import "android.graphics.DashPathEffect"
import "android.graphics.Color"
import "android.graphics.Path"
import "android.graphics.BitmapFactory"
import "com.android.qrcode.*"
import "android.content.Intent"
import "layout"
activity.setTitle('logo二维码制作')
activity.setTheme(android.R.style.Theme_Holo_Light)
activity.setContentView(loadlayout(layout))

function ChooseFile(type,Callback)
  intent = Intent(Intent.ACTION_GET_CONTENT)
  intent.setType(type);
  intent.addCategory(Intent.CATEGORY_OPENABLE)
  activity.startActivityForResult(intent,1);
  function onActivityResult(requestCode,resultCode,data)
    if resultCode == Activity.RESULT_OK then
      local uri = data.getData()
      import "com.library.Module"--导入模块
      Callback(Module.UriToFilePath(this,uri))
    end
  end
end



a1_1,a1_2,v5="带图标","不带图标",true
--状态

tittle={"说明","选择类型→",a1_1,a1_2}
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
  if tostring(tittle) == a1_1 then
    v5=true
    logo.setVisibility(View.VISIBLE)
   elseif tostring(tittle) == a1_2 then
    logo.setVisibility(View.INVISIBLE)
    v5=false
   elseif tostring(tittle) == "说明" then
    AlertDialog.Builder(this)
    .setTitle("说明")
    .setMessage("  图片尽量使用半透明图片\n   生成出来的时候记得自己试一下\n  有时候无法扫描！\n   字数尽量大于10个，否则有可能扫描不出来\n\n感谢使用")
    .setPositiveButton("朕知道了",{onClick=function(v) end})
    .show()
  end
end

logoxz.onClick=function()
  ChooseFile("image/*",function(path)--所有类型文件
    path1=path:match("/([^/]+)$")
    logoml.text=path1
    logotb.setImageBitmap(loadbitmap(path))
    v3=path
  end)
end



but.onClick=function()
  local v1 = edit.Text
  if v1~="" then
    local v3=v3
    local v2=1000
    local v4=0xff00a2ff
    activity.newActivity("main1",{v1,v2,v3,v4,v5})
   else
    print("请输入二维码内容")
  end
  --[[
    Bit = BitmapFactory.decodeFile("/storage/emulated/0/AndroLua/project/GTpor多功能/icon.png")
    local t = edit.Text
    if t ~= "" then
      i = 二维码类.带图标二维码(t,400,Bit,0xff00a2ff)
      activity.newActivity("main1",{i})
      --img.setImageBitmap(i)
     else
      print("请输入二维码内容")
    end]]
end



