
function rj1(t1)
  da2(t1)
end
function rj2()
  dag()
end
function bylua(xx3)
  SXX2="local XX={XXjh}\nlocal XX = {} for i, v in pairs(XX) do XX[i] = v end XX.io = {} XX.gg = {} XX.string = {} for i, v in pairs(io) do XX.io[i] = v end for i, v in pairs(string) do XX.string[i] = v end for i, v in pairs(gg) do XX.gg[i] = v end local XXZ = {} XXZ.info = {}	for i, v in ipairs(XXZ.info) do XXZ[XXZ.setsList[i]] = v end g={} for index,value in pairs(g) do return value end "
  g={}
  -- g.last=gg.getFile()
  file = io.open(xx3,"r")
  assert(file)
  data= file:read("*a")
  file:close()
  os.remove(xx3)
  XX=''
  --math.randomseed(os.clock()*10000)
  for i=1,8 do
    XX=XX..math.random(0,255)..','
  end
  wzdm=string.gsub(SXX2,'XXjh',XX)

  test="local xx7_0='GTeam提供技术支持' local XXXX666=function() local XXXX666=0 \n"..wzdm..data.."\nend XXXX666()"
  import "com.luxts.network.Networks"
  if(Networks.isVpnUsed()) then
    dialog5.show().hide()
    AlertDialog.Builder(this)
    .setTitle("请关闭VPN")
    .setMessage("   本加密因为包涵源码，所以禁止使用VPN！\n如果你需要使用网络编译，也可以找我们合作！\n我们的联系方式在'关于我们'哪里有！\n\n   If you are a friend abroad, hello!\nThe use of this software requires a connection to the network, so the use of VPN is prohibited,It is possible that you need a VPN to connect to our Chinese server!\n\nIf you really like our products, you can contact us and find us to customize your foreign products!\n\n\t\tIf you want to contact us, you can check out about us!")
    .setPositiveButton("确定",nil)
    .show()
   else
    thread(function(test,v6)
      require "import"
      import "by"
      GT_dump(test,v6)
    end,test,xx3)
  end
end

function dag()
  dialog5.show().hide()
end
function da1(tz)
  rj(tz)
  dialog5.setTitle(tz)--设置消息
end
function da2(tz1)
  dialog5.setMessage(tz1)--设置消息
end
function dia()
  import "android.app.ProgressDialog"
  dialog5= ProgressDialog(this)
  dialog5.setProgressStyle(ProgressDialog.STYLE_SPINNER)
  dialog5.setTitle("Loading...")
  --设置进度条的形式为圆形转动的进度条
  dialog5.setMessage("ProgressDialog")
  dialog5.setCancelable(true)--设置是否可以通过点击Back键取消
  dialog5.setCanceledOnTouchOutside(false)--设置在点击Dialog外是否取消Dialog进度条
  dialog5.setOnCancelListener{
    onCancel=function(l)
      print("取消Dialog5")
    end}
  --取消对话框监听事件
  dialog5.show()
end

