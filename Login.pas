unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.MediaLibrary.Actions, FMX.StdActns, uPermissoes, uAplicacao;

type
  TPrincipal = class(TForm)
    LayoutPrincipal: TLayout;
    Rectangle1: TRectangle;
    LayoutCabecalho: TLayout;
    LayoutRodape: TLayout;
    LayoutCorpo: TLayout;
    Image1: TImage;
    Image2: TImage;
    Rectangle2: TRectangle;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    LayoutInputLogin: TLayout;
    Rectangle4: TRectangle;
    Edit1: TEdit;
    StyleBook1: TStyleBook;
    LayoutInputSenha: TLayout;
    Rectangle5: TRectangle;
    Z: TEdit;
    LayoutButonEnviar: TLayout;
    Rectangle6: TRectangle;
    Label1: TLabel;
    TabControl1: TTabControl;
    tabLogin: TTabItem;
    tabCadastro: TTabItem;
    layoutPrincipalCadastro: TLayout;
    Rectangle7: TRectangle;
    layoutCabecalhoCad: TLayout;
    Rectangle8: TRectangle;
    Image3: TImage;
    Image4: TImage;
    LayoutRodapeCad: TLayout;
    layoutCorpoCad: TLayout;
    LayoutContainerCad: TLayout;
    Rectangle9: TRectangle;
    LayoutLoginCad: TLayout;
    Rectangle10: TRectangle;
    Edit2: TEdit;
    LayoutSenhaCad: TLayout;
    Rectangle11: TRectangle;
    Edit3: TEdit;
    LayoutBtnCad: TLayout;
    Rectangle12: TRectangle;
    LblCadastrar: TLabel;
    LayoutConfSenhaCad: TLayout;
    Rectangle13: TRectangle;
    Edit4: TEdit;
    TabFoto: TTabItem;
    LayoutPrincipalFoto: TLayout;
    Rectangle14: TRectangle;
    LayoutCabecalhoFoto: TLayout;
    Rectangle15: TRectangle;
    Image5: TImage;
    Image6: TImage;
    LayoutRodapeFoto: TLayout;
    LayoutCorpoFoto: TLayout;
    LayoutContainerPrincipalFoto: TLayout;
    Rectangle16: TRectangle;
    LayoutBtnSalvarFoto: TLayout;
    Rectangle19: TRectangle;
    lblSalvarFoto: TLabel;
    TabSalvar: TTabItem;
    Layout2: TLayout;
    Rectangle17: TRectangle;
    Layout3: TLayout;
    Rectangle18: TRectangle;
    Image7: TImage;
    Image8: TImage;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Rectangle20: TRectangle;
    Layout7: TLayout;
    Rectangle21: TRectangle;
    Label2: TLabel;
    CircFoto: TCircle;
    Layout8: TLayout;
    Rectangle22: TRectangle;
    Image10: TImage;
    Image9: TImage;
    Label3: TLabel;
    ActionList1: TActionList;
    actLogin: TChangeTabAction;
    actCadastro: TChangeTabAction;
    Label4: TLabel;
    actSalvar: TChangeTabAction;
    actFoto: TChangeTabAction;
    actCamera: TTakePhotoFromCameraAction;
    actGaleria: TTakePhotoFromLibraryAction;
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure LblCadastrarClick(Sender: TObject);
    procedure CircFotoClick(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure actCameraDidFinishTaking(Image: TBitmap);
    procedure actGaleriaDidFinishTaking(Image: TBitmap);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    aPermissao: TPermissoes;
    procedure ErroPermissao (Sender: TObject);
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.fmx}

procedure TPrincipal.actCameraDidFinishTaking(Image: TBitmap);
begin
  CircFoto.Fill.Bitmap.Bitmap := Image;
  actSalvar.Execute;
end;

procedure TPrincipal.actGaleriaDidFinishTaking(Image: TBitmap);
begin
  CircFoto.fill.Bitmap.bitmap := Image;
  actSalvar.Execute;
end;

procedure TPrincipal.CircFotoClick(Sender: TObject);
begin
  //TabControl1.ActiveTab:= TabFoto;
  actfoto.Execute;
end;

procedure TPrincipal.ErroPermissao(Sender: TObject);
begin

end;

procedure TPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
        action :=  tCloseAction.caFree;
        Principal:= Nil;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
  aPermissao:= TPermissoes.Create;
  TabControl1.ActiveTab:= tabLogin;
end;

procedure TPrincipal.FormDestroy(Sender: TObject);
begin
  aPermissao.DisposeOf;
end;

procedure TPrincipal.Image10Click(Sender: TObject);
begin
  aPermissao.Camera(actCamera, ErroPermissao);
  //actCamera.Execute;
  //CircFoto.Fill.Bitmap.Bitmap := actCamera.
end;

procedure TPrincipal.Image9Click(Sender: TObject);
begin
  aPermissao.PhotoLibrary(actGaleria, ErroPermissao) ;
end;

procedure TPrincipal.Label1Click(Sender: TObject);
begin
  if not Assigned(frmAplicacao) then
    Application.CreateForm(TFrmAplicacao, FrmAplicacao);
  application.MainForm:= frmAplicacao;
  frmAplicacao.show;
  Principal.close;


end;

procedure TPrincipal.Label3Click(Sender: TObject);
begin
  actCadastro.Execute;
end;


procedure TPrincipal.Label4Click(Sender: TObject);
begin
  actLogin.Execute;
end;

procedure TPrincipal.LblCadastrarClick(Sender: TObject);
begin
 //TabControl1.ActiveTab := TabSalvar;
 actsalvar.Execute;
end;

end.
