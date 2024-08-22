# d2webTable
Este repositório contém um conjunto de classes Delphi desenvolvido para gerar tabela no formato HTML.

# Declaração
Para utilizar o d2webTable você deve adicionar as uses:
```pascal
  Model.webTable,
  Model.webTable.Interfaces;
```

Declarar no head do html
```html
<link id="pagestyle" href="https://cdn.datatables.net/2.1.4/css/dataTables.dataTables.css" rel="stylesheet" />
```

# Como usar
```pascal
  var HTML := TModelWebTable.New
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
                .Generate;
```
