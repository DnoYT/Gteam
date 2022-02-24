require "import"
import "android.content.Context"
import "android.net.ConnectivityManager"
import "android.net.NetworkInfo"
import "android.telephony.TelephonyManager"

--[[
1. 判断手机是否已经连接到网络
2. 获取网络连接的类型 Wi-Fi 或 移动数据连接

@author:  NowTime<wenzhouchan@gmail.com
@link:    https://nowtime.cc
--]]

function get_network_type()
  --没有网络连接
  local NETWORN_NONE = 0;

  --Wi-Fi 连接
  local NETWORN_WIFI = 1;

  --手机网络数据连接类型
  local NETWORN_2G = 2;-- 2G
  local NETWORN_3G = 3;-- 3G
  local NETWORN_4G = 4;-- 4G
  local NETWORN_MOBILE = 5;-- 未识别的网络信号

  --获取系统的网络服务
  connManager = activity.getSystemService(Context.CONNECTIVITY_SERVICE);

  --如果当前没有网络
  if (nil == connManager) then
    return NETWORN_NONE;
  end

  --获取当前网络类型，如果为空，返回无网络
  activeNetInfo = connManager.getActiveNetworkInfo();
  if (activeNetInfo == nil or activeNetInfo.isAvailable() == false) then
    return NETWORN_NONE;
  end

  --判断是不是连接的是不是wifi
  wifiInfo = connManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
  if (nil ~= wifiInfo) then
    state = wifiInfo.getState();
    if (null ~= state) then
      if (state == NetworkInfo.State.CONNECTED or state == NetworkInfo.State.CONNECTING) then
        return NETWORN_WIFI;
      end
    end
  end

  --如果不是wifi，则判断当前连接的是运营商的哪种网络 2G、3G、4G 等
  networkInfo = connManager.getNetworkInfo(ConnectivityManager.TYPE_MOBILE);

  if (nil ~= networkInfo) then
    state = networkInfo.getState();
    strSubTypeName = tostring(networkInfo.getSubtypeName());
    if (nil ~= state) then
      if (state == NetworkInfo.State.CONNECTED or state == NetworkInfo.State.CONNECTING) then
        local NetInfo = tonumber(activeNetInfo.getSubtype());

        if (NetInfo == 1 or NetInfo == 2 or NetInfo == 4 or NetInfo == 7 or NetInfo == 11) then
          return NETWORN_2G;
        end

        if (NetInfo == 3 or NetInfo == 5 or NetInfo == 6 or NetInfo == 8 or NetInfo == 9 or NetInfo == 10 or NetInfo == 12 or NetInfo == 14 or NetInfo == 15) then
          return NETWORN_3G;
        end

        if (NetInfo == 13) then
          return NETWORN_4G;
        end

        if (strSubTypeName.equalsIgnoreCase("TD-SCDMA") or strSubTypeName.equalsIgnoreCase("WCDMA") or strSubTypeName.equalsIgnoreCase("CDMA2000")) then
          return NETWORN_3G;
         else
          return NETWORN_MOBILE;
        end
      end
    end
    return NETWORN_NONE;
  end
end

--[[
使用方法：
print(get_network_type())
]]

网络=get_network_type()


--[[
获取本地以前的版本号 判断是否更新
]]
安装提示=true
本地目录1=Environment.getExternalStorageDirectory().toString().."/GTSkey/data.txt"
import "java.io.File"--导入File类
--判断本地目录是否存在？
if File(本地目录1).isFile() then
  file=io.open(本地目录1,"r")
  原来文件= file:read('*a'):match("文件名%((.-)%)文件名")
  file:close()
  更新提示="从 "..原来文件.." >>> "..现在文件名
  --判断是否安装包一样
  if 原来文件==现在文件名 then 安装提示=false end
 else
  更新提示="安装了"
end
return 网络
--if 安装提示 then print(更新提示) end