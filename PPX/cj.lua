require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "http"

url = "http://gts.gt-eam.cn/ppx/yppx.php"

function getl()
  code = http.post(url,"type=getl")
  if #code<=0 then
      code = -1
  end
  --print(code)
  return code+0
end

--获取数据
function getln(s, l)
    code = http.post(url,"type=getln&start=" .. s .. "&limit=".. s+l);
    print(code)
end

function getld(s)
    code = http.post(url,"type=getld&start=" .. s);
    print(code)
end