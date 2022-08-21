# 下载lnmp
wget http://soft.vpser.net/lnmp/lnmp1.9.tar.gz -cO lnmp1.9.tar.gz
# 解压
tar zxf lnmp1.9.tar.gz 
cd lnmp1.9 
# 安装
LNMP_Auto="y" DBSelect="4" Bin="n" DB_Root_Password="super-forum" InstallInnodb="y" PHPSelect="11" SelectMalloc="1" ./install.sh lnmp

# 安装swoole 
yes y | head-2 | ./addons.sh install swoole

# 安装redis
yes y | head-2 | ./addons.sh install redis

# 安装fileinfo
yes y | head-2 | ./addons.sh install fileinfo

# 解除php禁用函数
sed -i 's/disable_functions =.*/disable_functions =/g' /usr/local/php/etc/php.ini

# 关闭swoole shortCode
echo "swoole.use_shortname = 'Off'" >>  /usr/local/php/etc/php.ini

# composer 换源
yes y | composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 卸载nginx
/etc/init.d/nginx stop
rm -rf /usr/local/nginx
rm -f /etc/init.d/nginx