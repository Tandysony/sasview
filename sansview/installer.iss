
; Script generated by the Inno Setup Script Wizard

; and local_config.py located in this directory.
 ; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
[Setup]

ChangesAssociations=yes
AppName=SansView
AppVerName=SansView-2.0.1
AppPublisher=(c) 2009 - 2011, University of Tennessee
AppPublisherURL=http://danse.chem.utk.edu
AppSupportURL=http://danse.chem.utk.edu
AppUpdatesURL=http://danse.chem.utk.edu 
ChangesEnvironment=true 
DefaultDirName={pf}/SansView
DefaultGroupName=DANSE/SansView-2.0.1
DisableProgramGroupPage=yes
LicenseFile=license.txt
OutputBaseFilename=setupSansView
SetupIconFile=images\ball.ico
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none


[Registry]
Root: HKCR;	Subkey: ".xml/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".txt/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".asc/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".dat/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".tif/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".abs/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".d1d/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR;	Subkey: ".sans/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCR; Subkey: "applications\SansView.exe\shell\open\command";	ValueType: string; ValueName: "";	ValueData: """{app}\SansView.exe""  ""%1"""; 	 Flags: uninsdeletevalue noerror
Root: HKCU;	Subkey: "Software\Classes/.xml/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.txt/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.asc/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.dat/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.tif/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.abs/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.d1d/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU;	Subkey: "Software\Classes/.sans/OpenWithList\SansView.exe";	 Flags: uninsdeletekey noerror
Root: HKCU; Subkey: "Software/Classes/applications\SansView.exe\shell\open\command";	ValueType: string; ValueName: "";	ValueData: """{app}\SansView.exe""  ""%1"""; 	 Flags: uninsdeletevalue noerror
Root: HKCR;	Subkey: ".svs";	ValueType: string;	ValueName: "";	ValueData: "{app}\SansView.exe";	 Flags: uninsdeletevalue  noerror
Root: HKCR;	Subkey: ".fitv";	ValueType: string;	ValueName: "";	ValueData: "{app}\SansView.exe";	 Flags: uninsdeletevalue  noerror
Root: HKCR;	Subkey: ".inv";	ValueType: string;	ValueName: "";	ValueData: "{app}\SansView.exe";	 Flags: uninsdeletevalue  noerror
Root: HKCR;	Subkey: ".prv";	ValueType: string;	ValueName: "";	ValueData: "{app}\SansView.exe";	 Flags: uninsdeletevalue  noerror
Root: HKCR; Subkey: "{app}\SansView.exe";	ValueType: string; ValueName: "";	ValueData: "{app}\SansView File";	 Flags: uninsdeletekey  noerror 	
Root: HKCR; Subkey: "{app}\SansView.exe\shell\open\command";	ValueType: string; ValueName: "";	ValueData: """{app}\SansView.exe""  ""%1""";	 Flags: uninsdeletevalue noerror 	
Root: HKCR; Subkey: "{app}\images\ball.ico";	ValueType: string; ValueName: "";	ValueData: "{app}\SansView.exe,0";	 Flags: uninsdeletevalue noerror 	
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment";	ValueType: expandsz; ValueName: "SANSVIEWPATH";	ValueData: "{app}";	 Flags: uninsdeletevalue noerror
; Write to PATH (below) is disabled; need more tests
;Root: HKCU; Subkey: "Environment";	ValueType: expandsz; ValueName: "PATH";	ValueData: "%SANSVIEWPATH%;{olddata}";	 Check: NeedsAddPath()


[Languages]
Name: "english";	MessagesFile: "compiler:Default.isl"


[Tasks]
Name: "desktopicon";	Description: "{cm:CreateDesktopIcon}";	GroupDescription: "{cm:AdditionalIcons}";	Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}";	GroupDescription: "{cm:AdditionalIcons}";


[Files]
Source: "dist\SansView.exe";	DestDir: "{app}";	Flags: ignoreversion
Source: "dist\*";	DestDir: "{app}";	Flags: ignoreversion recursesubdirs createallsubdirs
Source: "dist\plugin_models\*";	DestDir: "{userappdata}\..\.sansview\plugin_models";	Flags: recursesubdirs createallsubdirs
Source: "dist\config\custom_config.py";	DestDir: "{userappdata}\..\.sansview\config";	Flags: recursesubdirs createallsubdirs
;	NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\SansView";	Filename: "{app}\SansView.exe";	WorkingDir: "{app}"; IconFilename: "{app}\images\ball.ico" 
Name: "{group}\{cm:UninstallProgram, SansView}";	 Filename: "{uninstallexe}" 
Name: "{commondesktop}\SansView-2.0.1";	Filename: "{app}\SansView.exe";	Tasks: desktopicon; WorkingDir: "{app}" ; IconFilename: "{app}\images\ball.ico" 
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\SansView-2.0.1";	Filename: "{app}\SansView.exe";	Tasks: quicklaunchicon; WorkingDir: "{app}"; IconFilename: "{app}\images\ball.ico" 


[Run]
Filename: "{app}\SansView.exe";	Description: "{cm:LaunchProgram, SansView}";	Flags: nowait postinstall skipifsilent
; Install the Microsoft C++ DLL redistributable package if it is provided and the DLLs are not present on the target system.
; Note that the redistributable package is included if the app was built using Python 2.6 or 2.7, but not with 2.5.
; Parameter options:
; - for silent install use: "/q"
; - for silent install with progress bar use: "/qb"
; - for silent install with progress bar but disallow cancellation of operation use: "/qb!"
; Note that we do not use the postinstall flag as this would display a checkbox and thus require the user to decide what to do.
;Filename: "{app}\vcredist_x86.exe"; Parameters: "/qb!"; WorkingDir: "{tmp}"; StatusMsg: "Installing Microsoft Visual C++ 2008 Redistributable Package ..."; Check: InstallVC90CRT(); Flags: skipifdoesntexist waituntilterminated


[Dirs]
Name: "{app}\";	Permissions: everyone-modify	


[Code]
function InstallVC90CRT(): Boolean;
begin
    Result := not DirExists('C:\WINDOWS\WinSxS\x86_Microsoft.VC90.CRT_1fc8b3b9a1e18e3b_9.0.21022.8_x-ww_d08d0375');
end;

function NeedsAddPath(): boolean;
var
  oldpath: string;
  newpath: string;
  pathArr:    TArrayOfString;
  i:        Integer;
begin
  RegQueryStringValue(HKEY_CURRENT_USER,'Environment','PATH', oldpath)
  oldpath := oldpath + ';';
  newpath := '%SANSVIEWPATH%';
  i := 0;
  while (Pos(';', oldpath) > 0) do begin
    SetArrayLength(pathArr, i+1);
    pathArr[i] := Copy(oldpath, 0, Pos(';', oldpath)-1);
    oldpath := Copy(oldpath, Pos(';', oldpath)+1, Length(oldpath));
    i := i + 1;
    // Check if current directory matches app dir
    if newpath = pathArr[i-1] 
    then begin
      Result := False;
      exit;
    end;
  end;
  Result := True;
end;


[UninstallDelete]
; Delete directories and files that are dynamically created by the application (i.e. at runtime).
Type: filesandordirs; Name: "{app}\.matplotlib"
Type: files; Name: "{app}\*.*"
; The following is a workaround for the case where the application is installed and uninstalled but the
;{app} directory is not deleted because it has user files.  Then the application is installed into the
; existing directory, user files are deleted, and the application is un-installed again.  Without the
; directive below, {app} will not be deleted because Inno Setup did not create it during the previous
; installation.
Type: dirifempty; Name: "{app}"

