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
    mniRestart: TMenuItem;
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
    procedure RestartLevel;
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
    procedure mniRandomClick(Sender: TObject);
    procedure mniHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniColourOnClick(Sender: TObject);
    procedure mniColourOffClick(Sender: TObject);
    procedure mniExitClick(Sender: TObject);
    procedure mniRestartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Level = array[0..4] of Integer;

  Levels = array[0..99] of Level;

var
  Form1: TForm1;
  Lights: array[0..24] of Boolean;
  CurrentLevel: Integer;
  WinGame, IsRandom: Boolean;
  Clicks, RandomDefault: Integer;
  ColourOn, ColourOff: Int64;

const
  MaxRandom = 25;
  TheseLevels: Levels = ((0, 0, 21, 0, 0), (21, 21, 0, 21, 21), (10, 27, 27, 27, 10), (0, 27, 0, 17, 27), (15, 23, 23, 24, 27), (0, 0, 21, 21, 14), (15, 17, 17, 17, 15), (0, 4, 10, 21, 10), (10, 31, 14, 26, 7), (14, 14, 14, 0, 0), (21, 21, 21, 21, 14), (31, 10, 27, 14, 10), (8, 20, 10, 5, 2), (0, 0, 2, 2, 2), (0, 2, 0, 2, 0), (1, 1, 1, 1, 31), (0, 0, 4, 14, 31), (4, 10, 21, 10, 4), (21, 0, 21, 0, 21), (0, 0, 17, 0, 0), (30, 2, 14, 2, 2), (14, 17, 17, 17, 14), (0, 0, 28, 12, 4), (0, 0, 17, 31, 18), (1, 3, 7,
    15, 30), (17, 17, 31, 17, 17), (4, 14, 4, 4, 4), (0, 0, 28, 28, 28), (0, 2, 0, 0, 0), (0, 0, 4, 0, 0), (17, 19, 21, 25, 17), (31, 8, 4, 2, 31), (8, 8, 21, 17, 25), (20, 17, 17, 22, 30), (24, 10, 17, 21, 0), (4, 10, 17, 31, 17), (0, 14, 14, 14, 0), (21, 10, 21, 10, 21), (10, 1, 3, 12, 10), (0, 0, 10, 0, 0), (17, 10, 4, 4, 4), (7, 9, 7, 9, 7), (17, 11, 7, 2, 14), (0, 27, 31, 4, 14), (14, 5, 28, 15, 21), (4, 14, 31, 14, 4), (4, 31, 5, 18, 16), (0, 17, 4, 17, 0), (17, 10, 4, 10, 17), (31, 31, 31, 31, 31), (27,
    0, 27, 0, 27), (31, 4, 0, 4, 31), (31, 10, 4, 10, 31), (10, 17, 0, 27, 17), (4, 6, 27, 12, 4), (10, 31, 21, 31, 10), (21, 17, 27, 17, 21), (0, 0, 14, 2, 0), (16, 8, 4, 6, 5), (0, 21, 17, 21, 17), (31, 14, 14, 14, 31), (17, 10, 0, 10, 17), (14, 10, 14, 8, 14), (15, 9, 15, 7, 9), (21, 21, 21, 21, 14), (14, 2, 14, 8, 14), (31, 17, 21, 17, 31), (21, 0, 21, 0, 21), (10, 21, 14, 21, 10), (21, 0, 0, 0, 21), (31, 29, 27, 23, 31), (31, 4, 31, 17, 17), (27, 10, 27, 10, 27), (4, 10, 31, 17, 31), (17, 27, 21, 17,
    17), (31, 21, 31, 21, 31), (14, 4, 4, 4, 14), (14, 10, 31, 14, 27), (0, 0, 4, 0, 0), (17, 0, 4, 0, 17), (27, 27, 0, 27, 27), (10, 0, 17, 14, 4), (21, 14, 27, 14, 21), (17, 19, 21, 25, 17), (21, 21, 27, 21, 21), (4, 4, 14, 21, 21), (21, 21, 21, 21, 31), (0, 14, 14, 14, 0), (4, 10, 17, 31, 17), (21, 10, 21, 10, 21), (17, 14, 10, 14, 17), (4, 10, 17, 10, 4), (21, 0, 10, 0, 21), (10, 31, 10, 31, 10), (31, 21, 31, 29, 31), (17, 10, 4, 10, 17), (31, 4, 31, 4, 31), (31, 14, 4, 14, 31), (4, 21, 31, 21, 4), (31, 31, 31, 31, 31));

implementation

{$R *.dfm}

function Pow2(Power: Integer): Integer; //This works fine
begin
  Result := 1 shl Power;
end;

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
  begin
    if IsRandom then
    begin
      ShowMessage('You win in ' + IntToStr(Clicks) + ' clicks!');
      RestartLevel();
      Exit;
    end;
    if CurrentLevel < 99 then
    begin
      ShowMessage('You win in ' + IntToStr(Clicks) + ' clicks!');
      Inc(CurrentLevel);
      RestartLevel();
    end
    else
      ShowMessage('You have completed the last level in ' + IntToStr(Clicks) + ' clicks!');
  end;
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

procedure TForm1.RestartLevel;
var
  Row, Col, ThisRow: Integer;
begin
  ClearAll();
  for Row := 0 to 4 do
  begin
    ThisRow := TheseLevels[CurrentLevel][Row];
    for Col := 0 to 4 do
    begin
      if (ThisRow and Pow2(Col)) = Pow2(Col) then
        Invert(Row * 5 + Col);
    end;
  end;
  Form1.Caption := 'SliLights, Level ' + IntToStr(CurrentLevel + 1);
  IsRandom := False;
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
  Form1.Caption := 'SliLights, random level';
  IsRandom := True;
end;

procedure TForm1.mniRestartClick(Sender: TObject);
begin
  RestartLevel();
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
  myINI.WriteInteger('Settings', 'CurrentLevel', CurrentLevel);
  myINI.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  myINI: TINIFile;
begin
  //Initialise options from INI file
  myINI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'SliLights.ini');
  //Read settings from INI file
  ColourOn := myINI.ReadInteger('Settings', 'ColourOn', $00FF80FF);
  ColourOff := myINI.ReadInteger('Settings', 'ColourOff', $00C08080);
  RandomDefault := myINI.ReadInteger('Settings', 'RandomDefault', 6);
  CurrentLevel := myINI.ReadInteger('Settings', 'CurrentLevel', 0);
  if RandomDefault > MaxRandom then
    RandomDefault := MaxRandom;
  myINI.Free;
  ClearAll;
  WinGame := True;
  Form1.ClientWidth := 5 * shp1.Width;
  Form1.ClientHeight := 5 * shp1.Height;
  RestartLevel();
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

