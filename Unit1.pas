unit Unit1;

interface

uses
  Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, Menus, SysUtils,
  INIfiles;

type
  TForm1 = class(TForm)
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    shp6: TShape;
    shp7: TShape;
    shp8: TShape;
    shp9: TShape;
    shp10: TShape;
    shp11: TShape;
    shp12: TShape;
    shp13: TShape;
    shp14: TShape;
    shp15: TShape;
    shp16: TShape;
    shp17: TShape;
    shp18: TShape;
    shp19: TShape;
    shp20: TShape;
    shp21: TShape;
    shp22: TShape;
    shp23: TShape;
    shp24: TShape;
    shp25: TShape;
    mmMenu: TMainMenu;
    mniMenu: TMenuItem;
    mniLevel1: TMenuItem;
    mniLevel2: TMenuItem;
    mniLevel3: TMenuItem;
    mniLevel4: TMenuItem;
    mniLevel5: TMenuItem;
    mniRandom: TMenuItem;
    mniClicks: TMenuItem;
    mniHelp: TMenuItem;
    mniColours: TMenuItem;
    mniColourOn: TMenuItem;
    mniColourOff: TMenuItem;
    mniN1: TMenuItem;
    mniExit: TMenuItem;
    procedure CheckWin;
    procedure ClearAll;
    procedure Invert(Index: Integer);
    procedure Press(Index: Integer);
    procedure UserPress(Index: Integer);
    procedure shp1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp5MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp8MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp9MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp10MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp11MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp12MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp13MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp14MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp15MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp17MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp18MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp19MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp20MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp21MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp22MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp23MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp24MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shp25MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure mniLevel1Click(Sender: TObject);
    procedure mniLevel2Click(Sender: TObject);
    procedure mniLevel3Click(Sender: TObject);
    procedure mniLevel4Click(Sender: TObject);
    procedure mniLevel5Click(Sender: TObject);
    procedure mniRandomClick(Sender: TObject);
    procedure mniHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniColourOnClick(Sender: TObject);
    procedure mniColourOffClick(Sender: TObject);
    procedure mniExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MaxRandom = 25;

var
  Form1: TForm1;
  Lights: array[0..24] of Boolean;
  WinGame: Boolean;
  Clicks, RandomDefault: Integer;
  ColourOn, ColourOff: Int64;

implementation

{$R *.dfm}

procedure TForm1.CheckWin;
var
  i: Integer;
begin
  WinGame := True;
  for i := 0 to 24 do
    if Lights[i] then
    begin
      WinGame := False;
      Break;
    end;
  Inc(Clicks);
  mniClicks.Caption := ' Clicks: ' + IntToStr(Clicks);
  if WinGame then
    ShowMessage('You win in ' + IntToStr(Clicks) + ' clicks!');
end;

procedure TForm1.ClearAll;
var
  i: Integer;
  component: TComponent;
begin
  for i := 0 to 24 do
    Lights[i] := False;
  for component in Form1 do
    if (component is TShape) then
      TShape(component).Brush.Color := ColourOff;
  WinGame := False;
  Clicks := 0;
  mniClicks.Caption := 'Clicks: 0';
end;

procedure TForm1.Invert(Index: Integer);
var
  LightColour, i: Integer;
  component: TComponent;
begin
  Lights[Index] := not Lights[Index];
  if Lights[Index] then
    LightColour := ColourOn
  else
    LightColour := ColourOff;
  i := 0;
  for component in Form1 do  //if (component is TShape) then //A bit dodgy to comment, but we'll never get anything other than a TShape before we break!
  begin
    if (Index = i) then
    begin
      TShape(component).Brush.Color := LightColour;
      Break;
    end;
    Inc(i);
  end;
end;

procedure TForm1.Press(Index: Integer);
begin
  Invert(Index);
  if Index > 4 then
    Invert(Index - 5);
  if Index < 20 then
    Invert(Index + 5);
  if (Index mod 5) <> 0 then
    Invert(Index - 1);
  if (Index mod 5) <> 4 then
    Invert(Index + 1);
end;

procedure TForm1.UserPress(Index: Integer);
begin
  if WinGame then
    Exit;
  Press(Index);
  CheckWin;
end;

procedure TForm1.mniColourOffClick(Sender: TObject);
var
  Dlg: TColorDialog;
begin
  Dlg := TColorDialog.Create(Form1);
  if Dlg.Execute then
  begin
    ColourOff := Dlg.Color;
    ShowMessage('You will need to start a new game for this change to take effect.');
  end;
end;

procedure TForm1.mniColourOnClick(Sender: TObject);
var
  Dlg: TColorDialog;
begin
  Dlg := TColorDialog.Create(Form1);
  if Dlg.Execute then
  begin
    ColourOn := Dlg.Color;
    ShowMessage('You will need to start a new game for this change to take effect.');
  end;
end;

