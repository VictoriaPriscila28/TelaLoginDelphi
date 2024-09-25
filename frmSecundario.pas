unit frmSecundario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    nome: TEdit;     // Nome/Caminho do Banco de Dados
    servidor: TEdit; // Nome do Servidor
    porta: TEdit;    // Porta
    login: TEdit;    // Login/Usuário
    senha: TEdit;    // Senha
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Button1: TButton; // Botão Confirmar
    Image1: TImage;
    Label6: TLabel;
    Image2: TImage;
    Label7: TLabel;
    procedure Button1Click(Sender: TObject); // Adicionar o evento do botão
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  dbPath, serverName, dbPort, userName, userPassword: string;
  connectionString: string;
begin
  // Pegando os valores dos campos de entrada
  dbPath := nome.Text;        // Nome/Caminho da Base de Dados
  serverName := servidor.Text; // Nome do Servidor
  dbPort := porta.Text;        // Porta
  userName := login.Text;      // Usuário
  userPassword := senha.Text;  // Senha

  // Verifica se todos os campos foram preenchidos
  if (dbPath = '') or (serverName = '') or (dbPort = '') or (userName = '') or (userPassword = '') then
  begin
    ShowMessage('Todos os campos devem ser preenchidos!');  // Mensagem de erro
    Exit;
  end;

  // Concatena a string de conexão no formato requisitado
  connectionString := Format('jdbc:%s:%s@%s/%s:%s', [userName, userPassword, dbPath, serverName, dbPort]);

  // Exibe a string de conexão
  ShowMessage('OK. Conexão: ' + connectionString);
end;

end.

