'  Runs bat file without visible cmd prompt 
Set oShell = CreateObject ("Wscript.Shell") 
Dim strArgs
strArgs = "cmd /c SwitchSoundSource.bat"
oShell.Run strArgs, 0, false