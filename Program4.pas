program laba4;

uses crt;
const max = 100;
type
    graph = array[1..max,1..max] of byte;
    mass = array[1..max] of byte;

var
    N:byte;
    input:graph;
    deg:mass;
 
 
procedure getDeg(var deg:mass; inp:graph);
begin
    for var i := 1 to n do deg[i] := 0;
    for var i := 1 to N do
        for var j := 1 to N do
            deg[i] := deg[i] + inp[i,j];
    for var i := 1 to N do
        deg[i] := deg[i] + inp[i,i];
end;
procedure InputGraph(var inp:graph);
begin
    writeln('Введите 1 если эти вершины соединены ребром, 0 если нет');
    for var i := 1 to N do
        for var j := i+1 to N do
        begin
            write('V',[i],' и V',[j],': ');
            var temp := -1;
            while (temp <> 0) and (temp <> 1) do readln(temp);
            inp[i,j] := temp;
            inp[j,i] := temp;
        end;
end;
procedure Show(inp:graph);
begin
    write('   ┌─');
    for var i := 2 to N do write('───┬─');
    write('───┐');
    writeln;
    write('   │');
    for var i := 1 to n do write(' ',i:2,' │');
    writeln;
    write('┌──┼──');
    for var i := 1 to N-1 do write('──┼──'); write('──┤');
    for var j := 1 to N-1 do
    begin
        writeln;
        write('│',j:2,'│');
        for var i := 1 to N do write('  ',inp[j,i],' │');
        writeln;
        write('├──┼─');
        for var i := 1 to n-1 do write('───┼─');write('───┤');
    end;
    writeln;
    write('│',N:2,'│');
    for var i := 1 to N do write('  ',inp[n,i],' │');
    writeln;
    write('└──┴─');
    for var i := 1 to n-1 do write('───┴─');write('───┘'); 
    writeln;
end;
function CheckEuler(deg:mass):boolean;
var temp:boolean;
begin
    temp := true;
    for var i := 1 to N do
        if (deg[i] mod 2)<>0 then temp := false;
    CheckEuler := temp;
end;


procedure find_euler(inp:graph); 
//Поиск Эйлерова цикла
var
    S,Se,SS,E:byte; 
    rebra:graph;
    a:boolean;
begin
    randomize;
    for var i := 1 to N do
        for var j := 1 to N do 
            rebra[i,j] := 0;
    for var i := 1 to N do rebra[i,i] := 1;
    S := random(N)+1;
    Write('Эйлеров цикл:');
    write(S); //Стартовая вершина
    Se := s;
    SS := S;
    E := 0;
    while True do
    begin
        while True do
        begin
            Se := random(N)+1;
            if (Se = SS) and (E < 10) then 
            begin
                E := E + 1;
                continue;
            end;
            if rebra[S,Se] = 0 then
            begin
                E := 0;
                rebra[S,Se] := 1; rebra[Se,S] := 1;
                write('→',Se);
                break;
            end;
        end;
        S := Se;
        a := true;
//        writeln('==============');
//        Show(rebra);
        for var i := 1 to N do
            for var j := 1 to N do
                if rebra[i,j] = 0 then a := false;
        if a then break;
    end;
    
end;








begin
    write('Введите количество вершин: ');readln(N);
    InputGraph(input);
    clrscr;
    Show(input);
    getDeg(deg,input);
    if CheckEuler(deg) then find_euler(input)
    else Writeln('Эйлерова цикла не существует');
    writeln;
end.