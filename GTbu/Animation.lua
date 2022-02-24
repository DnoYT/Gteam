require "import"
import "android.graphics.Paint"
import "android.graphics.Path"
import "android.graphics.Canvas"
import "android.graphics.Bitmap"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.graphics.drawable.ColorDrawable"
import "android.content.res.ColorStateList"
--import "layout"

--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo_Light)
--activity.setContentView(loadlayout(layout))


chl.setScrimColor(0x00000000)
function ViewHelper.onClick()
  if chl.isDrawerOpen(3) then
    chl.closeDrawer(3)
   else
    chl.openDrawer(3)
  end
end

function sjx(r,b,v)--画图和转箭头函数
  mpaint=Paint().setStyle(Paint.Style.STROKE);
  mpaint.setColor(0xff000000);
  mpaint.setAntiAlias(true);
  mpaint.setStrokeWidth(6)
  bitmap = Bitmap.createBitmap(r, r, Bitmap.Config.ARGB_8888);
  canvas=Canvas(bitmap);
  if not (b) then v=0 end
  ch=v*10
  ci=v*10
  l=3
  for aa=1,-1 ,-1 do
    mpath=Path()
    if b then canvas.rotate(v*(180+aa*45),r/2,r/2) end
    mpath.moveTo(r/2,r/10*l)
    mpath.lineTo(r/5+ch*math.abs(aa),r/10*l)
    mpath.lineTo(r/5*4-ci*math.abs(aa),r/10*l)
    l=l+2
    mpath.close()
    canvas.drawPath(mpath,mpaint);
    if b then canvas.rotate(-v*(180+aa*45),r/2,r/2) end
  end
  --print(bitmap)
  return (bitmap)
end
ViewHelper.setImageBitmap(sjx(115,false))
chl.setDrawerListener{
  onDrawerSlide=function(a,vv)
    ViewHelper.setImageBitmap(sjx(115,true,vv))
  end
}

