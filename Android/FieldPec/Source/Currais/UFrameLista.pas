unit UFrameLista;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TFItemListaAbastecimento = class(TFrame)
    RecBack: TRectangle;
    Layout1: TLayout;
    Image1: TImage;
    Layout4: TLayout;
    lblCurral: TLabel;
    layImg: TLayout;
    Layout2: TLayout;
    Image2: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    Image3: TImage;
    Label2: TLabel;
    lblCapacidade: TLabel;
    lblLotacao: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
