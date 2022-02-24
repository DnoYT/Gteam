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

sj=math.random(1,1)
txt = getl()
print(txt)