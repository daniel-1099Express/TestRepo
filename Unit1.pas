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
    Action1: TAction;
    Action2: TAction;

    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
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
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;

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
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Edit7: TEdit;
    Label7: TLabel;
    Button5: TButton;
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
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure CheckReal(Var EdBox : TEdit);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    function IsValidEmail(const Value: String): Boolean;
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
        Edit7.Text := '';
        with OpenDialog1 do begin
                Options := Options + [ofPathMustExist, ofFileMustExist];
                InitialDir := ExtractFilePath(Application.ExeName);
                Filter := 'Text files (*.txt)|*.txt';
        end;
        with SaveDialog1 do begin
                InitialDir := ExtractFilePath(Application.ExeName);
                Filter := 'Text files (*.txt)|*.txt';
        end;
        Memo1.ScrollBars := ssBoth;
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

procedure TForm1.Edit5Exit(Sender: TObject);
begin
      CheckReal(Edit5);
end;

procedure TForm1.Edit6Exit(Sender: TObject);
begin
      CheckReal(Edit6);
end;

procedure TForm1.CheckReal(Var EdBox : TEdit);
Var
    r : Real;
    Code : Integer;
Begin
    r := 0;
    { Get text from TEdit control }
    Val(EdBox.Text, r, Code);
    { Error during conversion to Integer? }
    If Code <> 0 Then
    begin
        MessageDlg('Please check your input details.', mtError, [mbOk], 0);
        EdBox.Text := '0.00';
        { Get focus back to edit box }
        EdBox.SetFocus;
    end else
        { Pass the integer value to edit box }
        EdBox.Text := Format('%f', [r]);
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
        SaveDialog1.FileName := Form1.Caption;
        if SaveDialog1.Execute then begin
                Memo1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
        Form1.Caption := SaveDialog1.FileName;
        end;
end;

procedure TForm1.Save1Click(Sender: TObject);
begin
        SaveDialog1.FileName := Form1.Caption;
        if SaveDialog1.Execute then begin
                Memo1.Lines.SaveToFile(SaveDialog1.FileName + '.txt');
        Form1.Caption := SaveDialog1.FileName;
        end;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
        if OpenDialog1.Execute then begin
                Form1.Caption := OpenDialog1.FileName;
                Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
        Memo1.SelStart := 0;
        end;
end;

procedure TForm1.Open1Click(Sender: TObject);
begin
        if OpenDialog1.Execute then begin
                Form1.Caption := OpenDialog1.FileName;
                Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
        Memo1.SelStart := 0;
        end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
        if IsValidEmail(Edit7.Text) then
            ShowMessage('Valid Email Address')
        else
            ShowMessage('Invalid Email Address');
end;

function TForm1.IsValidEmail(const Value: String): Boolean;
  function CheckAllowed(const s: String): Boolean;
  var
        i: integer;
  begin
        result := false;
        for i := 1 to Length(s) do
                begin
                        // illegal char - no valid address
                        if not (s[i] in ['a'..'z','A'..'Z','0'..'9','_','-','.','+']) then
                                Exit;
                end;
        result := true;
  end;
var
        i: Integer;
        namePart, serverPart: String;
begin
        result := false;

        i := Pos('@', Value);
        if (i = 0) then
                Exit;

        if (pos('..', Value) > 0) or (pos('@@', Value) > 0) or (pos('.@', Value) > 0) then
                Exit;

        if (pos('.', Value) = 1) or (pos('@', Value) = 1) then
                Exit;

        namePart := Copy(Value, 1, i - 1);
        serverPart := Copy(Value, i + 1, Length(Value));
        if (Length(namePart) = 0)  or (Length(serverPart) < 5) then
                Exit;  // too short

        i := Pos('.', serverPart);
        // must have dot and at least 3 places from end
        if (i = 0) or (i > (Length(serverPart) - 2)) then
                Exit;

        result := CheckAllowed(namePart) and CheckAllowed(serverPart);
end;

end.
