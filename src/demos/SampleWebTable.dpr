program SampleWebTable;

uses
  Vcl.Forms,
  SampleWebTableUnit in 'SampleWebTableUnit.pas' {MainForm},
  Model.webTable.Interfaces in '..\Model.webTable.Interfaces.pas',
  Model.webTable in '..\Model.webTable.pas',
  Model.webTable.Data in '..\Model.webTable.Data.pas',
  Model.webTable.DataSet in '..\Model.webTable.DataSet.pas',
  Model.webTable.Utils in '..\Model.webTable.Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