procedure TForm1.mniExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.mniHelpClick(Sender: TObject);
begin
  ShowMessage('Rule: switch off all lights to win!' + sLineBreak + sLineBreak + 'Bottom row' + #9 + 'Top row' + sLineBreak + 'O---O' + #9 + #9 + 'OO---' + sLineBreak + '-O-O-' + #9 + #9 + 'O--O-' + sLineBreak + 'OOO--' + #9 + #9 + '-O---' + sLineBreak + '--OOO' + #9 + #9 + '---O-' + sLineBreak + 'O-OO-' + #9 + #9 + '----O' + sLineBreak + '-OO-O' + #9 + #9 + 'O----' + sLineBreak + 'OO-OO' + #9 + #9 + '--O-- ');
end;

procedure TForm1.mniLevel1Click(Sender: TObject);
begin
  ClearAll;
  Invert(10);
  Invert(12);
  Invert(14);
end;

procedure TForm1.mniLevel2Click(Sender: TObject);
begin
  ClearAll;
  Invert(12);
  Invert(16);
  Invert(17);
  Invert(18);
  Invert(20);
  Invert(21);
  Invert(22);
  Invert(23);
  Invert(24);
end;

procedure TForm1.mniLevel3Click(Sender: TObject);
begin
  ClearAll;
  Invert(4);
  Invert(6);
  Invert(7);
  Invert(8);
  Invert(11);
  Invert(12);
  Invert(13);
  Invert(16);
  Invert(17);
  Invert(18);
  Invert(24);
end;

procedure TForm1.mniLevel4Click(Sender: TObject);
begin
  ClearAll;
  Invert(2);
  Invert(6);
  Invert(8);
  Invert(10);
  Invert(12);
  Invert(14);
  Invert(16);
  Invert(18);
  Invert(22);
end;

procedure TForm1.mniLevel5Click(Sender: TObject);
begin
  ClearAll;
  Invert(11);
  Invert(16);
  Invert(21);
end;

procedure TForm1.mniRandomClick(Sender: TObject);
var
  i: Integer;
  Choice: string;
begin
  if not InputQuery(Application.Title, 'How many clicks (1-' + IntToStr(MaxRandom) + ', blank: ' + IntToStr(RandomDefault) + ')?', Choice) then
    Exit;
  if Choice <> '' then
    RandomDefault := strtoint(Choice) + 0;
  if (RandomDefault < 1) or (RandomDefault > MaxRandom) then
    RandomDefault := MaxRandom;
  ClearAll;
  Randomize;
  for i := 1 to RandomDefault do
    Press(Random(25));
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  myINI: TINIFile;
begin
  //Save settings to INI file
  myINI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'SliLights.ini');
  myINI.WriteInteger('Settings', 'ColourOn', ColourOn);
  myINI.WriteInteger('Settings', 'ColourOff', ColourOff);
  myINI.WriteInteger('Settings', 'RandomDefault', RandomDefault);
  myINI.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  myINI: TINIFile;
begin
  //Initialise options from INI file
  myINI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'SliLights.ini');
  //Read settings from INI file
  ColourOn := myINI.ReadInteger('Settings', 'ColourOn', 255);
  ColourOff := myINI.ReadInteger('Settings', 'ColourOff', 128);
  RandomDefault := myINI.ReadInteger('Settings', 'RandomDefault', 6);
  if RandomDefault > MaxRandom then
    RandomDefault := MaxRandom;
  myINI.Free;
  ClearAll;
  WinGame := True;
  Form1.ClientWidth := 5 * shp1.Width;
  Form1.ClientHeight := 5 * shp1.Height;
end;

procedure TForm1.shp1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(0);
end;

procedure TForm1.shp2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(1);
end;

procedure TForm1.shp3MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(2);
end;

procedure TForm1.shp4MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(3);
end;

procedure TForm1.shp5MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(4);
end;

procedure TForm1.shp6MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(5);
end;

procedure TForm1.shp7MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(6);
end;

procedure TForm1.shp8MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(7);
end;

procedure TForm1.shp9MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(8);
end;

procedure TForm1.shp10MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(9);
end;

procedure TForm1.shp11MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(10);
end;

procedure TForm1.shp12MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(11);
end;

procedure TForm1.shp13MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(12);
end;

procedure TForm1.shp14MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(13);
end;

procedure TForm1.shp15MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(14);
end;

procedure TForm1.shp16MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(15);
end;

procedure TForm1.shp17MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(16);
end;

procedure TForm1.shp18MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(17);
end;

procedure TForm1.shp19MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(18);
end;

procedure TForm1.shp20MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(19);
end;

procedure TForm1.shp21MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(20);
end;

procedure TForm1.shp22MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(21);
end;

procedure TForm1.shp23MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(22);
end;

procedure TForm1.shp24MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(23);
end;

procedure TForm1.shp25MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UserPress(24);
end;

end.

