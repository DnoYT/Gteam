




function 手势滑动(dialog,id,yy)

  velocityTracker = VelocityTracker.obtain();

  id.onTouch=function(v,e)

    a=e.getAction()&255

    switch a

     case MotionEvent.ACTION_DOWN

      velocityTracker.addMovement(e)

      downY=e.getY()

     case MotionEvent.ACTION_MOVE

      velocityTracker.addMovement(e)

      velocityTracker.computeCurrentVelocity(1000);

      moveY=e.getY()

      Y=moveY - downY

      if Y>0 then

        v.setTranslationY(Y/2)

      end

      vsd = velocityTracker.getYVelocity()

     case MotionEvent.ACTION_UP

      upY=e.getY()

      upY=upY-downY

      if upY>0 then

        if upY>yy || vsd>5000 then

          ObjectAnimator.ofFloat(icon_down_box,"translationY",{upY/2,activity.getWidth()}).setDuration(300).start()

          --ObjectAnimator().ofFloat(v,"Y",{upY/2,activity.getHeight()}).setDuration(500).start()

          task(300,function()

            dialog.dismiss()

            velocityTracker.recycle()

          end)

         else
          ObjectAnimator.ofFloat(icon_down_box,"translationY",{upY/2,0}).setDuration(300).start()
          --ObjectAnimator().ofFloat(v,"Y",{upY/2,0}).setDuration(500).start()

        end

      end

    end

    return true
  end

end

