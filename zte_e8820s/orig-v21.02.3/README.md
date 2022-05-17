## 本仓库同时提供内核模块软件源，所以你不用自己编译来加插件。科学上网推荐V2rayA，易于配置，安装方式详见[此文档](https://github.com/v2rayA/v2raya-openwrt/blob/master/README.zh-cn.md)
### 注：本补丁是依据https://github.com/siwind/openwrt 修改v21.02.3源码得到的，首先内容不是我原创的，其次只适用于官方openwrt v21.02.3的源码，各路大神的仓库大概率打不上此补丁 ;)
### 此补丁会同时将你的编译配置覆盖为官方配置，编译时会同时生成所有内核模块的ipk（大小一共25M左右），关于内核模块和插件，请看这一篇：（还没写，233）
### 附带的配置同时设置了默认使用wpad-openssl和luci-dashboard，这两个设置都可以省很多事
## 使用方法  
### 前3步适用于大部分linux发行版  
#### 0.配置环境  
参见[零基础编译openwrt看这一篇就够了](https://blog.topstalk.com/%e9%9b%b6%e5%9f%ba%e7%a1%80%e7%bc%96%e8%af%91openwrt%e7%9c%8b%e8%bf%99%e4%b8%80%e7%af%87%e5%b0%b1%e5%a4%9f%e4%ba%86/)的1.1-1.2  
注：如果用国外服务器编译或科学上网，成功率不低。linux的代理设置比较复杂，即使设置好了，很多应用也不走代理，这里依旧推荐V2rayA（是的，它也能装在linux上），可以简单做到让所有应用走代理，而且不用装X桌面即可通过网页端GUI配置，安装方式详见[此页面](https://v2raya.org/docs/prologue/installation/)
#### 1.clone openwrt原仓库  
    git clone https://github.com/openwrt/openwrt.git
    cd openwrt
#### 2.下载E8820S补丁并解压  
    wget https://raw.githubusercontent.com/TsXor/my-openwrt-archive/master/zte_e8820s/orig-v21.02.3/code.tar.gz
    tar -zxvf code.tar.gz
#### 3.加入E8820S支持  
    sh code/append.sh
    #顺手把补丁删了
    rm -rf code.tar.gz code
#### 4.正常编译  
加插件，改源什么的都可以 ;)  
参见[零基础编译openwrt看这一篇就够了](https://blog.topstalk.com/%e9%9b%b6%e5%9f%ba%e7%a1%80%e7%bc%96%e8%af%91openwrt%e7%9c%8b%e8%bf%99%e4%b8%80%e7%af%87%e5%b0%b1%e5%a4%9f%e4%ba%86/)的1.4及以后  
补充一下教程中未提到的：如何改源  
首先切到openwrt下，然后执行：  

    mkdir -p files/etc/opkg
    cat <<EOF >files/etc/opkg/distfeeds.conf
    src/gz openwrt_core 我是自定义源
    src/gz openwrt_base http://mirrors.ustc.edu.cn/openwrt/releases/21.02.3/packages/mipsel_24kc/base
    src/gz openwrt_luci http://mirrors.ustc.edu.cn/openwrt/releases/21.02.3/packages/mipsel_24kc/luci
    src/gz openwrt_packages http://mirrors.ustc.edu.cn/openwrt/releases/21.02.3/packages/mipsel_24kc/packages
    src/gz openwrt_routing http://mirrors.ustc.edu.cn/openwrt/releases/21.02.3/packages/mipsel_24kc/routing
    src/gz openwrt_telephony http://mirrors.ustc.edu.cn/openwrt/releases/21.02.3/packages/mipsel_24kc/telephony
    EOF
搭建一个ftp服务器，上传所有内核模块，然后将上面的“我是自定义源”换成ftp服务器的地址。（这里本应有一篇教程，但是我还没写）
    
