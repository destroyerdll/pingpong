unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Menus;

type
  Tmode = class(TForm)
    Image1: TImage;
    Image2: TImage;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mode: Tmode;

implementation

uses Unit1, Unit3, Unit4;

{$R *.dfm}

procedure Tmode.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
label2.Visible:= False;
end;

procedure Tmode.SpeedButton1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
label2.Visible:= True;
label2.Caption:= '����'#39'����';
end;

procedure Tmode.SpeedButton2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
label2.Visible:= True;
label2.Caption:= '2 ������';
end;

procedure Tmode.SpeedButton2Click(Sender: TObject);
begin
mode.Visible:=False;
coop.showmodal;
end;

procedure Tmode.SpeedButton1Click(Sender: TObject);
begin
mode.Visible:=False;
singlegame.showmodal;
end;

procedure Tmode.N2Click(Sender: TObject);
begin
pingpong.Visible:=True;
close;
end;

end.
