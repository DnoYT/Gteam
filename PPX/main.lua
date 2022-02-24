

require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "mods.JingCai"


--activity.setTheme(R.AndLua1)
activity.setTitle("我在人间凑数的日子")
activity.setContentView(loadlayout(layout))


function main(Yurl,Ykey)
  _G["Yurl"]=Yurl
  _G["Ykey"]=Ykey
  import "cj"

  table_L = getl()
  local sj=math.random(0,table_L)

  local txtcode = getld(sj)
  print(txtcode)
  load(txtcode)()

  if l>=1 then
    启动图.text=list[1]["text"] .. "\n\n"..list[1]["title"]
   else
    启动图.text="没有启动图 \n\n《我在人间凑数的日子》"
  end


  沉浸二(0x00000000)
  task(2000,function()
    task(50,function()
      activity.finish()
    end)
    activity.newActivity("main2",{_G["Yurl"],_G["Ykey"]})
  end)

end