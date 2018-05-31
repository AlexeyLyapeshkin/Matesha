unit paporotnik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    pb1: TPaintBox;
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
    procedure drawfern();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  pb1.Canvas.Brush.Color := RGB(0, 0, 0);
  pb1.Canvas.Rectangle(0, 0, pb1.Width, pb1.Height);
  drawFern();
end;

procedure TForm1.DrawFern();
const
  iter = 400000;  
var
  t, x, y: Real;
  p: Real;
  k: LongInt;
  Mx, My, r: Integer;
begin
  Mx := pb1.Width div 2;
  My := Pb1.Height - 40;
  r := trunc(0.09 * My);
  Randomize;
  x := 0.0;
  y := 0.0;
  for k := 1 to iter do
  begin
    Sleep(1);
    p := Random;
    t := x;
    if p <= 0.85 then
    begin
      x := 0.84 * x - 0.045 * y;
      y := 0.045 * t + 0.86 * y + 1.6;
    end
    else if p <= 0.92 then
    begin
      x := 0.25 * x - 0.26 * y;
      y := 0.23 * t + 0.25 * y + 1.6;

    end
    else if p <= 0.99 then
    begin
      x := -0.135 * x + 0.28 * y;
      y := 0.26 * t + 0.245 * y + 0.44;
    end
    else
    begin
      x := 0.0;
      y := 0.16 * y;
    end;
    Pb1.Canvas.Pixels[Mx + Round(r * x), My - Round(r * y) + 35] := RGB(0, 255, 150);
    Application.ProcessMessages;
  end
end;

end.

