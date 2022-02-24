function xdc(url,path)
  require "import"
  import "java.net.URL"
  local ur =URL(url)
  import "java.io.File"
  file =File(path);
  local con = ur.openConnection();
  local co = con.getContentLength();
  local is = con.getInputStream();
  local bs = byte[1024]
  local len,read=0,0
  import "java.io.FileOutputStream"
  local wj= FileOutputStream(path);
  len = is.read(bs)
  while len~=-1 do
    wj.write(bs, 0, len);
    read=read+len
    pcall(call,"ding",read,co)
    len = is.read(bs)
  end
  wj.close();
  is.close();
  pcall(call,"dstop",co)
end
function dumpxz(url,path)
  thread(xdc,url,path)
end
function GT_dump(string1,lj)
  import "android.app.ProgressDialog"
  --assert(loadfile(lj),"文件验证失败!")
  -- string1=io.open(lj):read("*a")
  local function urlEncode(s)
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
  end
  function Encryption(Text)
    return Text:gsub(".", function(jia)
      return string.format("%02X", (string.byte(jia)) % 256)
    end):gsub(" ", "+")
  end
  call("rj1","开始转16进制编码")
  string1=Encryption(string1)
  call("rj1","转16进制编码成功")
  call("rj1",'正在编译请稍等…')
  local url="https://lua.samtool.ml/dump/index.php"
  local data="data="..tostring(urlEncode(string1)).."&base16"
  Http.post(url,data,nil,"UTF-8",nil,function(a,b,c,d)
    if a==200 and b:find("dump失败")==nil then
      dumpxz(b,lj)
      print("编译成功\n输出目录在"..lj)
      call("rj1","编译成功\n输出目录在"..lj)
      call("rj2")
     else
      print("编译失败  请查看网络是否正常连接 或者 行术太多请压缩行数")
      call("rj1","编译失败  请查看网络是否正常连接 或者 行术太多请压缩行数")
      call("rj2")
    end
  end)
end

