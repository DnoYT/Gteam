require "import"
import "android.widget.*"
import "android.view.*"

cz1={
  LinearLayout;
  orientation="vertical";
  {
    TextView;
    textSize="20";
    text="欢迎充值！";
  };
  {
    TextView;
    textSize="20dp";
    text="记得备注好赞助者联系方式！";
  };
  {
    ImageView;
    src="-324ac14d72deb0a2.jpg";
  };
};

activity.setContentView(loadlayout(cz1))