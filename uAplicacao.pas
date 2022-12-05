unit uAplicacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit;

type
  TfrmAplicacao = class(TForm)
    LayoutContainer: TLayout;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    LvLancto: TListView;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Image2: TImage;
    Layout5: TLayout;
    Label1: TLabel;
    Layout6: TLayout;
    Edit1: TEdit;
    StyleBook1: TStyleBook;
    Layout7: TLayout;
    Button1: TButton;
    Layout8: TLayout;
    Layout9: TLayout;
    lblEntradas: TLabel;
    lblValorEntrada: TLabel;
    lblSaidas: TLabel;
    lblValorSaida: TLabel;
    imgAlimentacao: TImage;
    procedure Button1Click(Sender: TObject);
    procedure LvLanctoUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure LvLanctoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    procedure Adiciona (pNumLancto, pHistorico, pGrupo:string; pValor: double; pData : TDateTime; pImg:TStream);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAplicacao: TfrmAplicacao;

implementation

{$R *.fmx}

procedure TfrmAplicacao.Button1Click(Sender: TObject);
var mImg : TStream;
    k: integer;
begin
  mImg:=  TMemoryStream.Create;
  self.imgAlimentacao.bitmap.SaveToStream (mImg);
  for k:= 1 to 5 do
    Adiciona(inttostr(1000 + k),'Mercado xyz', 'Alimentação', 100.86, now, mImg );
end;

procedure TfrmAplicacao.LvLanctoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  showmessage(AItem.TagString);
end;

procedure TfrmAplicacao.LvLanctoUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
  var
    item:tListItemText;
    img :TListitemImage;
begin

  item:= TListItemText(AItem.Objects.FindDrawable('Historico'));
  item.Width:= LVLancto.Width - (item.PlaceOffset.X + 70);

  img:=TListItemImage(AItem.Objects.FindDrawable('imgIcone'));
  if LVLancto.Width < 250  then
  begin
    img.Visible:= false;
    item.PlaceOffset.X:=0;
    item.Width:= LVLancto.Width -70;
  end;



end;

procedure TfrmAplicacao.Adiciona(pNumLancto, pHistorico, pGrupo:string; pValor: double; pData : TDateTime; pImg: TStream);
var item : TListItemText;
    img: TListItemImage;
    bmp: TBitmap;
begin

  with LVLancto.Items.Add do
  begin
    TagString:= pNumLancto;
    item:= TListItemText (Objects.FindDrawable('Historico'));
    item.text:= pHistorico;
    TListItemText(Objects.FindDrawable('Valor')).Text:= FormatFloat ('#,##0.00', pValor);
    TListItemText (Objects.FindDrawable('Grupo')).Text:= pGrupo;
    TListItemText (Objects.FindDrawable('Data')).Text:= formatDateTime('dd/mm', pData);

    img:= TListItemImage(objects.FindDrawable('imgIcone'));
    if pImg <>  nil then
    begin
      bmp:= TBitmap.Create;
      bmp.LoadFromStream(pImg);

      img.OwnsBitmap:= True;
      img.Bitmap:= bmp;
    end;

  end;
end;

end.
