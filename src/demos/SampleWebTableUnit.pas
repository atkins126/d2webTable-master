unit SampleWebTableUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Model.webTable,
  Vcl.OleCtrls, SHDocVw,
  Model.webTable.Interfaces;

type
  TMainForm = class(TForm)
    ButtonGerar: TButton;
    Memo1: TMemo;
    procedure ButtonGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ButtonGerarClick(Sender: TObject);
var
  LArquivoHtml: TStringList;
begin
  Memo1.Clear;
  Memo1.Lines.Add(TModelWebTable.New
                    .AddwebTableDataSet('Nome')
                      .AddwebTableData('Rafael')
                      .AddwebTableData('Davi')
                      .AddwebTableData('Denise')
                    .&End
                    .AddwebTableDataSet('Profissão')
                      .AddwebTableData('Analista de sistema')
                      .AddwebTableData('Estudante')
                      .AddwebTableData('Professora')
                    .&End
                    .AddwebTableDataSet('País')
                      .AddwebTableData('Brasil', wcWarning, wcDark, '1', '1', stSuperscript)
                      .AddwebTableData('EUA', wcDanger, wcWarning, '1', '1', stSubscript)
                      .AddwebTableData('Japão', wcSuccess, wcDark, '1', '1', stInserted)
                    .&End
                    .AddwebTableDataSet('Age')
                      .AddwebTableData('45')
                      .AddwebTableData('42')
                      .AddwebTableData('19')
                    .&End
                    .AddwebTableDataSet('Dt.Contrato')
                      .AddwebTableData('2009-05-09')
                      .AddwebTableData('2024-01-01')
                      .AddwebTableData('2006-01-01')
                    .&End
                    .AddwebTableDataSet('Salary')
                      .AddwebTableData('R$3280,25', wcDanger, wcLight, '0.8', '1', stItalic)
                      .AddwebTableData('R$250,00', wcInfo, wcNone, '1', '1', stSmaller)
                      .AddwebTableData('R$2000,00', wcDanger, wcLight, '0.8', '1', stStrong)
                    .&End
                    .Generate);

  LArquivoHtml := TStringList.Create;
  try
    LArquivoHtml.Add('<html>');
    LArquivoHtml.Add('<head>');
    LArquivoHtml.Add('<link id="pagestyle" href="https://cdn.datatables.net/2.1.4/css/dataTables.dataTables.css" rel="stylesheet" />');
    LArquivoHtml.Add('</head>');
    LArquivoHtml.Add('<body>');
    LArquivoHtml.Add(Memo1.Lines.Text);
    LArquivoHtml.Add('</body>');
    LArquivoHtml.Add('</html>');
    LArquivoHtml.SaveToFile('c:\temp\NovaTabela.html');
  finally
    LArquivoHtml.Free;
  end;
end;

end.
