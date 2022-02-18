require "import"
import "android.R$id"
import "android.widget.TextView"
import "android.widget.Button"
import "android.widget.ListView"
import "android.widget.LinearLayout"
import "android.widget.CardView"
import "android.content.Context"
import "android.content.Intent"
import "android.net.Uri"
import "com.androlua.LuaAdapter"
url="http://www.comgt.cn"
viewIntent = Intent("android.intent.action.VIEW",Uri.parse(url))
activity.startActivity(viewIntent)

import "GTbu.adout"


activity.setContentView(loadlayout(adout))


home.onClick=function()
  --activity.moveTaskToBack(true)
  --返回桌面
  activity.finish()
end


GTSide={
  LinearLayout;
  layout_width="-1";
  layout_height="6%h";
  gravity="center|left";
  orientation="vertical";
  {
    TextView;
    layout_marginLeft="10sp";
    textSize="20sp";
    textColor="#415287";
    id="GTtv";
  };
};

GTtv={"联系方式：","       云天","","  这个是测试版bug是非常多的！",
  "希望遇到bug请反馈给我们，我会尽快","修复！↓↓↓长按复制⊙▽⊙",
  "QQ群反馈内测群：1016790132","电子邮箱：1545496702@qq.com"}

adp=LuaAdapter(activity,GTSide)
--GTtv={"联系方式：","云天"}
for v,n in ipairs(GTtv) do
  adp.add{GTtv=n}
end
listview.Adapter=adp
listview.onItemClick=function(parent, v, pos,id)
  switch id
   case 1
    -- print("第一个")
   case 2
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("1545496702")
    print("已经复制QQ:1545496702")
   case 7
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("1016790132")
    print("已经复制内测QQ群:1016790132")
   case 8
    import "android.content.*"
    activity.getSystemService(Context.CLIPBOARD_SERVICE).setText("1545496702@qq.com")
    print("已经复制邮箱:1545496702@qq.com")
  end
end