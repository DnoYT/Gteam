function 控件圆角(view,左上,右上,左下,右下,InsideColor)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setColor(InsideColor)
  drawable.setCornerRadii({左上,左上,右上,右上,左下,左下,右下,右下});
  view.setBackgroundDrawable(drawable)
end
function 沉浸(col)
  --activity.supportActionBar.hide()
  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
  --View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(col);
end
function 沉浸二(col)
  --activity.supportActionBar.hide()
  activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
  activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(col);
end
function 状态栏高度()
  local h=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().status_bar_height)
  return h
end
function 导航栏高度()
  local h=activity.getResources().getDimensionPixelSize(luajava.bindClass("com.android.internal.R$dimen")().navigation_bar_height)
  return h
end
function 波纹(控件,颜色)
  RippleHelper(控件).RippleColor=颜色
end
function 旋转动画(控件,a,b,c,d,时间)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(控件,"rotation",{a,b,c,d}).setDuration(时间).start()
end
function 水珠动画(控件,时间)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(控件,"scaleX",{1,.8,1.3,.9,1}).setDuration(时间).start()
  ObjectAnimator().ofFloat(控件,"scaleY",{1,.8,1.3,.9,1}).setDuration(时间).start()
end
function 底部会员提示(内容,颜色,文字颜色)
  local 布局=loadlayout({
    FrameLayout;
    layout_height="fill";
    layout_width="wrap_content";
    {
      LinearLayout;
      layout_height="34dp";
      layout_width="wrap_content";
      layout_gravity="center";
      orientation="horizontal";
      {
        CardView;
        layout_height="fill";
        layout_width="wrap_content";
        radius="3dp";
        elevation="0dp";
        CardBackgroundColor=颜色;
        {
          TextView;
          id="toast_text";
          textSize="11dp";
          textColor=文字颜色;
          layout_height="fill";
          layout_width="wrap_content";
          layout_marginLeft="15dp";
          layout_marginRight="15dp";
          gravity="center";
        }
      };
    }
  })
  local toast=Toast.makeText(activity,nil,Toast.LENGTH_LONG).setView(布局).show()
  toast_text.setText(内容)
end



function 加载图标(icoid)
  
  IcoObj={}
  
  IcoNme={}

  IcoImg={}
  

  --阿里图标库API地址
  url="https://www.iconfont.cn/api/collection/detail.json"

  --post传入数据
  if icoid=="" then

    data="?id=16213&t=1557707700703&ctoken=XKY6LDqlWlOHDv8g5bBDO-S9"
    --16213
   else

    data="?id="..icoid.."&t=1557707700703&ctoken=XKY6LDqlWlOHDv8g5bBDO-S9"--"&sortType=updated_at&page=1&pageSize=0&fromCollection=1&fills=null&ctoken=sh6GKQur-48KjRv0-IDssPrQ"

  end

  --阿里图标库所需header,用于验证用户身份
  header={["Cookie"]="ctoken=XKY6LDqlWlOHDv8g5bBDO-S9"}

  --异步加载:目的获得图标最大数量
  Http.get(url..data,cookie,"utf-8",header,function(code,content,cookie,header)

    if code==200 then

      cjson=import "cjson"

      json=cjson.decode(content)

      --图标数量
      icoCount=json["data"]["collection"]["icons_count"]

      底部会员提示("今日为您推荐"..tointeger(icoCount).."个图标",0xFF4C21AF,0xffffffff)


      if icoCount>=52 then

        for i=1,icoCount do

          SvgJsonStr=json["data"]["icons"][i]["show_svg"]

          SvgJsonName=json["data"]["icons"][i]["name"]

          table.insert(IcoImg,SvgJsonStr)

          SvgJsonStr=SVG.getFromString(tostring(SvgJsonStr))

          table.insert(IcoObj,SvgJsonStr)

          table.insert(IcoNme,SvgJsonName)

        end

        for i=1,200 do

          --给GridView添加内容

          a={
            SVG=IcoObj[i],
          }

          adapter2.add{item_img=a,item_name=IcoNme[i]}

        end

       else

        print("好几页页图标")

      end

     else

      底部会员提示("链接服务器失败",0xFF4C21AF,0xffffffff)

    end

  end)

end