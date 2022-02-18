wjdz=gg.getFile():gsub('/[^/]+$', '')
gg.toast("GT云天开源\nGT团队提供技术支持")
hj=gg.alert("请选择类型","缓存图片","下载器")
if hj==1 then goto a2 end
if hj==nil then os.exit()  end
c=gg.prompt({"网址","缓存地址","文件名字"},{"www.baidu.com",wjdz,"01"},{"text","path","text"})
if c== nil then os.exit()  end
if string.find(c[1], "http") == nil  then
df=gg.choice({"http://","https://"},nil,"选择类型")
if df==2 then hzt="https://" else hzt="http://" end
else
hzt=""
end
lx={".mp4",".mp3",".png",".jpg",".html",".htm",".php",".lua",".txt"}
lxx=gg.choice(lx,nil,"类型选择")
if lxx==nil then lxxx="" else
lxxx=lx[lxx]
end
hzt=hzt..c[1]
nr=gg.makeRequest(hzt).content

if nr==nil then gg.toast("内容读取失败") 
yul=gg.alert("地址\n"..hzt,"复制")
if yul ~= nil then gg.copyText(hzt)  
os.exit()  end end
gg.toast("内容读取成功")

file=io.open(c[2].."/"..c[3]..lxxx,"w")
file:write(nr)
file:close()

os.exit() 
::a2::
file1=io.open(wjdz.."/wj.lua","r")
if file1~=nil then data = file1:read('*a')  file1:close() pcall(load(data)) else 
wz="www.baidu.com" 
 bc=wjdz
ye="20"
jl="1"
hz=".jpg"
sh="jpg"
 end
c=0
a=gg.prompt({"输入网址","输入页数","第几页开始","保存地址","文件后蜇","输出后堑"},{wz,ye,jl,bc,hz,sh},{"text","txt","txt","path","text","text"})
j0=false
if a==nil then os.exit()  end
::cll::
if c==1 then gg.toast("转第一源运行中") end
if c==2 then gg.toast("转第二源运行中") end
for i=a[3],a[2] do
if i<10 and jo then i="0"..i end
cl=gg.makeRequest(a[1]..i..a[5]).content
if cl==nil then print("网络错误") os.exit()  end
if #cl<2048 then
if c~=2 then
if jo then jo=false c=c+1 cl=true yk=i break else jo=true c=c+1 cl=true yk=i break end
  else 
 c=0 end
else
c=0
end

file=io.open(a[4].."/"..i.."."..a[6],"w")
file:write(cl)
file:close()
if #cl<2048 then
gg.toast("第"..i.."张图片缓存失败")
print("第"..i.."张图片缓存失败")
os.remove(a[4].."/"..i.."."..a[6])
else
gg.toast("第"..i.."张图片加载100%")
print("第"..i.."张图片加载100%")
end
if i==a[2] then o="1"  else o=i end
file2=io.open(wjdz.."/wj.lua","w")
sc="\nwz='"..a[1].."'\nye='"..a[2].."'\nbc='"..a[4].."'\njl='"..o.."'\nhz='"..a[5].."'\nsh='"..a[6].."'"
file2:write(sc)
file2:close()
cl=false
end

if cl then   a[3]=yk   goto cll end