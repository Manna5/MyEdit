Program MyEdit;
Uses SysUtils;
Var EditFile:Text;
Var EditFilename:String;
Var EditLine:String;
Var EndEditing:Boolean;
Begin
 If ParamCount>0 Then EditFilename:=ParamStr(1) Else
 Begin
  Write('Enter filename: ');
  ReadLn(EditFilename);
 End;
 Assign(EditFile,EditFilename);
 If FileExists(EditFilename) Then
 Begin
  Reset(EditFile);
  Repeat
   ReadLn(EditFile,EditLine);
   Write('*');
   WriteLn(EditLine);
  Until EoF(EditFile);
  Append(EditFile);
 End
 Else
 Begin
  Rewrite(EditFile);
 End;
 EndEditing:=False;
 While Not EndEditing Do
 Begin
  Write('*');
  ReadLn(EditLine);
  If EditLine='/quit' Then EndEditing:=True Else
  Begin
   If EditLine='/clear' Then Rewrite(EditFile) Else WriteLn(EditFile,EditLine);
  End;
 End;
 Close(EditFile);
End.
