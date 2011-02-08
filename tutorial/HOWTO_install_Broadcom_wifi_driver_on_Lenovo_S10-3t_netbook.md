HOWTO install Broadcom wifi driver on Lenovo S10-3t netbook  
===========================================================  
  
  
###安装MeeGo1.1  
登录meego.com下载MeeGo v1.1 for Netbooks (Google Chrome Browser)对应的系统镜像，然后采用U盘安装的方式将其安装在Lenovo S10-3t上网本中，注意用户要设为glen，否则在后面编译驱动时会出现找不到glen用户的错误。   
   
###编译和安装wifi驱动  
这部分的教程主要参照了'http://slaine.org/_slaine/Meego_1.1_Wifi.html'中所提供的方法。  
首先在meego中打开终端。  
    $ sudo zypper install rpmdevtools  
    # 使用该命令安装一些必备的工具。  
    
    $ sudo zypper install pattern:development-tools  
    # 安装一些编译工具。  
  
    $ sudo zypper install kernel-netbook-devel  
    # 安装kernel-netbook-devel。  

    $ wget http://slaine.org/meego/releases/1.1/ia32/source/wl-kmod-5.100.82.38-1.src.rpm  
    # 从'slaine.org'上下载slaine提供的moblin srpm文件。  

    $ rpmbuild --rebuild --target=i586 wl-kmod-5.100.82.38-1.src.rpm
    # 编译驱动，编译时会从Broadcom网站上下载驱动文件来编译。 
    # 执行该命令会出现找不到/lib/modules/2.6.35.3-10.3-netbook/build的错误，解决方法是在编译时生成的～/rpmbuild/SPECS/目录中的specs文件中将/lib/modules/%{krelease}/build改为/lib/modules/2.635.3-12.1-netbook/build。
  
    $ sudo rpm -ivh ~/rpmbuild/RPMS/i586/wl-kmod-5.100.82.38-1.i586.rpm  
    # 安装编译好的驱动的rpm。