function 显示()
  import "android.graphics.drawable.ColorDrawable"
  local DownLayout={
    LinearLayout;
    id="dc";
    layout_height="fill";
    layout_width="fill";
    {
      LinearLayout;
      layout_height="fill";--导航栏高度()+activity.getHeight();
      layout_width="fill";
      orientation="vertical";
      background="#00000000";
      onClick=function()
        ObjectAnimator.ofFloat(icon_down_box,"translationY",{0,activity.getWidth()}).setDuration(300).start()
        task(300,function()dialog1.dismiss()end)
      end,
      {
        LinearLayout;
        layout_height=activity.getHeight();
        layout_width="fill";
        layout_weight="1";
      },
      {
        LinearLayout;
        id="icon_down_box";
        layout_height="wrap_content";
        layout_width="fill";
        layout_gravity="bottom";
        background="#FFffffff";
        orientation="vertical";
        {
          FrameLayout;
          layout_height="66dp";
          layout_width="fill";
          {
            ColorCardView{radius=88,ElevationColor="6D44FE"};
            layout_height="fill";
            layout_width="fill";
          },
          {
            CardView;
            layout_height="fill";
            layout_width="fill";
            layout_margin="8dp";
            radius="25dp";
            elevation="0";
            background="#FF6D44FE";
            {
              LinearLayout;
              layout_height="fill";
              layout_width="fill";
              orientation="horizontal";
              {
                FrameLayout;
                layout_height="fill";
                layout_width="50dp";
                {
                  CardView;
                  layout_height="fill";
                  layout_width="fill";
                  layout_margin="7.5dp";
                  radius="17.5dp";
                  elevation="0";
                  background="#33ffffff";
                  {
                    FrameLayout;
                    layout_height="fill";
                    layout_width="fill";
                    {
                      ImageView;
                      layout_height="22dp";
                      layout_width="22dp";
                      layout_gravity="center";
                      colorFilter="#ffffffff";
                      src="Image/icon/paint.png";
                    }
                  }
                }
              },
              {
                FrameLayout;
                layout_height="fill";
                layout_width="fill";
                layout_weight="1";
                {
                  CardView;
                  layout_height="fill";
                  layout_width="fill";
                  layout_margin="7.5dp";
                  radius="17.5dp";
                  elevation="0";
                  background="#33ffffff";
                  {
                    TextView;
                    text="#ffffffff";
                    textColor="#88ffffff";
                    textSize="13dp";
                    layout_height="fill";
                    layout_width="fill";
                    gravity="center";
                  }
                }
              },
              {
                FrameLayout;
                layout_height="fill";
                layout_width="fill";
                layout_weight="1";
                {
                  CardView;
                  layout_height="fill";
                  layout_width="fill";
                  layout_margin="7.5dp";
                  radius="17.5dp";
                  elevation="0";
                  background="#33ffffff";
                  {
                    TextView;
                    text="#FF565A5F";
                    textColor="#88ffffff";
                    textSize="13dp";
                    layout_height="fill";
                    layout_width="fill";
                    gravity="center";
                  }
                }
              },
              {
                FrameLayout;
                layout_height="fill";
                layout_width="50dp";
                {
                  CardView;
                  layout_height="fill";
                  layout_width="fill";
                  layout_margin="7.5dp";
                  radius="17.5dp";
                  elevation="0";
                  background="#33ffffff";
                  {
                    FrameLayout;
                    layout_height="fill";
                    layout_width="fill";
                    {
                      ImageView;
                      layout_height="22dp";
                      layout_width="22dp";
                      layout_gravity="center";
                      colorFilter="#ffffffff";
                      src="Image/icon/paint.png";
                    }
                  }
                }
              },
            }
          },
        },
        {
          LinearLayout;
          layout_height="50%w";
          layout_width="fill";
          orientation="horizontal";
          {
            FrameLayout;
            layout_height="fill";
            layout_width="fill";
            {
              ColorCardView{radius=33,ElevationColor="565A5F"};
              layout_height="fill";
              layout_width="fill";
            },
            {
              CardView;
              layout_height="fill";
              layout_width="fill";
              layout_margin="10dp";
              radius="10dp";
              elevation="3dp";
              background="#FF565A5F";
            }
          }
        },
        {
          LinearLayout;
          layout_height="66dp";
          layout_width="fill";
          orientation="horizontal";
          {
            FrameLayout;
            layout_height="fill";
            layout_width="fill";
            layout_weight="1";
            {
              ColorCardView{radius=88,ElevationColor="565A5F"};
              layout_height="fill";
              layout_width="fill";
            },
            {
              CardView;
              layout_height="fill";
              layout_width="fill";
              layout_margin="8dp";
              radius="25dp";
              elevation="0";
              background="#FF565A5F";
              {
                LinearLayout;
                layout_height="fill";
                layout_width="fill";
                orientation="horizontal";
                {
                  FrameLayout;
                  layout_height="fill";
                  layout_width="50dp";
                  {
                    ImageView;
                    layout_height="25dp";
                    layout_width="25dp";
                    layout_gravity="center";
                    colorFilter="#ffffffff";
                    src="Image/icon/size.png";
                  }
                },
                {
                  TextView;
                  text="200*200";
                  textColor="#88ffffff";
                  textSize="13dp";
                  layout_height="fill";
                  layout_width="fill";
                  gravity="center";
                }
              }
            }
          },
          {
            FrameLayout;
            layout_height="fill";
            layout_width="66dp";
            {
              ColorCardView{radius=88,ElevationColor="565A5F"};
              layout_height="fill";
              layout_width="fill";
            },
            {
              CardView;
              layout_height="fill";
              layout_width="fill";
              layout_margin="8dp";
              radius="25dp";
              elevation="0";
              background="#FF565A5F";
              {
                FrameLayout;
                layout_height="fill";
                layout_width="fill";
                {
                  ImageView;
                  layout_height="22dp";
                  layout_width="22dp";
                  layout_gravity="center";
                  colorFilter="#ffffffff";
                  src="Image/icon/svg_down.png";
                }
              }
            }
          },
          {
            FrameLayout;
            layout_height="fill";
            layout_width="66dp";
            {
              ColorCardView{radius=88,ElevationColor="565A5F"};
              layout_height="fill";
              layout_width="fill";
            },
            {
              CardView;
              layout_height="fill";
              layout_width="fill";
              layout_margin="8dp";
              radius="25dp";
              elevation="0";
              background="#FF565A5F";
              {
                FrameLayout;
                layout_height="fill";
                layout_width="fill";
                {
                  ImageView;
                  layout_height="22dp";
                  layout_width="22dp";
                  layout_gravity="center";
                  colorFilter="#ffffffff";
                  src="Image/icon/al_down.png";
                }
              }
            }
          },
          {
            FrameLayout;
            layout_height="fill";
            layout_width="66dp";
            {
              ColorCardView{radius=88,ElevationColor="565A5F"};
              layout_height="fill";
              layout_width="fill";
            },
            {
              CardView;
              layout_height="fill";
              layout_width="fill";
              layout_margin="8dp";
              radius="25dp";
              elevation="0";
              background="#FF565A5F";
              {
                FrameLayout;
                layout_height="fill";
                layout_width="fill";
                {
                  ImageView;
                  layout_height="22dp";
                  layout_width="22dp";
                  layout_gravity="center";
                  colorFilter="#ffffffff";
                  src="Image/icon/png_down.png";
                }
              }
            }
          }
        }
      }
    }
  }
  dialog= AlertDialog.Builder(this)

  dialog1=dialog.show()

  dialog1.getWindow().setContentView(loadlayout(DownLayout));

  dialog1.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000));

  dialogWindow = dialog1.getWindow();

  dialogWindow.setGravity(Gravity.BOTTOM);

  dialog1.setCanceledOnTouchOutside(true)
  dialog1.getWindow().getAttributes().width=(activity.Width);
  dialog1.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_ALT_FOCUSABLE_IM);
  --dialog1.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
  --]]
  手势滑动(dialog1,icon_down_box,240)
  控件圆角(icon_down_box,88,88,0,0,0xFFffffff)
  import "android.animation.ObjectAnimator"
  ObjectAnimator.ofFloat(icon_down_box,"translationY",{activity.getWidth(),0}).setDuration(380).start()
end