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
  --print(code)
  return code
end