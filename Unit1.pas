unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids;

type
  Tcoop = class(TForm)
    Image1: TImage;
    ball: TShape;
    Shape1: TShape;
    Shape2: TShape;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Label2: TLabel;
    Label1: TLabel;
    Timer2: TTimer;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  coop: Tcoop;
  PosX, PosY, VelX, VelY: single;
  vp: Integer;
  pp, pp1: Integer;


implementation

uses Unit2;

{$R *.dfm}

procedure Tcoop.SpeedButton1Click(Sender: TObject);
begin
mode.Visible:=True;
close;
end;

procedure Tcoop.FormCreate(Sender: TObject);
begin
vp:=30;
pp:=0;
pp1:=0;
randomize;
Coop.DoubleBuffered:= True;
end;

procedure Tcoop.Timer1Timer(Sender: TObject);
var
overlay: TRect;
begin
PosX:= PosX+VelX;   // рух
PosY:= PosY+VelY;   //     шарика

Ball.Left:= Round(PosX);
Ball.Top:= Round(PosY);


if PosY > 345 then
VelY:= -VelY;
if PosY < 106 then
VelY:= -VelY;


 if (ball.Left > 400) then
begin
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Ball.visible:=False;
SpeedButton2.Visible:=True;
pp1:= pp1 + 1;
Label1.Caption := IntToStr(pp1);

if pp1=10 then
begin
showmessage('Перемога гравця 1');
Mode.Visible:=true;
close;
end;
end;

if (ball.Left <= 65) then
begin
Timer1.Enabled:=False;
Timer2.Enabled:=False;
Ball.visible:=False;
SpeedButton2.Visible:=True;
pp:= pp + 1;
Label2.Caption := IntToStr(pp);

if pp=10 then
begin
showmessage('Перемога гравця 2');
Mode.Visible:=true;
close;
end;
end;

if InterSectRect(overlay, ball.BoundsRect, shape2.BoundsRect) then
begin
VelX:= -VelX-random(2);
VelY:= -VelY-random(2);
ball.Brush.Color:=clsilver;
end;
end;

procedure Tcoop.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  begin
  if key = Ord ('S') then Shape1.Top := Shape1.Top + vp;
  if key = Ord ('W') then Shape1.Top := Shape1.Top - vp;

  if key = VK_down then Shape2.Top := Shape2.Top + vp;
  if key = VK_up then Shape2.Top := Shape2.Top - vp;

  if Shape1.Top > 322 then Shape1.Top := 322
  else if Shape1.Top < 110 then Shape1.Top := 110;

  if Shape2.Top > 322 then Shape2.Top := 322
  else if Shape2.Top < 110 then Shape2.Top := 110;


  end;

procedure Tcoop.Timer2Timer(Sender: TObject);
var
overlay1: Trect;
begin

if InterSectRect(overlay1, ball.BoundsRect, shape1.BoundsRect) then
begin
VelX:= -VelX+random(2);
VelY:= -VelY+random(2);
ball.Brush.Color:=clgray;

 end;

end;

procedure Tcoop.SpeedButton2Click(Sender: TObject);
begin
  VelX := 2;
  VelY := random(2)+2;
  PosX:=232;
  PosY:=216;
  Shape1.Top:= 208;
  Shape2.Top:= 208;
  Timer1.Enabled := True;
 Timer2.Enabled := True;
 Ball.Visible := True;
 SpeedButton2.Visible := False;
 Ball.Enabled:=False;
end;


procedure Tcoop.SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
label3.visible:=True;
label3.caption:='Вихід';
end;

procedure Tcoop.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label3.visible:=false;
end;

procedure Tcoop.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label3.visible:=false;
end;

procedure Tcoop.FormClose(Sender: TObject; var Action: TCloseAction);
begin
label1.Caption:='0';
label2.Caption:='0';
pp:=0;
pp1:=0;
Shape1.Top:= 208;
Shape2.Top:= 208;
end;

end.                    
