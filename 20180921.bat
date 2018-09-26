@echo off      
cls           
color 0A 
echo IP地址更改工具

::ver 0.0921
::修正DNS部分代码
::0921-2018 09:21	@张志超	

set MASK=255.255.255.0 
set GATEWAY=192.168.0.1 
set NAME="Local Area Connection" 
set DNS1=202.97.224.69
set DNS2=219.150.32.132
 
:ENTER

echo.
echo. 
echo 默认配置信息为：
echo.
echo 子网掩码:	%MASK%
echo 网关:		%GATEWAY%
echo 适配器:		%NAME%
echo DNS1:		%DNS1%
echo DNS2:		%DNS2%
echo.
echo.
echo.

 
echo. 
echo. 
echo 1:更改IP  
echo 2:显示网络配置信息
echo 0:退出

echo.
set /p KEY= [您的选择是：]     
if %KEY% == 1 goto CASE1
if %KEY% == 2 goto CASE2
if %KEY% == 0 goto EXIT

:CASE1
echo.
set /p IP= [请输入IP地址:] 
echo. 
echo 正在更改IP.....
netsh interface ip set address name=%NAME% source=static addr=%IP% mask=%MASK% gateway=%GATEWAY% 
netsh interface ip set dns %NAME% static %DNS1%
netsh interface ip add dns %NAME% %DNS2%

echo IP地址/子网掩码/网关设置完成 
goto ENTER

:CASE2
ipconfig /all
goto ENTER

:EXIT
exit

