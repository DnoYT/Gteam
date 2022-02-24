
require "import"
import "http"

url = "http://gts.gt-eam.cn/ppx/yppx.php"
function gettext(start,num)
    
end

function getl()
    code = http.post(url,"type=getl")
    print(code)
end