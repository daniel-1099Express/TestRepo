unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
        Label1.Caption:='This is a test.';
        if (CheckBox1.Checked = true) then
                ShowMessage('Test Checkbox 1 is checked')
        else
                ShowMessage('Test Checkbox 1 is not checked');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
        ShowMessage('This is another test');
        if (CheckBox2.Checked = true) then
                ShowMessage('Test Checkbox 2 is checked')
        else
                ShowMessage('Test Checkbox 2 is not checked');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
        ShowMessage(Form1.Edit1.Text);
        if (CheckBox3.Checked = true) then
                ShowMessage('Test Checkbox 3 is checked')
        else
                ShowMessage('Test Checkbox 3 is not checked');
end;

end.
 