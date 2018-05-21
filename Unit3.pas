unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  Tsinglegame = class(TForm)
    Image1: TImage;
    ball: TShape;
    Shape1: TShape;
    Shape2: TShape;
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Timer2: TTimer;
    Timer3: TTimer;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var

  singlegame: Tsinglegame;
  PosX, PosY, VelX, VelY: single;
  vp,sp: integer;
  pp, pp1: integer;

implementation

uses Unit2;

{$R *.dfm}

procedure Tsinglegame.FormCreate(Sender: TObject);
begin
pp:=0;
pp1:=0;
vp:=30;
sp:=8;
PosX:=280;
PosY:=192;
singlegame.DoubleBuffered:=True;
randomize;
end;

procedure Tsinglegame.Timer1Timer(Sender: TObject);
var
overlay: TRect;
begin
PosX:= PosX+VelX;
PosY:= PosY+VelY;

Ball.Left:= Round(PosX);
Ball.Top:= Round(PosY);


if PosY > 296 then
VelY:= -VelY;

if PosY < 94 then
VelY:= -VelY;

if (ball.Left > 470) then
begin
timer1.Enabled:= False;
Timer2.Enabled:=False;
Timer3.Enabled:=False;
Ball.visible:=False;
Speedbutton1.Visible:= True;
pp1:= pp1 + 1;
Label1.Caption := IntToStr(pp1);
if pp1=10 then
begin
showmessage('Перемога гравця 1');
Mode.Visible:=true;
close;
end;
end;


if (ball.Left <= 94) then
begin
timer1.Enabled:= False;
Timer2.Enabled:=False;
Timer3.Enabled:=False;
Ball.visible:=False;
Speedbutton1.Visible:= True;
pp:= pp + 1;
Label2.Caption := IntToStr(pp);
if pp=10 then
begin
showmessage('Перемога гравця 2');
Mode.Visible:=true;
close;
end;
end;
if InterSectRect(overlay, shape2.BoundsRect, ball.BoundsRect) then
begin
VelX:= -VelX - random(2);
VelY:= -VelY - random(2);
ball.Brush.Color:=clTeal;


end;
end;
procedure Tsinglegame.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if key = VK_down then Shape2.Top := Shape2.Top + vp;
  if key = VK_up then Shape2.Top := Shape2.Top - vp;

  if Shape2.Top > 264 then Shape2.Top := 264
  else if Shape2.Top < 93 then Shape2.Top := 93;
end;

procedure Tsinglegame.Timer2Timer(Sender: TObject);

begin
if Shape1.Top > ClientHeight - Shape1.Height - 160 then
Shape1.Top:= Shape1.Top
else
begin
if ball.Top > shape1.Top then
Shape1.top:= Shape1.Top + sp;
end;

if shape1.Top < clientHeight - shape1.height - 320 then
Shape1.Top:= Shape1.Top 
else
begin
if ball.top < shape1.Top then
shape1.Top:= shape1.Top - sp;
end;
end;


procedure Tsinglegame.Timer3Timer(Sender: TObject);
var overlay: trect;
begin
if InterSectRect(overlay, shape1.BoundsRect, ball.BoundsRect) then
begin
VelX:= -VelX + random(2);
VelY:= -VelY + random(2);
ball.Brush.Color:=clolive;
end;
end;
procedure Tsinglegame.SpeedButton1Click(Sender: TObject);
begin
  VelX := 2;
  VelY := random(2)+2;
  PosX:=280;
  PosY:=192;
  shape1.Top:=176;
  shape2.Top:=176;
  Timer1.Enabled:=True;
  Timer2.Enabled:=True;
  Timer3.Enabled:=True;
  Ball.Visible := True;
  SpeedButton1.Visible:= False;
  Ball.Enabled:=False;
end;

procedure Tsinglegame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
label1.Caption:='0';
label2.Caption:='0';
pp:=0;
pp1:=0;
shape1.Top:=176;
shape2.Top:=176;
end;



procedure Tsinglegame.SpeedButton2Click(Sender: TObject);
begin
mode.Visible:=True;
close;
end;

procedure Tsinglegame.SpeedButton2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
Label3.Caption:='Вихід';

end;


procedure Tsinglegame.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Label3.Caption:='';
end;

procedure Tsinglegame.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
Label3.Caption:='';
end;

end.
