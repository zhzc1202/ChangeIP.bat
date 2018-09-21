@echo off      
cls           
color 0A 
echo IPµØÖ·¸ü¸Ä¹¤¾ß

::ver 0.0921
::ÐÞÕýDNS²¿·Ö´úÂë
::0921-2018 09:21	@ÕÅÖ¾³¬	

set MASK=255.255.255.0 
set GATEWAY=192.168.0.1 
set NAME="Local Area Connection" 
set DNS1=202.97.224.69
set DNS2=219.150.32.132
 
:ENTER

echo.
echo. 
echo Ä¬ÈÏÅäÖÃÐÅÏ¢Îª£º
echo.
echo ×ÓÍøÑÚÂë:	%MASK%
echo Íø¹Ø:		%GATEWAY%
echo ÊÊÅäÆ÷:		%NAME%
echo DNS1:		%DNS1%
echo DNS2:		%DNS2%
echo.
echo.
echo.

 
echo. 
echo. 
echo 1:¸ü¸ÄIP  
echo 2:ÏÔÊ¾ÍøÂçÅäÖÃÐÅÏ¢
echo 0:ÍË³ö

echo.
set /p KEY= [ÄúµÄÑ¡ÔñÊÇ£º]     
if %KEY% == 1 goto CASE1
if %KEY% == 2 goto CASE2
if %KEY% == 0 goto EXIT

:CASE1
echo.
set /p IP= [ÇëÊäÈëIPµØÖ·:] 
echo. 
echo ÕýÔÚ¸ü¸ÄIP.....
netsh interface ip set address name=%NAME% source=static addr=%IP% mask=%MASK% gateway=%GATEWAY% 
netsh interface ip set dns %NAME% static %DNS1%
netsh interface ip add dns %NAME% %DNS2%

echo IPµØÖ·/×ÓÍøÑÚÂë/Íø¹ØÉèÖÃÍê³É 
goto ENTER

:CASE2
ipconfig /all
goto ENTER

:EXIT
exit

