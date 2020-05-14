const
  N=1000000;
var
  i,j,s:longint;
  a1,a:array [1..n] of longint;
  b:array[1..600] of longint;
  pj,fc,sf:double;

procedure qs(l,r:longint);
var i,j,m,t:longint;
begin
  i:=l;
  j:=r;
  m:=a[(l+r) div 2];
  repeat
  while a[i]<m do inc(i);
  while a[j]>m do dec(j);
  if i<=j then
    begin
    t:=a[i];
    a[i]:=a[j];
    a[j]:=t;
    inc(i);
    dec(j);
    end;
  until i>j;
  if l<j then qs(l,j);
  if i<r then qs(i,r);
end;
  
begin
  assign(input,'jieguo.txt');
  reset(input);
  assign(output,'fenxi.txt');
  rewrite(output);
  
  for i:=1 to n do
    read(a1[i]);
  a:=a1;
  qs(1,n);
  for i:=1 to n do
    inc(b[a1[i]]);
  for i:=1 to 600 do
    writeln(b[i]/n:0:10);
    
  writeln;
    
  s:=0;
  for i:=1 to n do
    s:=s+a1[i];
  pj:=s/n;
  sf:=0;
  for i:=1 to n do
    sf:=sf+sqr(a[i]-pj);
  fc:=sf/n;
  writeln(pj:0:10);
  writeln(fc:0:10);
  writeln;
  writeln(a[1]);
  for i:=1 to 100 do
    writeln(a[round(i*n/100)]);
  
  close(input);
  close(output);
end.