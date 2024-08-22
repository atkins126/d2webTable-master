unit Model.webTable.Data;

interface

uses
  Model.webTable.Interfaces;

type
  TModelWebTableData = class(TInterfacedObject, IModelWebTableData)
  strict private
    FText: string;
    FOpacityColor: string;
    FColor: EnumWebTableColors;
    FOpacityBackgroundColor: string;
    FStyleText: EnumWebTableStyleText;
    FColorBackground: EnumWebTableColors;
  public
    constructor Create(AText: string; AColor: EnumWebTableColors; AColorBackground: EnumWebTableColors;
      AOpacityColor: string; AOpacityBackgroundColor: string; AStyleText: EnumWebTableStyleText);

    class function New(AText: string; AColor: EnumWebTableColors; AColorBackground: EnumWebTableColors;
      AOpacityColor: string; AOpacityBackgroundColor: string; AStyleText: EnumWebTableStyleText): IModelWebTableData;

    function Text: string; overload;
    function OpacityColor: string; overload;
    function Color: EnumWebTableColors; overload;
    function OpacityBackgroundColor: string; overload;
    function StyleText: EnumWebTableStyleText; overload;
    function ColorBackground: EnumWebTableColors; overload;

    function Text(AValue: string): IModelWebTableData; overload;
    function OpacityColor(AValue: string): IModelWebTableData; overload;
    function Color(AValue: EnumWebTableColors): IModelWebTableData; overload;
    function OpacityBackgroundColor(AValue: string): IModelWebTableData; overload;
    function StyleText(AValue: EnumWebTableStyleText): IModelWebTableData; overload;
    function ColorBackground(AValue: EnumWebTableColors): IModelWebTableData; overload;
  End;

implementation

{ TModelWebTableData }

function TModelWebTableData.Color: EnumWebTableColors;
begin
  result := FColor;
end;

function TModelWebTableData.Color(
  AValue: EnumWebTableColors): IModelWebTableData;
begin
  result := Self;

  FColor := AValue;
end;

function TModelWebTableData.ColorBackground(
  AValue: EnumWebTableColors): IModelWebTableData;
begin
  result := Self;

  FColorBackground := AValue;
end;

constructor TModelWebTableData.Create(AText: string; AColor, AColorBackground: EnumWebTableColors;
  AOpacityColor: string; AOpacityBackgroundColor: string; AStyleText: EnumWebTableStyleText);
begin
  inherited Create;

  FText := AText;
  FColor := AColor;
  FStyleText := AStyleText;
  FOpacityColor := AOpacityColor;
  FColorBackground := AColorBackground;
  FOpacityBackgroundColor := AOpacityBackgroundColor;
end;

function TModelWebTableData.ColorBackground: EnumWebTableColors;
begin
  result := FColorBackground;
end;

function TModelWebTableData.Text(
  AValue: string): IModelWebTableData;
begin
  result := Self;

  FText := AValue;
end;

function TModelWebTableData.Text: string;
begin
  result := FText;
end;

class function TModelWebTableData.New(AText: string;
  AColor: EnumWebTableColors; AColorBackground: EnumWebTableColors; AOpacityColor: string;
  AOpacityBackgroundColor: string; AStyleText: EnumWebTableStyleText): IModelWebTableData;
begin
  result := Self.Create(AText, AColor, AColorBackground, AOpacityColor,
    AOpacityBackgroundColor, AStyleText);
end;

function TModelWebTableData.OpacityBackgroundColor: string;
begin
  result := FOpacityBackgroundColor;
end;

function TModelWebTableData.OpacityBackgroundColor(
  AValue: string): IModelWebTableData;
begin
  result := Self;

  FOpacityBackgroundColor := AValue;
end;

function TModelWebTableData.OpacityColor(AValue: string): IModelWebTableData;
begin
  result := Self;

  FOpacityColor := AValue;
end;

function TModelWebTableData.StyleText(
  AValue: EnumWebTableStyleText): IModelWebTableData;
begin
  result := Self;

  FStyleText := AValue;
end;

function TModelWebTableData.StyleText: EnumWebTableStyleText;
begin
  result := FStyleText;
end;

function TModelWebTableData.OpacityColor: string;
begin
  result := FOpacityColor;
end;

end.
