unit Model.webTable;

interface

uses
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  Model.webTable.DataSet,
  Model.webTable.Interfaces;

type
  TModelWebTable = class(TInterfacedObject, IModelWebTable)
  strict private
    FwebTableDataSets: TInterfaceList;

    function GenerateBodyHtml: string;
    function GenerateFootHtml: string;
    function GenerateHeaderHtml: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IModelWebTable;

    function AddwebTableDataSet(AColumnName: string): IModelWebTableDataSet;
    function Generate(AGenerateFoot: Boolean = True): string;
  end;

implementation

{ TModelWebTable }

function TModelWebTable.AddwebTableDataSet(
  AColumnName: string): IModelWebTableDataSet;
begin
  Result := TModelWebTableDataSet.New(Self, AColumnName);

  FwebTableDataSets.Add(Result);
end;

constructor TModelWebTable.Create;
begin
  inherited Create;

  FwebTableDataSets := TInterfaceList.Create;
end;

destructor TModelWebTable.Destroy;
begin
  FwebTableDataSets.Free;

  inherited;
end;

function TModelWebTable.Generate(AGenerateFoot: Boolean): string;
var
  LWebTableID: string;
  LRetornoHtmlStr: string;
begin
  LWebTableID := IntToStr(Random(MaxInt));

  LRetornoHtmlStr := Format('<script src="https://code.jquery.com/jquery-3.7.1.js"></script> ' +
                            '<script src="https://cdn.datatables.net/2.1.4/js/dataTables.js"></script> '+
                            '<table id="table%s" class="display" style="width:%s"> ',
                            [LWebTableID, '100%']);

  LRetornoHtmlStr := LRetornoHtmlStr + GenerateHeaderHtml;
  LRetornoHtmlStr := LRetornoHtmlStr + GenerateBodyHtml;

  if AGenerateFoot then
    LRetornoHtmlStr := LRetornoHtmlStr + GenerateFootHtml;

  LRetornoHtmlStr := LRetornoHtmlStr +
                     Format('</table> ' +
                            '<script> '+
                            '  new DataTable("#table%s", { '+
                            '    layout: { '+
                            '      bottomEnd: { '+
                            '        paging: { '+
                            '          firstLast: false '+
                            '        } '+
                            '      } '+
                            '    }, '+
                            '    scrollY: true, '+
                            '    language: { '+
                            '      "decimal": ",", '+
                            '      "emptyTable": "Nenhum registro encontrado", '+
                            '      "info": "_START_ - _END_  de _TOTAL_", '+
                            '      "infoEmpty": "Showing 0 to 0 de of entries", '+
                            '      "infoFiltered": "(filtered from _MAX_ total entries)", '+
                            '      "infoPostFix": "", '+
                            '      "thousands": ".", '+
                            '      "lengthMenu": "Mostrar _MENU_  registros por página", '+
                            '      "loadingRecords": "Loading...", '+
                            '      "processing": "", '+
                            '      "search": "Procurar: ", '+
                            '      "zeroRecords": "Nenhum registro encontrado", '+
                            '      "paginate": { '+
                            '        "first": "Primeiro", '+
                            '        "last": "Último", '+
                            '        "next": "Próximo", '+
                            '        "previous": "Anterior" '+
                            '      }, '+
                            '      "aria": { '+
                            '         "orderable":  "Ordenar por essa coluna", '+
                            '          "orderableReverse": "Inverter ordenação da coluna" '+
                            '      } '+
                            '    } '+
                            '  }); '+
                            '</script>',
                           [LWebTableID]);

  result := LRetornoHtmlStr;
end;

function TModelWebTable.GenerateBodyHtml: string;
var
  LRecordCount: Integer;
  LRetornoHtmlStr: string;
  LWebTableSet: IModelWebTableDataSet;
begin
  LRetornoHtmlStr := '<tbody> ';

  if FwebTableDataSets.Count > 0 then
  begin
    LRecordCount := (FwebTableDataSets[0] as IModelWebTableDataSet).RecordCount;

    if LRecordCount > 0 then
    begin
      for var X := 0 to Pred(LRecordCount) do
      begin
        LRetornoHtmlStr := LRetornoHtmlStr +'<tr>';

        for var I := 0 to Pred(FwebTableDataSets.Count) do
        begin
          LWebTableSet := (FwebTableDataSets[I] as IModelWebTableDataSet);
          LRetornoHtmlStr := LRetornoHtmlStr + LWebTableSet.Generate(X);
        end;

        LRetornoHtmlStr := LRetornoHtmlStr + '</tr> ';
      end;
    end;
  end;

  LRetornoHtmlStr := LRetornoHtmlStr + '</tbody> ';

  result := LRetornoHtmlStr;
end;

function TModelWebTable.GenerateFootHtml: string;
var
  LRetornoHtmlStr: string;
  LWebTableSet: IModelWebTableDataSet;
begin
  LRetornoHtmlStr := '<tfoot> <tr> ';

  for var I := 0 to Pred(FwebTableDataSets.Count) do
  begin
    LWebTableSet := (FwebTableDataSets[I] as IModelWebTableDataSet);
    LRetornoHtmlStr := LRetornoHtmlStr +'<th>'+ LWebTableSet.ColumnName +'</th>';
  end;

  LRetornoHtmlStr := LRetornoHtmlStr + '</tr> </tfoot> ';

  result := LRetornoHtmlStr;
end;

function TModelWebTable.GenerateHeaderHtml: string;
var
  LRetornoHtmlStr: string;
  LWebTableSet: IModelWebTableDataSet;
begin
  LRetornoHtmlStr := '<thead> <tr> ';

  for var I := 0 to Pred(FwebTableDataSets.Count) do
  begin
    LWebTableSet := (FwebTableDataSets[I] as IModelWebTableDataSet);
    LRetornoHtmlStr := LRetornoHtmlStr +'<th>'+ LWebTableSet.ColumnName +'</th>';
  end;

  LRetornoHtmlStr := LRetornoHtmlStr + '</tr> </thead> ';

  result := LRetornoHtmlStr;
end;

class function TModelWebTable.New: IModelWebTable;
begin
  result := Self.Create;
end;

end.
