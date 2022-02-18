require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
--[[
参数=0 
function onKeyDown(code,event) 
if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
 if 参数+2 > tonumber(os.time()) then
 activity.finish() 
else
 Toast.makeText(activity,"再按一次返回键退出" , Toast.LENGTH_SHORT ) .show() 
参数=tonumber(os.time()) 
end 
return true 
end 
end ]]


import "layout"
import "update"
activity.setContentView(loadlayout("layout"))
import "main2"


