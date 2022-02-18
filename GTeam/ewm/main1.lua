require "import"
import "android.widget.*"
import "android.view.*"

buj={
  LinearLayout;
  gravity="center";
  orientation="vertical";
  {
    ImageView;
    id="logos"
  };
};

activity.setContentView(loadlayout(buj))
function main(v1,v2,v3,v4,v5)
  import "android.graphics.SweepGradient"
  import "com.androlua.LuaDrawable"
  import "android.graphics.RectF"
  import "android.graphics.DashPathEffect"
  import "android.graphics.Color"
  import "android.graphics.Path"
  import "android.graphics.BitmapFactory"
  import "com.android.qrcode.*"
  v3 = BitmapFactory.decodeFile(v3)
  if v5 then
    local i = 二维码类.带图标二维码(v1,v2,v3,v4)
    logos.setImageBitmap(i)
   else
    local i = 二维码类.二维码生成(v1,v2,v4)
    logos.setImageBitmap(i)
  end
end
