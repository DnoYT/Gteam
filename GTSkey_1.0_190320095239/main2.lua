require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
activity.setContentView(loadlayout("layout"))
一言=function()
  json=import "cjson"
  url="https://api.gushi.ci/shuqing/aiqing.json"
  Http.get(url,nil,"UTF-8",nil,function(a,b,c,d)
    if(a==200 and b)then
      local 内容=json.decode(b)
      local 内容1=内容["content"]
      local 作者=内容["author"]
      local 出处=内容["origin"]
      跑马灯.setText(内容1.."--"..作者.."--原文出自--"..出处)
     else
      print("网络错误"..a)
    end
    return true
  end)
end
task(1,function() 一言()end)
local wm=
{
  LinearLayout;
  orientation="vertical";
  layout_height="fill";
  layout_width="fill";
  {
    LinearLayout;
    orientation="horizontal";
    layout_margin="0dp";
    id="bm8";
    layout_width="40%w";
    layout_height="65dp";
    layout_marginTop="18dp";
    gravity="center";
    {
      ImageView,
      layout_width="40dp",
      id="图片";
      layout_height="40dp",
      layout_gravity="center";
    },
    {
      LinearLayout;
      orientation="vertical";
      layout_margin="0dp";
      layout_width="fill";
      layout_height="fill";
      layout_marginLeft="2%w";
      gravity="center|left";
      {
        TextView;
        textSize="14sp";
        id="主题";
        textColor="#000000";
      };
      {
        LinearLayout;
        BackgroundColor="#c0c0c0";
        layout_height="1.5dp";
        layout_width="-1";
        layout_marginTop="1dp";

      };
      {
        TextView;
        textSize="12sp";
        id="介绍";
        textColor="#797979";
        layout_marginTop="2dp";
      };
    };
  };
};






adp=LuaAdapter(activity,wm)
主题={1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1}
图片={"imgs/1.png",}
介绍={1,2,3,4,5,6,7,8,9,8,7,6,5,4,3,2,1}
for v,n in ipairs(主题) do
  adp.add{主题=n,介绍=介绍[v],图片=图片[1]}
end

lb.setAdapter(adp)
lb.onItemClick=function(parent, v, pos,id)
  switch id
   case 1
    print("成功")
   case 2
    print("测试")
  end
  return true
end

lb.onItemLongClick=function(l,v,p,i)
  print(i)
  return true
end


layout1={
  LinearLayout;
  layout_width="-1";
    layout_height="6%h";
  gravity="center|left";
  orientation="vertical";
  {
    TextView;
    layout_marginLeft="10sp";
    textSize="20sp";
    id="tv";
  };
};



adp=LuaAdapter(activity,layout1)
adp.add{tv="1"}
listview.Adapter=adp
listview.onItemClick=function(parent, v, pos,id)
  switch id
    case 1
    print("第一个")
    case 2
    
    end
end