@echo off

if main==%1 goto MAIN
%COMSPEC% /E:on /V:on /C call %0 main %1
exit

:MAIN

rem Alex Dragon's MP3 to OGG converter v1.1

rem bat-�ਯ� ��� �������஢���� mp3-䠩��� � �ଠ� ogg.

rem ������� ࠧ��⨥� ���� �ਯ� "MP3 to OGG AutoTranscoder 1.0"
rem �� VEG (http://vorbis.org.ru)

rem �ᯮ�짮�����:   �ய���   ��樨   ���䨣��樨,   �᫨   ��   ���ࠨ����
rem ��  㬮�砭��.  � ����⢥ ��ࠬ��� ����᪠ ����� ������ ���� � �ॡ㥬���
rem ��⠫���: converter.bat x:\some\dir
rem ��  䠩��  �  �⮬ ��⠫��� � �����⠫���� ���� ��ࠡ�⠭� ��⮬���᪨.
rem ����  �������  �ਯ�  �  ��४���  � mp3 䠩����, �������. ���஡���
rem �⠩� ����.

rem ----------------------------------------------------------------------------

rem ��⠭���� ��ࠬ��஢ ����஢���� Ogg.

rem Frequency  -  ����  ��।���⨧�樨  (�.  --resample  �  ���㬥��樨
rem ��  oggenc.exe),  �����筮�  楫��,  �᫨  �� �ॡ���� - ��⠢��� �����,
rem �㤥� �ᯮ�짮���� ���� ��室���� 䠩��, ���祭�� �� 㬮�砭�� - ���.

set Frequency=

rem Quality  -  ����⢮ ogg-䠩�� � �᫮���� ������� �� -1 �� 10 (� ��������
rem ॠ�������  �����  �  �ࠢ��  㪠���� �� -2, �� � ���� � �⨬ ��ࠬ��஬
rem �뤠��  �訡��),  �.  -q  �  ���-樨  (��������:  �஡��� ���� �⤥�����
rem ��  �窮�,  �  �������!),  �᫨ �� �ॡ���� - ��⠢��� �����, ����஢騪
rem �ᯮ����  ᢮�  ����७���  ���祭��  ��  㬮�砭��  (���筮  3,0), �����
rem � �ਯ� - ���⠢���� 1,5.

set Quality=1,5
 
rem Bitrate - �������쭠� ᪮���� ᦠ⮣� ��⮪� � �������� � ᥪ㭤� (kbps),
rem �������᪫����  �  Quality,  �᫨ ������ ��� - ����஢騪� � �⮬ �ਯ�
rem �㤥� ��।��� Quality. ���祭�� �� 㬮�砭��: ���.

set Bitrate=

rem Downmix - ᢥ����� ��८ � ����,  0 - ���, 1 - ����祭�, �� 㬮�砭�� - 0.
rem �᫨ 㪠���� �⫨筮� ���祭�� - �㤥� �ਭ㤨⥫쭮 ��⠭����� � ����.

set Downmix=0

rem ��� ���⨦���� ���ᨬ��쭮�� ᦠ�� �� �����-����� �ਥ������ ����⢥ ���
rem �祢��  �ணࠬ�,  ���ਬ��  �㤨�����,  �����  ��४����������  ᫥���騥
rem ��ࠬ����: Frequency=24000, Quality=0 (���� Bitrate=24), Downmix=1.

rem ----------------------------------------------------------------------------

rem TmpFile  -  �ᯮ�짮���� �஬������ wav-䠩�. lame ᯥࢠ ��������� mp3
rem �  ��ᦠ��  wav,  �  ��⥬  㦥 oggenc ��४������ ��� wav � ogg. ��㣠�
rem ���⥣�� - ��⮪ �� lame'� �㤥� ��।������� �����।�⢥��� oggenc �१
rem �������, �� �⮬ 㢥��稢����� ���� ᪮����, ������ �����쭮
rem ����⢥���  -  ��  �ᮡ���� ����⭮ �� ����讬 ������⢥ 䠩��� ����让
rem ���⥫쭮�� �  ��  ᫠��� ��設�� � �������묨 ���⠬�. ����������� �롮�
rem �뫠   ᤥ����  �   �裡   �   ⥬,   ��   �   ��������   ������   lame
rem (�।������⥫쭮  ���  ��  3.98.1)  �뫠  �訡��, �ਢ����� �� ���筮�
rem ����஢���  �  �����⭮��  饫��    �   ����  䠩��.  ��  �ᯮ�짮�����
rem �஬����筮��  wav'�  �⮣� �� �ந�室��.
rem 0 - �� �ᯮ�짮����, 1 (��� �� ���㫥��� ���祭��) - �ᯮ�짮����.
rem �� 㬮�砭�� - 0

set TmpFile=0

rem DeleteSrc  -  㤠�����  ��室���  䠩���.  1  -  㤠����,  0  - �� 㤠����.
rem ��  㬮�砭��  -  0,  �⪫�祭�.  ����  �����⥫��! �祭� ����� �������
rem ���� ᮡ�ࠥ��� ������樨.

set DeleteSrc=0

rem Frequency,   Quality,   Bitrate   �  Downmix  �����  ��  ��������  -  ����
rem �ᯮ�짮���� ���祭�� �� 㬮�砭��.
rem TmpFile, DeleteSrc ������ ���� ������ �.

rem ----------------------------------------------------------------------------

rem �����  �����  ������  �������⥫�� ��樨 ��� lame � oggenc. ���ਬ��, ��
rem ���筮� ����஢���� �뢮� �� �࠭ lame � oggenc ��४�뢠����, ��-�� 祣�
rem ���������  ��䥪�  ࠧ�ࠦ��饣�  ���栭�� � ��������� ���� ����� �࠭�.
rem ��� ���࠭���� ����� �������� �뢮� ⮣� ��� ��㣮��, ���� ����� �ࠧ�, ���
rem 祣�  ��  �㦭�  ����᪠��  �  ०���  ���砭��  (silent  mode).  ��� �ࠧ�
rem ��  ४���������,  ��⮬�  ��  ⮣��  ��  �����,  ��  �ந�室��  - ����
rem ��  �����  ࠡ���  Tag,  �������  �������  ��������� �ந�室��� �� �㤥�.
rem �� 㬮�砭�� - ����.

rem set LameAddOpts=--silent
rem set VorbisAddOpts=-Q

set LameAddOpts=
set VorbisAddOpts=

rem ----------------------------------------------------------------------------
rem �����  ��⠭����������  �������⥫��  ��樨  ���  Tag; �᫨ �� ����� ��
rem ������ - ���� �� �ண���, �� 㬮�砭�� - ����.

rem ������� ����砭�� �⭮�⥫쭮 Tag.
rem Tag   �������   ⮫쪮  ⥪�⮢��  ���ଠ��,  ���⨭��  ��  ��७������.
rem � �������� ����� tag.exe �뢠�������� � �訡���  � �।�������� ᮮ����
rem �  ���  �  Microsoft ��᫥ ����⪨ ᪮��஢��� ⥣� �� 䠩���, ��ࠡ�⠭���
rem iTunes.  ��稭��,  ���  ��  �ᥬ�, ���� ���⠭����⭮� ࠧ��饭�� ���
rem ����஢����  ���⨭��  �������  (Cover  Art).  ������  � ��� �訡��, ���
rem ���������.
rem ��ਠ���  ��室�: ���஡����� ��।����� � �⪫����  �஡�����  ⥣�. ���
rem ��ᬮ��  ᯨ᪠  �������� � 䠩�� ⥣��: tag.exe file.mp3. � ��� ��砥
rem ���������,  �� ᡮ�� �� "Cover Art (front)". ��襭��: ��४���� ⥣ �����
rem ���祭���.
rem set Tags=-t "Cover Art (front)="
rem ���  ����������  �뢮�� ����� �ᯮ�짮���� ��������� --hidetags --hideinfo
rem (--hidenames  㦥  ����祭�)  -  ⮣�� �㤥� ��ᢥ稢����� ⮫쪮 ���������
rem �ணࠬ�� � ����஬ ���ᨨ � ᮮ�饭�� � �믮������ �����.

set Tags=

rem ----------------------------------------------------------------------------

rem ��⠭����  ��⥩  �  lame,  oggenc  �  tag.exe.  ��  㬮�砭�� �ਯ� �����
rem �������� �� ��� ����, �� �᫮���, �� �� �ᯮ��塞� 䠩�� ��������
rem ��室���� � ��� � ����� ��४�ਨ:
rem x:\bat_dir\converter.bat y:\mp3_dir
rem �᫨  ��  ���  �������  ᠬ  �ਯ�  �  ��४���  �  mp3-䠩����  ���
rem �ᯮ�짮����  ᢮� ���ᨨ �ணࠬ�, � �ய��� ����� ��� � lame, oggenc
rem �   tag.exe  (����  �������  ��  �  %PATH%)  �  ������������   �����
rem set PATH=%~dp0;%PATH%.  ���祬,  �������   �  %PATH%  �ਯ�  �४�᭮
rem ��뢠����  ��   ⥪�饩   �����ਨ, ���⮬�  �������  ⮫쪮  ��������
rem converter.bat � ��᫠������.

set LAME=lame.exe
set TAG=tag.exe
set VORBIS=oggenc2.exe

set PATH=%~dp0;%PATH%

rem ----------------------------------------------------------------------------
rem ��  �⮬  ��樨  ���䨣��஢����  �����稢�����,  ����� ���� �����⥫쭠�
rem ��⠭���� ��६����� � ᮡ�⢥��� �믮��塞�� ����.
rem ----------------------------------------------------------------------------



set ERR=�訡��: �� ��।����� ��६�����

if defined Frequency set Frequency=--resample %Frequency%

if defined Quality (set Quality=-q%Quality%) else if defined Bitrate set Quality=-b%Bitrate%

if not defined Downmix set Downmix=0

if not defined TmpFile set ERR=%ERR% "TmpFile"&goto ERRMSG

if not defined DeleteSrc set ERR=%ERR% "DeleteSrc"&goto ERRMSG

set VORBIS=%VORBIS% %Quality% %Frequency% %VorbisAddOpts%

set LAME=%LAME% %LameAddOpts% --decode

set Version=Alex Dragon's  MP3 to OGG converter v1.1

set HR=========================================

set P=%~f2

if not defined P (set P=.\*.mp3) else (
    if not exist "%P%\." ((set ERR=���ࠢ��쭮 ����� ����)&goto ERRMSG) else set P="%P%\*.mp3"
   )

for /F "delims=" %%F in ('dir /S /A-D /B /O:N %P%') do (

   echo.&echo %HR%&echo %Version%&echo %HR%&echo.

   if %Downmix%==1 (for /F "tokens=4 delims=, " %%M in ('%Tag% --hidetags --hidenames --simple "%%~dpnF.mp3" 2^>^&1^|^
                       findstr /L "Details:"') do (

                       if Mono==%%M set Downmix=

                       if Stereo==%%M set Downmix=--downmix
                      )
                   ) else set Downmix=

   if %TmpFile%==0 (%LAME% "%%~dpnF.mp3" - | %VORBIS% !Downmix! -o "%%~dpnF.ogg" -) else (

   %LAME% "%%~dpnF.mp3" -o "%%~dpnF.wav"

   %VORBIS% !Downmix! "%%~dpnF.wav" -o "%%~dpnF.ogg"

   del "%%~dpnF.wav"
  )

   %TAG% --simple --hidenames %Tags% -t "ENCODEDBY=ADMTOC v1.1" --fromfile "%%~dpnF.mp3" "%%~dpnF.ogg"

   if %DeleteSrc%==1 (if exist "%%~dpnF.ogg" del "%%~dpnF.mp3")

echo.

)

goto END


:ERRMSG

echo.
echo		%ERR%.

:END
echo on