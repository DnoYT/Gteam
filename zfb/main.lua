require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
activity.setContentView(loadlayout(layout))
if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end

b1={
  LinearLayout;
  layout_width="fill";
  orientation="vertical";
  {
    LinearLayout;
    gravity="center|left";
    layout_width="fill";
    background="#ffffff";
    layout_height="45dp";
    {
      LinearLayout;
      layout_width="45dp";
      gravity="center";
      layout_height="45dp";
      {
        ImageView;
        src="2.jpg";
        id="bt";
      };
    };
    {
      TextView;
      text="提现";
      textSize="18";
      id="bx";
    };
    {
      LinearLayout;
      gravity="right";
      layout_width="276dp";
      {
        ImageView;
        src="Screenshot_20190403092954.jpg";
      };
    };
  };
};


图片={"3.jpg","2.jpg"}
主题={"充值","提现"}

adp=LuaAdapter(activity,b1)
for v,n in ipairs(主题) do
  adp.add{bx=n,bt=图片[v]}
end
bu1.setVerticalScrollBarEnabled(false)
bu1.setAdapter(adp)
bu1.onItemClick=function(parent, v, pos,id)
  switch id
   case 1
    activity.newActivity("cz")
   case 2
    print("你想多了……")
  end
  return true
end
qc.onClick=function()
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
    text="输入数字:";
  };
  {
    EditText;
    hint=qc.text;
    layout_marginTop="5dp";
    layout_width="80%w";
    layout_gravity="center",
    id="edit";
  };
};
AlertDialog.Builder(this)
.setTitle("云天")
.setView(loadlayout(InputLayout))
.setPositiveButton("确定",{onClick=function(v) qc.Text=string.format("%s",edit.Text) end})
.setNegativeButton("取消",nil)
.show()
import "android.view.View$OnFocusChangeListener"
edit.setOnFocusChangeListener(OnFocusChangeListener{ 
  onFocusChange=function(v,hasFocus)
    if hasFocus then
      Prompt.setTextColor(0xFD009688)
    end
  end})
end


zfb1.onClick=function()
print("点击金额修改\n\n云天出品")
end