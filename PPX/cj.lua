require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "http"

local url = "http://gts.gt-eam.cn/ppx/yppx.php"

function getl()
 local code = http.post(url,"type=getl")
  if #code<=0 then
    code = -1
  end
  --print(code)
  return code+0
end

--获取数据
function getln(s, l)
   local code = http.post(url,"type=getln&start=" .. s .. "&limit=".. s+l);
    print(code)
end

function getld(s)
  local  code = http.post(url,"type=getld&start=" .. s);
    if #code<0 then
        code = "list,l={},-1"
      end
    print(code)
end