@echo off      
cls           
color 0A 
echo IP��ַ���Ĺ���

::ver 0.0921
::����DNS���ִ���
::0921-2018 09:21	@��־��	

set MASK=255.255.255.0 
set GATEWAY=192.168.0.1 
set NAME="Local Area Connection" 
set DNS1=202.97.224.69
set DNS2=219.150.32.132
 
:ENTER

echo.
echo. 
echo Ĭ��������ϢΪ��
echo.
echo ��������:	%MASK%
echo ����:		%GATEWAY%
echo ������:		%NAME%
echo DNS1:		%DNS1%
echo DNS2:		%DNS2%
echo.
echo.
echo.

 
echo. 
echo. 
echo 1:����IP  
echo 2:��ʾ����������Ϣ
echo 0:�˳�

echo.
set /p KEY= [����ѡ���ǣ�]     
if %KEY% == 1 goto CASE1
if %KEY% == 2 goto CASE2
if %KEY% == 0 goto EXIT

:CASE1
echo.
set /p IP= [������IP��ַ:] 
echo. 
echo ���ڸ���IP.....
netsh interface ip set address name=%NAME% source=static addr=%IP% mask=%MASK% gateway=%GATEWAY% 
netsh interface ip set dns %NAME% static %DNS1%
netsh interface ip add dns %NAME% %DNS2%

echo IP��ַ/��������/����������� 
goto ENTER

:CASE2
ipconfig /all
goto ENTER

:EXIT
exit

