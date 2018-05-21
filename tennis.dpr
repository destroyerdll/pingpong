program tennis;

uses
  Forms,
  Unit1 in 'Unit1.pas' {coop},
  Unit2 in 'Unit2.pas' {mode},
  Unit3 in 'Unit3.pas' {singlegame},
  Unit4 in 'Unit4.pas' {pingpong},
  Unit5 in 'Unit5.pas' {about};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RETRO PING-PONG';
  Application.CreateForm(Tpingpong, pingpong);
  Application.CreateForm(Tmode, mode);
  Application.CreateForm(Tcoop, coop);
  Application.CreateForm(Tsinglegame, singlegame);
  Application.CreateForm(Tabout, about);
  Application.Run;
end.
