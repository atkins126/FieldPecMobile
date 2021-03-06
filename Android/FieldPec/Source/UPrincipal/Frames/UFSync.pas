unit UFSync;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ActnList, System.Actions, FMX.TabControl,FireDAC.DApt, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, Data.DB, FireDAC.Comp.DataSet,
  FMX.TreeView,System.Net.HttpClient, FMX.Memo.Types
  {$IFDEF ANDROID}
  ,AndroidApi.helpers,AndroidApi.JNI.JavaTypes,AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,Androidapi.JNIBridge,Androidapi.JNI.Telephony,Androidapi.JNI.Provider,
  FMX.Helpers.Android,FMX.Platform.Android,System.PushNotification,System.Permissions,
  FMX.VirtualKeyboard
  {$ENDIF}

 {$IFDEF MSWINDOWS}
  ,Winapi.Windows, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP
 {$ENDIF}
  ;

type
  TFrameSync = class(TFrame)
    laySelectSync: TLayout;
    imgSync: TImage;
    Animacao: TFloatAnimation;
    Layout36: TLayout;
    imgTransf: TImage;
    mlog: TEdit;
    Rectangle19: TRectangle;
    Image17: TImage;
    Label19: TLabel;
    Rectangle24: TRectangle;
    Layout35: TLayout;
    Label21: TLabel;
    btnFechaSync: TImage;
    Rectangle3: TRectangle;
    btnEnviar: TRectangle;
    Image12: TImage;
    ShadowEffect10: TShadowEffect;
    Label22: TLabel;
    procedure btnFechaSyncClick(Sender: TObject);
    procedure btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnEnviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses UPrincipal, UdmSync;

procedure TFrameSync.btnEnviarClick(Sender: TObject);
begin
 if dmSync.TestaServidor<>'Erro' THEN
  begin
   Animacao.Start;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Usuarios...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.USERS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Propriedades...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.USERS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Currais...');
    end);
    mlog.text :=(dmSync.GetGenericoPostIdPropriedade(dmSync.CURRAIS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Alimentos...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.ALIMENTO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Raca...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.RACA));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Categoria Padrao...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.CATEGORIA_PADRAO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Categorias...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.CATEGORIAS));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Produtores...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.PRODUTORES));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Rebanho...');
    end);
    mlog.text :=(dmSync.GetGenerico(dmSync.AUX_REBANHO));
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     mlog.text :=('Baixando Animais...');
    end);
    mlog.text :=(dmSync.GetAnimais);
    Sleep(1000);

    TThread.Synchronize(nil, procedure
    begin
     Animacao.Stop;
     MessageDlg('Dados Sincronizados com Sucesso!'+#13+
      'Sistema deve ser reiniciado!', System.UITypes.TMsgDlgType.mtInformation,
       [System.UITypes.TMsgDlgBtn.mbYes], 0,
       procedure(const AResult: System.UITypes.TModalResult)
       begin
       end);
    end);
   end).Start;
  end
  else
  begin
    ShowMessage('Erro ao se conectar com servidor!');
    Animacao.Stop;
  end;
end;

procedure TFrameSync.btnEnviarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity := 0.5;
end;

procedure TFrameSync.btnEnviarMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
 TRectangle(sender).Opacity := 1;
end;

procedure TFrameSync.btnFechaSyncClick(Sender: TObject);
begin
 Visible := false;
end;

end.
