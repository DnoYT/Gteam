import "android.content.Intent"
import "android.net.Uri"
function 开始安装(ml,data,大小)
  import "java.io.File"
  import "android.text.format.Formatter"
  size=File(tostring(ml..data)).length()
  if size+0==大小+0 then
  print("验证成功")
  intent = Intent(Intent.ACTION_VIEW)
  intent.setDataAndType(Uri.parse("file://"..ml..data), "application/vnd.android.package-archive")
  intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
  activity.startActivity(intent)
  else
  print("验证失败请重新下载",size,大小)
  os.remove(ml..data)
  end
end



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
    --if 退出 then break else
    len = is.read(bs)
    --end
  end
  wj.close();
  is.close();
  pcall(call,"dstop",co)
end
function appDownload(url,path)
  thread(xdc,url,path)
end

function 下载(title,url,path,colour)
  local ts=true
  appDownload(url,path)
  local 布局={
    LinearLayout,
    id="appdownbg",
    layout_width="fill",
    layout_height="fill",
    orientation="vertical",
    {
      TextView,
      id="appdownsong",
      text=title,
      --  typeface=Typeface.DEFAULT_BOLD,
      layout_margin="15dp",
      textColor="#ff000000",
      textSize="20sp",
    },
    {
      TextView,
      id="appdowninfo",
      text="已下载：0MB/0MB\n下载状态：准备下载",
      --id="显示信息",
      --  typeface=Typeface.MONOSPACE,
      layout_marginRight="15dp",
      layout_marginLeft="15dp",
      layout_marginBottom="15dp",
      textSize="15sp",
    },
    {
      ProgressBar,
      id="进度条",
      style="?android:attr/progressBarStyleHorizontal",
      layout_width="fill",
      progress=60,
      layout_marginRight="15dp",
      layout_marginLeft="15dp",
      layout_marginBottom="15dp",
    },
    {
      LinearLayout,
      layout_marginRight="15dp",
      layout_marginLeft="15dp",
      layout_marginBottom="15dp",
      --  orientation="horizontal",
      layout_width="fill",
      gravity="right",
      {
        TextView,
        textSize="15sp",
        --    layout_gravity="right",
        textColor="#0080FF",
        text="取消",
        --   typeface=Typeface.MONOSPACE,
        id="取消"
        --onClick="取消"
      },
      {LinearLayout,
        layout_width="50";
      },
      {
        TextView,
        textSize="15sp",
        --    layout_gravity="right",
        textColor="#0080FF",
        text="",
        --   typeface=Typeface.MONOSPACE,
        id="安装"
        --onClick="取消"
      },

    }
  }
  local dldown=AlertDialog.Builder(activity)
  .setView(loadlayout(布局))
  .show()
  .setCancelable(false)

  function ding(a,b)--已下载，总长度(byte)
    import "android.content.Context"
    xcn=activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo();
    --[[if xcn== nil then
    print"无网络"
退出=true
    else]]
    appdowninfo.Text=string.format("%0.2f",a/1024/1024).."MB/"..string.format("%0.2f",b/1024/1024).."MB".."\n下载状态：正在下载！"
    进度条.progress=(a/b*100)
  end

  function dstop(c)--总长度
    if ts then
      安装.Text="安装"
      appdowninfo.Text="下载完成，总长度"..string.format("%0.2f",c/1024/1024).."MB"
      intent = Intent(Intent.ACTION_VIEW)
      安装包路径="/"..path
      intent.setDataAndType(Uri.parse("file://"..安装包路径), "application/vnd.android.package-archive")
      intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
      activity.startActivity(intent)
      luajava.clear(ts)
     else
      --print("下载完成！")
      luajava.clear(ts)
    end
  end

  --取消.onClick=function(v)

  function 安装.onClick()
    开始安装(目录,安装包名,大小)
    dldown.dismiss()
  end
  function 取消.onClick()
    os.remove("/"..path)
    dldown.dismiss()
    luajava.clear(dldown,布局)
    ts=nil
  end
end