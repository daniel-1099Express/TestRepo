unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, StdActns, ActnList, ImgList, ComCtrls, ToolWin;

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
    ImageList1: TImageList;
    ActionList1: TActionList;
    EditCopy1: TEditCopy;
    EditCut1: TEditCut;
    EditPaste1: TEditPaste;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit2: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Memo1: TMemo;
    Go: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Button4: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GoClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure CheckInteger(Var EdBox : TEdit);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
        Memo1.Lines.Clear;
        Label4.Caption := 'Sum: 0.00';
        Label5.Caption := 'Subtract: 0.00';
        Label6.Caption := 'Multiply: 0.00';
        Edit5.Text := '0.00';
        Edit6.Text := '0.00';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
        Label1.Caption := 'This is a test.';
        if (CheckBox1.Checked = true) then
                ShowMessage('Test Checkbox 1 is checked')
        else
                ShowMessage('Test Checkbox 1 is not checked');
        Label1.Caption := 'Label1';
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
        Form1.Edit1.Color := clYellow;
        ShowMessage(Form1.Edit1.Text);
        if (CheckBox3.Checked = true) then
                ShowMessage('Test Checkbox 3 is checked')
        else
                ShowMessage('Test Checkbox 3 is not checked');
        if not (Edit1.Text = '') then
                Edit1.Text := '';
        Form1.Edit1.Color := clWhite;
end;

procedure TForm1.GoClick(Sender: TObject);
Var
        v1, v2 : Variant;
        n1, n2, count : Integer;
begin
        Memo1.Lines.Clear;
        v1 := Edit3.Text;
        v2 := Edit4.Text;
        n1 := Integer(v1);
        n2 := Integer(v2);
        if (n1 < n2) then
                For count := n1 to n2 Do
                        Memo1.Lines.Add(IntToStr(Count))
        else
                For count := n1 downto n2 Do
                        Memo1.Lines.Add(IntToStr(Count));
end;

procedure TForm1.Button4Click(Sender: TObject);
Var
        v1, v2, vSum, vSub, vMul : Variant;
        sSum, sSub, sMul : String;
begin
        v1 := Edit5.Text;
        v2 := Edit6.Text;
        vSum := Real(v1) + Real(v2);
        vSub := Real(v1) - Real(v2);
        vMul := Real(v1) * Real(v2);
        Str(vSum:0:2, sSum);
        Str(vSub:0:2, sSub);
        Str(vMul:0:2, sMul);
        Label4.Caption := 'Sum: ' + sSum;
        Label5.Caption := 'Subtract: ' + sSub;
        Label6.Caption := 'Multiply: ' + sMul;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
        Close;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
        CheckInteger(Edit3);
end;

procedure TForm1.Edit4Exit(Sender: TObject);
begin
        CheckInteger(Edit4);
end;

procedure TForm1.CheckInteger(Var EdBox : TEdit);
Var
    I, Code : Integer;
Begin
    I := 0;
    { Get text from TEdit control }
    Val(EdBox.Text, I, Code);
    { Error during conversion to Integer? }
    If Code <> 0 Then
    Begin
        MessageDlg('Please check your input details.', mtError, [mbOk], 0);
        EdBox.Text := '0';
        { Get focus back to edit box }
        EdBox.SetFocus;
    End Else
        { Pass the integer value to edit box }
        EdBox.Text := IntToStr(I);
End;

end.

