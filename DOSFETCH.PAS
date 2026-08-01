Program DosFetch;
uses crt,dos;


var
   MaxX,MaxY,currNo : Integer;

procedure DrawAsciiArt(StartX, StartY: Integer);
begin
  GoToXY(StartX, StartY + 0);
  Write(#178#178#178#178#178#220#220'      '#220#178#178#178#178#178'M  ');
  Write(#220#220#220#178#178#178#178#178#178#220#220);

  GoToXY(StartX, StartY + 1);
  Write(' '#178#178#176#176#176#177#178';    ;'#178#176#176#176#177#178'Mj');
  Write(#219#176#177#177#223#223#223#221#220#176#177#219#221);

  GoToXY(StartX, StartY + 2);
  Write(' '#178#178#176#177#176#176#177#178'   '#222#178#176#176#176#176#177#178'M');
  Write(#222#178#176#177#178#221'   '#222#178#219#219#178#221);

  GoToXY(StartX, StartY + 3);
  Write(' '#178#178#176#177#219#221#176#177#178'M'#222#178#176#176#177#221#176#177#178'M"');
  Write(#223#219#219#177#177#178#178#178#219#220#220);

  GoToXY(StartX, StartY + 4);
  Write(' '#178#178#176#177#178#178#178#176#177#178#221#176#176#178#178#221#176#177#178'M ');
  Write(#220#220#220#130#223#223#223#177#220#176#177#178#220);

  GoToXY(StartX, StartY + 5);
  Write(' '#178#178#176#177#178#221#222#219#176#177#165#222#219#196#178#221#176#177#178'M');
  Write(#222#178#176#176#219#221';;'#220#222#221#176#177#178#221);

  GoToXY(StartX, StartY + 6);
  Write(' '#178#178#176#177#178#221' '#223#219#234#222#221#223' '#178#221#176#177#178'M ');
  Write(#223#219#176#144#177#177#177#177#176#176#177#219#223'"');

  GoToXY(StartX, StartY + 7);
  Write(#178#178#178#178#178#178#178#178#178#178#178#178#178#220#178#178#178#178#178#178#178#178#178#220);
  Write(#178#178#178#178#178#178#178#178#178#220#220'r');

  GoToXY(StartX, StartY + 8);
  Write(#178#177#177#177#177#177#177#177#177#177#219#178#178#177#176#177#177#176#177#176#219);
  Write(#178#178#176#176#176#176#176#176#176#176#176#176#176#176#223#223#220);

  GoToXY(StartX, StartY + 9);
  Write(#178#177#177#177#177#219#219#219#219#219#178#221#177#177#177#219#219#219#219#177#178);
  Write(#178#176#176'g'#219#219#219#219#219#219#219#177#176#176#222#219#178);

  GoToXY(StartX, StartY + 10);
  Write(#178#177#177#177#177#178#178#178#178#178#177#177#177#177#178#177#177#177#178#178);
  Write(#178#178#176#176#178#178#177#177#176#178#221' '#223#178#178#178#178#223);

  GoToXY(StartX, StartY + 11);
  Write(#178#177#177#177#177#178#221'  '#178#221#177#177#177#178#177#177#177#178' '#253#223#219#220);
  Write(#178#178#177'@'#177#178#178#178#178#220#220#169);

  GoToXY(StartX, StartY + 12);
  Write(#178#177#177#177#177#178#221'  '#178#221#177#177#177#178#177#177#177#178'    '#223#178);
  Write(#178#177#176#177#178#221'@'#176#176#176#223#223#220);

  GoToXY(StartX, StartY + 13);
  Write(#178#177#177#177#177#178#221'  '#178#177#182#177#178#178#177#177#177#178'  j'#219);
  Write(#219#178#178#177#176#177#178#178#178#177#176#176#176#176#178);

  GoToXY(StartX, StartY + 14);
  Write(#178#177#177#177#177#178#219#219#219#219#178#178#219#178#177#177#178#178#178#219);
  Write(#178#178'@'#176#176#144#178#219#178#219#219#219#177#176#176#176#176#178);

  GoToXY(StartX, StartY + 15);
  Write(#178#177#177#177#177#177#177#177#177#177#177#177#177#177#219#178#178#178#177'@');
  Write(#178#178#177#220#176#176#176#176#176#176#176#176#176#220#177#177#178);

  GoToXY(StartX, StartY + 16);
  Write(#178#177#177#177#177#177#177#177#177#177#177#177#177#178#178#177#177#220#177#220);
  Write(#177#177#178#177#177#177#221#176#176#176#176#176#176#177#178#177#177#178);

  GoToXY(StartX, StartY + 17);
  Write(#178#178#219#177#177#177#177#177#177#177#177#177#178#178#178#178#177#177#177#177);
  Write(#177#177#177#178#178#178#177#177#177#177#177#177#177#178#178#221#253);

  GoToXY(StartX, StartY + 18);
  Write(' '#208#223#223#223#223#223#223#223#223#223#189'  '#208#223#223#223#223#223#223);
  Write(#223#223' '#212#223#223#223#223#223#223#223);
end; {amuga goydum burann ellesmeyin cok}


function GetResolution: string;
var
  R: Registers;
  Mode: Byte;
begin
  R.AH := $0F;
  Intr($10, R);

  Mode := R.AL;

  case Mode of
    $00, $01:
      GetResolution := '40x25 Text';

    $02, $03:
      GetResolution := '80x25 Text';

    $07:
      GetResolution := '80x25 Mono Text';

  else
    begin
      GetResolution := 'Unknown Video Mode';
    end;
  end;
end;

procedure DrawBox(x1,y1,x2,y2: Integer);
var
   I:Integer;
   InnerWidth:Integer;
begin
     InnerWidth := (x2 - x1) - 1;
     GotoXY(x1,y1);
     write(#201);
     for I:=1 to InnerWidth do write(#205);
     write(#187);

     for I:=1 to (y2 - y1 - 1) do
     begin
          GotoXY(x1, y1 + I);
          write(#186, ' ':InnerWidth, #186);
     end;

     GotoXY(x1,y2);
     write(#200);
     for I:=1 to InnerWidth do write(#205);
     write(#188);
end;

procedure SetText(x1,y1,x2,y2:Integer; key,value:string);
var
   WinWidth, WinHeight, maxLen: Integer;
   PosX, PosY: Integer;
begin
     WinWidth := (x2 - x1) + 1;
     WinHeight := (y2 - y1) + 1;
     Window(x1, y1, x2, y2);
     maxlen := length(Concat(key,value)) +2;

     PosX := (WinWidth - maxlen) div 2 + 1;
     PosY := (WinHeight div 2) + 1;

     if PosX < 1 then PosX := 1;
     if PosY < 1 then PosY := 1;

     GotoXY(PosX, PosY);
     textColor(Yellow);
     write(key,': ');
     textColor(white);
     write(value);
     Window(1,1,80,25);
end;

procedure SetTextNormal(x1,y1,x2,y2:Integer; str:string);
var
   WinWidth, WinHeight: Integer;
   PosX, PosY: Integer;
begin
     WinWidth := (x2 - x1) + 1;
     WinHeight := (y2 - y1) + 1;
     Window(x1, y1, x2, y2);

     PosX := (WinWidth - Length(str)) div 2 + 1;
     PosY := (WinHeight div 2) + 1;

     if PosX < 1 then PosX := 1;
     if PosY < 1 then PosY := 1;

     GotoXY(PosX, PosY);
     write(str);
     Window(1,1,80,25);
end;

function WtoStr(w:word): string;
var temp:string;
begin
     str(w,temp);
     wtoStr := temp;
end;

function LItoStr(w:longint): string;
var temp:string;
begin
     str(w,temp);
     LItoStr := temp;
end;


function GetUptimeSeconds: LongInt;
var
   Ticks: LongInt;
begin
     Ticks := MemL[$0040:$006C];
     GetUptimeSeconds := Ticks div 18;
end;

function DriveFreeMB :Longint;
var
   FreeBayt:REal;
begin
     Freebayt := DiskFree(0);
     DriveFreeMB := trunc(FreeBayt/1048576.0);
end;

function DriveTotalMB :Longint;
var
   TotalBayt:REal;
begin
     Totalbayt := DiskSize(0);
     DriveTotalMB := trunc(TotalBayt/1048576.0);
end;

function Longinttostr(lint:Longint):String;
var
   S: String;
begin
  Str(lint, S);
  Longinttostr := S;
end;


procedure PutInfo(key,value:String);
begin
     SetText((maxx div 2)+1,currno+4,maxx,currno+4,key,value);
     currNo := currNo+2;
end;

procedure drawBlock(x,y,color:Integer);
begin
     textcolor(color);
     gotoxy(x,y);
     write(#219#219#219);
     gotoxy(x,y+1);
     write(#219#219#219);
end;

function GetSystemTime : String;
var
  saat, dakika, Saniye, salise: Word;
  Strsaat, Strdakika: String;
begin
     GetTime(saat, dakika, saniye, salise);
     Str(saat, strsaat);
     Str(dakika, strdakika);
     if length(Strsaat) = 1 then
     begin
          strsaat := '0'+Strsaat;
     end;
     if length(Strdakika) = 1 then
     begin
          strdakika := '0'+strdakika
     end;
     GetSystemTime := strsaat + ':' + strdakika;
end;

var
   text: String;
   days,hours,minutes,seconds:LongInt;
   I: integer;
begin
     ClrScr;
     MaxX := Mem[$0040:$004A];
     MaxY := Mem[$0040:$0084] +1 ;
     currNo := 3;
     text := '';

     {drawbox(1,1,maxx div 2,maxy-3);}
     Drawasciiart(5,3);

     GotoXY(50,5);
     TextColor(cyan);
     for I:=0 to 20 do
     begin
          write(#205);
     end;
     TextColor(green);
     DrawBox(55,2,65,4);
     TextColor(red);
     SetTextNormal(50,2,70,4,GetSystemTime);

     PutInfo('OS', 'MS-DOS');
     PutInfo('Version', Concat(wtostr(Lo(dosversion)),'.',wtostr(hi(dosversion))));

     days := GetUptimeSeconds div 86400;
     hours := (getuptimeseconds mod 86400) div 3600;
     minutes := (getuptimeseconds mod 3600) div 60;
     seconds := Getuptimeseconds mod 60 ;

     if days> 0 then
     begin
          text := text + litostr(days)+'d ';
     end;
     if hours>0 then
     begin
          text := text + litostr(hours)+'h ';
     end;
     if minutes>0 then
     begin
          text := text + litostr(minutes)+'m ';
     end;
     if seconds>0 then
     begin
          text := text + litostr(seconds)+'s';
     end;
     putinfo('Uptime',text);
     putinfo('Shell',getenv('comspec'));
     putinfo('Resolution',GetResolution);
     PutInfo('Disk', concat(Longinttostr((DriveTotalMB - DriveFreeMB)), ' / ', Longinttostr(DriveTotalMB),
     ' MB ')); {elleme}


     {for I := 0 to 15 do
     begin

     end;}

     for I := 0 to 8 do
     begin
          DrawBlock(47+(3*I), 19,I);
     end;
     for I := 9 to 15 do
     begin
          DrawBlock(47+(3*(I-8)), 21,I);
     end;

     gotoxy(1,23);
end.
