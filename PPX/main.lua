require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "cj"


--activity.setTheme(R.AndLua1)
activity.setTitle("我在人间凑数的日子")
--activity.setContentView(loadlayout(layout))

table_L = getl()
local sj=math.random(0,table_L)

local txtcode = getld(2)

load(txtcode)()
print(list[1]["text"],l)
