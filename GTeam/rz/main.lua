require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "mods.JingCai"
import "cj"

--activity.setTheme(R.AndLua1)
activity.setTitle("我在人间凑数的日子")
activity.setContentView(loadlayout(layout))

thread(下载)

v1=io.readall(activity.getLuaDir("data.txt"))
--print(v1)
--沉浸二(0x00000000)
--[[task(2000,function()
  task(50,function()
    activity.finish()
  end)
  activity.newActivity("main2")
end)]]

data={}
for w in string.gmatch(v1, "[^\n]+") do
  -- print(w)    --连续输出每个单词
  table.insert(data,w)
end

--print(dump(data))
--启动图.text="没有启动图--《我在人间凑数的日子》"



if #data>2 then
  sj=math.random(1,#data)
  启动图.text=data[sj]
 else

  启动图.text="没有启动图 \n\n《我在人间凑数的日子》"
end


沉浸二(0x00000000)
task(2000,function()
  task(50,function()
    activity.finish()
  end)
  activity.newActivity("main2")
end)

