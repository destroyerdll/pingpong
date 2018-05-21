unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls;

type
  Tpingpong = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pingpong: Tpingpong;

implementation

uses Unit2, Unit5;

{$R *.dfm}

procedure Tpingpong.N3Click(Sender: TObject);
begin
close;
end;

procedure Tpingpong.N4Click(Sender: TObject);
begin

mode.showmodal;
end;

procedure Tpingpong.N2Click(Sender: TObject);
begin
about.showmodal;
end;

end.
