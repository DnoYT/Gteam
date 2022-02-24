require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout2"
import "cj"
import "AndLua"
activity.setTheme(R.AndLua1)
activity.setContentView(loadlayout(layout2))



item={
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  {
    CardView;
    background="#ff00ffff";
    -- layout_height="62dp";
    CardElevation="3dp";
    layout_width="fill";
    radius=20;
    layout_margin="12dp";
    {
      LinearLayout;
      layout_width="match_parent";
      layout_height="match_parent";
      orientation="vertical";
      {
        LinearLayout;
        layout_width="match_parent";
        layout_marginTop="8dp";
        {
          TextView;
          id="s_v1";
          text="名称";
          layout_marginLeft="10dp";
        };
        --[[  {
          TextView;
          id="s_v2";
          text="id";
          layout_marginLeft="60dp";
        };]]
      };
      {
        TextView;
        text="";
        layout_marginRight="10dp";
        gravity="right";
        layout_width="fill";
        layout_marginTop="5dp";
        id="s_v3";
        layout_marginBottom="10dp";
        layout_marginLeft="10dp";
      };
    };
  };
};


function adpz(offs)
  data={}
  adp=LuaAdapter(activity,data,item)
  lis.Adapter=adp
  for i,w in ipairs(offs) do
    w1=w:gsub("—.+","")
    w2=w:match("——(.+)")

    table.insert(data,{
      s_v1={
        Text=w1,
      },
      s_v3={
        Text=w2
      },
    })
  end
end


function 刷新()
  下载()
  数据=整理()
  adpz(数据)
end

function 整理()
  原数=io.readall(activity.getLuaDir("data.txt"))
  处理1={}
  for w in string.gmatch(原数, "[^\n]+") do
    -- print(w)    --连续输出每个单词
    table.insert(处理1,w)
  end

  --print(dump(处理1))

  处理={}
  for i=1,#处理1 do
    table.insert(处理,处理1[#处理1-i+1])
  end

  return 处理
end

数据=整理()
adpz(数据)



yun={}
tittle={"添加","刷新","导出","关于","加群"}
function onCreateOptionsMenu(menu)
  for k,v in ipairs(tittle) do
    if tittle[v] then
      local m=menu.addSubMenu(v)
      for k,v in ipairs(tittle[v]) do
        m.add(v)
      end
     else
      local m=menu.add(v)
      m.setShowAsActionFlags(1)
    end
  end
end

function onMenuItemSelected(id,tittle)
  if yun[tittle.getTitle()] then
    yun[tittle.getTitle()]()
  end
end


yun.添加=function(v)
  InputLayout={
    LinearLayout;
    orientation="vertical";
    Focusable=true,
    FocusableInTouchMode=true,
    {
      TextView;
      id="Prompt",
      textSize="15sp",
      layout_marginTop="10dp";
      layout_marginLeft="3dp",
      layout_width="80%w";
      layout_gravity="center",
      text="输入:";
    };
    {
      EditText;
      hint="输入散文";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="edit";
    };
    {
      TextView;
      id="Prompt",
      textSize="15sp",
      layout_marginTop="10dp";
      layout_marginLeft="3dp",
      layout_width="80%w";
      layout_gravity="center",
      text="输入:";
    };
    {
      EditText;
      hint="我在人间凑数的日子";
      layout_marginTop="5dp";
      layout_width="80%w";
      layout_gravity="center",
      id="edit2";
    };
  };

  AlertDialog.Builder(this)
  .setTitle("我在人间凑数的日子")
  .setView(loadlayout(InputLayout))
  .setPositiveButton("确定",{onClick=function(v)
      -- print(edit.Text)
      local v1=edit.Text:gsub("\n","")
      local v2=edit2.Text:gsub("\n","")
      if #v1<2 then
        print("不能小于2个字")
        return false
      end
      if #v2<1 then
        txt=v1
       else
        txt=string.format("%q",edit.Text).."——".. string.format("%q",edit2.Text)
      end
      txt=txt:gsub("———","——")
      txt=txt:gsub("———","——")
      添加(txt)
      刷新()
    end})
  .setNegativeButton("取消",nil)
  .show()
end

yun.刷新=function()
  刷新()
end

yun.关于=function()
  activity.newActivity("gy")--跳转页面
end


yun.导出=function()
  导出()
end

yun.加群=function()
  加群("616908783")
end