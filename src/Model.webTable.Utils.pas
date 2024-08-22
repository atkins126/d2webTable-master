unit Model.webTable.Utils;

interface

uses
  System.Math,
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  Model.webTable.Interfaces;

function EnumColorsToRgbColorsStr(AValue: EnumWebTableColors; AOpacity: string): string;
function EnumStyleTextToTagHtml(AValue: EnumWebTableStyleText; ATagFinal: Boolean = False): string;

implementation

function EnumColorsToRgbColorsStr(AValue: EnumWebTableColors; AOpacity: string): string;
begin
  result := '';

  case AValue of
    wcDark: result := Format('rgba(60, 60, 60, %s)', [AOpacity]);
    wcDanger: result := Format('rgba(255, 0, 0, %s)', [AOpacity]);
    wcInfo: result := Format('rgba(0, 255, 255, %s)', [AOpacity]);
    wcLight: result := Format('rgba(255, 255, 255, %s)', [AOpacity]);
    wcPrimary: result := Format('rgba(0, 0, 255, %s)', [AOpacity]);
    wcSecondary: result := Format('rgba(200, 200, 200, %s)', [AOpacity]);
    wcSuccess: result := Format('rgba(60, 179, 113, %s)', [AOpacity]);
    wcTransparent: result := Format('rgba(255, 99, 71, %s)', [AOpacity]);
    wcWarning: result := Format('rgba(255, 165, 0, %s)', [AOpacity]);
  end;
end;

function EnumStyleTextToTagHtml(AValue: EnumWebTableStyleText; ATagFinal: Boolean): string;
begin
  result := '';

  case AValue of
    stBold: result := '<'+ ifThen(ATagFinal, '', '') + 'b>';
    stStrong: result := '<'+ ifThen(ATagFinal, '\', '') + 'strong>';
    stItalic: result := '<'+ ifThen(ATagFinal, '', '') + 'i>';
    stEmphasized: result := '<'+ ifThen(ATagFinal, '\', '') + 'em>';
    stMarked: result := '<'+ ifThen(ATagFinal, '\', '') + 'mark>';
    stSmaller: result := '<'+ ifThen(ATagFinal, '\', '') + 'small>';
    stDeleted: result := '<'+ ifThen(ATagFinal, '\', '') + 'del>';
    stInserted: result := '<'+ ifThen(ATagFinal, '\', '') + 'ins>';
    stSubscript: result := '<'+ ifThen(ATagFinal, '\', '') + 'sub>';
    stSuperscript: result := '<'+ ifThen(ATagFinal, '\', '') + 'sup>';
  end;
end;

end.