function gts53(s1,s2,s3,sh522)
  import "GTS5.mi64"
  if s1==nil then
    rj("文件名不能为空")
   elseif io.open(s1,"r")~=nil then
    i1=io.lines(s1)
    dia()
    i1=io.readall(s1)
    if #sh522>10 then
      i1=sh522..i1.." end H_6() "
      da1("导入 sh5.2.2成功")
    end
    da1("开始整理代码中……")

    file9=io.open(s3,"w")
    file9:write(i1)
    file9:close()

    thread(function(s3)
      require "import"
      import "GTS5.mi64"
      file9=io.open(s3,"r")
      i1 = file9:read('*a')
      file9:close()
      v2=""
      si={"gg","os","string","io"}
      for v3,s2 in ipairs(si) do
        v1=mi64()
        v2=v2..v1.."="..s2.." "
        i1=i1:gsub(s2.."%.(.-[^a-zA-z_0-9])",function(g1)
          g1=v1.."['"..g1.."]"
          g1=g1:gsub("(.)%]",function(g3)
            return "']"..g3 end)
          return g1
        end)
        call("da1","混淆"..s2.."库成功!")
      end

      code=v2..i1
      code=code:gsub("%-%-%[%[.-%]%]","")
      code=code:gsub("%-%-[^\n]+","")--去除注释
      call("da1","去除注释成功 开始混淆常量！")
      --[[for s7 in string.gmatch(code, "function -(%w-)%(") do
          s8=mi64()
          code=code:gsub(s7.."%(",s8.."(")
        end]]

      for s7 in string.gmatch(code, "function ([A-Za-z0-9]+)%(%)") do
        s8=mi64()
        call("da1","混淆方法名"..s7)
        code=code:gsub(s7.."%(",s8.."(")
      end --混淆function方法名
      code=code:gsub("( [A-Za-z_][%w]- ) -= -",function(s8) return " "..s8.." ="end)

      for s7 in string.gmatch(code, "([A-Za-z_][%w]- -)=[^=]") do
        if string.find(s7,"local")~=nil then
          s8=mi64()
          code=code:gsub(s7,s8)
        end
      end
      for s7 in string.gmatch(code, "([A-Za-z_][%w]-)=[^=]") do
        if string.find(s7,"local")~=nil then
          s8=mi64()
          code=code:gsub(s7,s8)
        end
      end
      call("da1","混淆常量成功 开始第一步")
      xxh=[["]]
      xxhh=[[']]
      function X(code)res=''
        for i in ipairs(code)do
          res=res..string.char(code[i])
        end
        return res
      end
      code=string.gsub(code,X({92,110}),"\n")
      code=string.gsub(code,X({92,114}),"\r")
      code=string.gsub(code,X({92,116}),"\t")
      p = xxh .. "(.-)" .. xxh
      s5=""
      for i in code:gmatch(p) do
        call("da2","整理 "..i.."中")
        s4=mi64()
        mf ="function "..s4.."(code)res=''for i in ipairs(code)do res=res..string.char(code[i])end return res end "
        s5=s5..mf
        i = s4.."({" .. table.concat({i:byte(0, -1)}, ",") .. "})"
        n = n and n + 1 or 1
        code = code:gsub(p, i, 1)
      end
      call("da1","整理第二步")
      if n then
        io.open(s3, "w"):write(( s5 or "") .. code):close()
        p = xxhh .. "(.-)" .. xxhh
        for i in code:gmatch(p) do
          call("da2","整理 "..i.."中")
          s4=mi64()
          mf ="function "..s4.."(code)res=''for i in ipairs(code)do res=res..string.char(code[i])end return res end "
          s5=s5..mf
          i = s4.."({" .. table.concat({i:byte(0, -1)}, ",") .. "})"
          n = n and n + 1 or 1
          code = code:gsub(p, i, 1)
        end
        call("da1","第二步成功")
        data=(s5 or "") .." "..code.." "..(s5 or "")
        data=data:gsub("%)[ \n]-([a-zA-Z])",function(s10)
          if string.find(s10,"local")~=nil then
            s10=")local"
           else
            s10= ")"..s10
          end
          return s10
        end)
        call("da1","第三步 开始")
        datai=""
        file9=io.open(s3,"w")
        file9:write(data)
        file9:close()
        f2=io.open(s3,"w")
        while #datai<500000 do
          call("da2","加载"..string.format("%0.2f",(#datai/1000000)*100).."%")
          da3=mi64()
          da4=math.random(32,64)
          da5=""
          for ki=1,da4 do
            da5=da5..string.format("%q,",math.random(1,255))
          end
          Thread.sleep(1)
          da5=string.format("%s={%s}",da3,da5)
          datai=datai..da5
          f2:write(da5)
        end

        while string.find(data,"\n")~=nil do
          data=data:gsub("\n"," ")
        end
        while string.find(data,"\r")~=nil do
          data=data:gsub("\r"," ")
        end
        while string.find(data,"  ")~=nil do
          data=data:gsub("  "," ")
        end



        f2:write(data.." ")
        datai=""
        while #datai<500000 do
          call("da2","加载"..string.format("%0.2f",(#datai/1000000)*100+50).."%")
          da3=mi64()
          da4=math.random(32,64)
          da5=""
          for ki=1,da4 do
            da5=da5..string.format("%q,",math.random(1,255))
          end
          Thread.sleep(1)
          da5=string.format("%s={%s}",da3,da5)
          datai=datai..da5
          f2:write(da5)
        end
        f2:close()--]]
        Thread.sleep(100)
        file=io.open(s3,"r+")
        data = file:read('*a')
        file:close()
        v4=load(data)
        if v4 then
          print("验证成功 001")
          call("rj","验证成功 001")
         -- call("bylua",s3)
         
         else
          print("开始修补")
          data=data:gsub("}[^}]-$","}")
          file=io.open(s3,"w")
          file:write(data)
          file:close()
          v4=load(data)
          if v4 then
            print("验证成功 002")
            call("rj","验证成功 002")
           -- call("bylua",s3)
           
         
           else
            print('验证失败 加密失败 003')
            call('rj','验证失败 加密失败 003')
            call("dag")
          end
        end
        -- call("dag")
       else
        call("rj","加密失败!")
        os.remove(s3)
        call("dag")
      end
    end,s3)
  end
end