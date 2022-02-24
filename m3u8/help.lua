require "import"
import "android.widget.*"
import "android.view.*"

a={
LinearLayout;
orientation="vertical";
{
TextView;
textSize="17sp";
text=[==[m3u8视频合并使用说明：
            m3u8是云天编剧开源在，GTeam软件下面的一个插件！
           点击右上的文件图标，选择 '视频名字.m3u8' 或者 local.m3u8 文件
下图是文件以文本形式打开的内容↓↓↓]==];
};
{
ImageView;
src="jt/-7f60e92300a26078.jpg";
};
{
TextView;
text=[==[     或者你可以选择，在和ts同目录下的load.m3u8文件
    下图是此文件打开的是示列图!]==];
textSize="17sp";
};
{
LinearLayout;
gravity="top";
{
ImageView;
layout_gravity="top";
src="jt/148f9bfc4d88388e.jpg";
layout_width="50%w";
};
{
ImageView;
src="jt/249b1a0ad7adb99f.jpg";
};
};
};

activity.setContentView(loadlayout(a))