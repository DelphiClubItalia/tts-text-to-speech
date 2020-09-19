program tts_test_sapi54;

uses
  Vcl.Forms,
  uMainform in 'uMainform.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainform, Mainform);
  Application.Run;
end.
