Unit Unit1;

interface

uses System, System.Drawing, System.Windows.Forms;
type logpass = record
 log:string;
 pass:string;
 balance:=1000000;
 end;
 
var a : logpass; summa : integer;

type
  Form1 = class(Form)
    procedure button2_Click(sender: Object; e: EventArgs);
    procedure button3_Click(sender: Object; e: EventArgs);
    procedure button4_Click(sender: Object; e: EventArgs);
    procedure button1_Click(sender: Object; e: EventArgs);
  {$region FormDesigner}
  internal // комментарий 
    {$resource Unit1.Form1.resources}
    panel1: Panel;
    button1: Button;
    panel2: Panel;
    button4: Button;
    button3: Button;
    button2: Button;
    label2: &Label;
    label1: &Label;
    label4: &Label;
    textBox3: TextBox;
    textBox2: TextBox;
    textBox1: TextBox;
    label3: &Label;
    {$include Unit1.Form1.inc}
  {$endregion FormDesigner}
  public
    constructor;
    begin
      InitializeComponent;
    end;
  end;

implementation

procedure Form1.button2_Click(sender: Object; e: EventArgs);
begin
  if integer.TryParse(textbox1.Text,summa) then
  begin
   summa := strtoint(textbox1.Text);
   textbox1.Text:='';
   if a.balance - summa >= 0 then
     begin
   a.balance:= a.balance - summa;
   label1.Text:= $'Баланс {a.balance}';
     end
     else MessageBox.Show($'Лимит превышен ', 'Message', MessageBoxButtons.OK);
       
   end
  else
  begin
    MessageBox.Show($'Сумма введена не верно ', 'Message', MessageBoxButtons.OK);
  end;
end;

procedure Form1.button3_Click(sender: Object; e: EventArgs);
begin
  if integer.TryParse(textbox1.Text,summa) then
  begin
    
  summa := strtoint(textbox1.Text);
  textbox1.Text:='';
  a.balance:= a.balance + summa;
   label1.Text:= $'Баланс {a.balance}';
  end
  else
  begin
    MessageBox.Show($'Сумма введена не верно ', 'Message', MessageBoxButtons.OK);
  end;
end;

procedure Form1.button4_Click(sender: Object; e: EventArgs);
begin
  
  panel1.Enabled:=true;
  panel1.Visible:=true;
  panel2.Enabled:=false;
  panel2.Visible:=false;
  textbox2.Text:='';
  textbox3.Text:='';
  
end;

procedure Form1.button1_Click(sender: Object; e: EventArgs);

begin
  
  a.log:= 'gref';
  a.pass:= '123';
  
  if (textbox2.Text = a.log) and (textbox3.Text = a.pass) then 
    begin
    
  label1.Text:= $'Баланс {a.balance}';
  panel2.Enabled:=true;
  panel2.Visible:=true;
  panel1.Enabled:=false;
  panel1.Visible:=false;
  
    end
    
  else 
  begin
    textbox2.Text:='';
    textbox3.Text:='';
    MessageBox.Show($'Не верная комбинация ', 'Message', MessageBoxButtons.OK);
  end
end;

end.
