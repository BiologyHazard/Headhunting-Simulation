const
  N=100000;
var
  r,r2,r3,gailv:double;
  i,shuiwei,cishu,jieguo,s,count:longint;
  ajieguo:array [1..n] of longint;
  w1,w2,w3:boolean;
function jisuangailv(sw:longint):double;
begin
  if sw<=49 then
    jisuangailv:=0.02
  else
    jisuangailv:=0.02*(sw-48);
  //jisuangailv:=0.02;
end;
begin
  assign(output,'jieguo.txt');
  rewrite(output);
  randomize;
  
  for i:=1 to n do
  begin
    shuiwei:=0;
    cishu:=0;
    //count:=0;
    w1:=FALSE;
    w2:=FALSE;
    w3:=FALSE;
    { for cishu:=1 to 300 do }
    { begin }
      { gailv:=jisuangailv(shuiwei); }
      { r:=random(); }
      { if r>=gailv then }
      { begin }
        { inc(shuiwei); }
        { r2:=random(); }
        { if r2<0.08/0.92/2 then }
          { //jieguo:=4; }
          { inc(count); }
        { //jieguo:=0; }
      { end }
      { else }
      { begin }
        { shuiwei:=0; }
        { r2:=random(); }
        { if r2<0.35 then }
        { begin }
          { jieguo:=1; }
          { break; }
        { end }
        { else }
          { if r2<0.7 then }
            { jieguo:=2 }
          { else }
            { jieguo:=3; }
      { end; }
    { end; }
    { //if jieguo=1 then }
      { ajieguo[i]:=1 }
    { else }
      { ajieguo[i]:=0; } 
      
    repeat
      inc(cishu);
      gailv:=jisuangailv(shuiwei);
      r:=random();
      if r>=gailv then
      begin
        r3:=random();
        if r3<4/98 then
        begin
          //jieguo:=0;
          w3:=true;
        end
        else
          //jieguo:=-1;
        inc(shuiwei);
      end
      else
      begin
        shuiwei:=0;
        r2:=random();
        if r2<0.35 then
        begin
          //jieguo:=1;
          w1:=true;
        end
        else
          if r2<0.7 then
          begin
            //jieguo:=2;
            w2:=true;
          end
          else
            //jieguo:=3;
      end;
      
      if (w1 and w2) or ((cishu>=300) and (w1 or w2)) or (cishu>=600) then
      begin
        if w3 then
          ajieguo[i]:=0
        else
          ajieguo[i]:=1;
        break;
      end;
    until false;//(jieguo=1) or (jieguo=2) or (jieguo=3) or (cishu=300);
    //ajieguo[i]:=cishu;
  end;
  { for i:=1 to n do }
  { begin }
    { write(ajieguo[i]:4); }
    { if i mod 10=0 then }
      { writeln; }
  { end; }
  s:=0;
  for i:=1 to n do
    s:=s+ajieguo[i];
  writeln(s/n:0:10);
  close(output);
end.