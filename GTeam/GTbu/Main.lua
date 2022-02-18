require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

activity.setContentView(loadlayout("layout"))
云天=function()
  json=import "cjson"
  url="https://api.gushi.ci/shuqing/aiqing.json"
  Http.get(url,nil,"UTF-8",nil,function(a,b,c,d)
    if 网络>2 then
      local 通知=json.decode(b)
      local 通知1=通知["content"]
      local 作者=通知["author"]
      local 出处=通知["origin"]
      通知=通知1.."--"..作者.."--原文出自--"..出处
      local 跑马灯2=body:match("跑马灯%((.-)%)跑马灯")

      if 跑马灯2~=nil then
        通知=跑马灯2
        跑马灯.setText(通知)
       else
        跑马灯.setText(通知)
        local 诗句1=基础:match("诗句={.-}\n")
        if 诗句1==nil then
          if 通知==nil then
            通知='日日思君不见君，共饮长江水。--李之仪--原文出自--卜算子·我住长江头'
          end
          缓存("","\n诗句={'"..通知.."'}\n")
         else
          load(诗句1)()
          通知=诗句[math.random(1,#诗句)]
          缓存("诗句.-(})",",'"..通知.."'}")
        end
      end
     else
      local 诗句1=基础:match("诗句={.-}\n")
      if 诗句1==nil then
        通知='日日思君不见君，共饮长江水。--李之仪--原文出自--卜算子·我住长江头'
        缓存("","\n诗句={'"..通知.."'}\n")
        跑马灯.setText(通知)
       else
        load(诗句1)()
        通知=诗句[math.random(1,#诗句)]
        跑马灯.setText(通知)
      end
    end
    return true
  end)
end
task(1,function() 云天()end)










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



