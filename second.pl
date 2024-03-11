%���� ������

country("USA", 9 147 593).
country("Brazil", 8 511 965).
country("India", 3 287 590).
country("Turkey", 780 580).
country("Russia", 17 234 035).

river("Amazonka", 7100).
river("Nil", 6670).
river("Yanzi", 6300).
river("Huanhe", 5500).
river("Enisei", 5238).

lake("Baykal", 1642).
lake("Tanganika", 1470).
lake("Vostok", 1200).
lake("San-Martin", 836).
lake("Nyasa", 706).

find_name:-
    write("������� �������� ��������������� �������"), nl,
    read(X),
    (   find_countryName(X), fileNameCountry(X), told; not(find_countryName(X))),
    (   find_riverName(X), fileNameRiver(X), told; not(find_riverName(X))),
    (   find_lakeName(X), fileNameLake(X), told; not(find_lakeName(X))).

find_countryName(Name):-
    country(Name,S),
    printtitle("������"),
    printss("��������", "�������, ��^2"),
    printsd(Name, S).

fileNameCountry(Name):-
    tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/foundcountry.txt'),
    find_countryName(Name);
    told.

find_riverName(Name):-
    river(Name,Z),
    printtitle("����"),
    printss("��������", "�����, ��"),
    printsd(Name, Z).

fileNameRiver(Name):-
    tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/foundriver.txt'),
    find_riverName(Name);
    told.

find_lakeName(Name):-
    lake(Name,Yy),
    printtitle("�����"),
    printss("��������", "�������, ��"),
    printsd(Name, Yy).

fileNameLake(Name):-
    tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/foundlake.txt'),
    find_lakeName(Name);
    told.

find_parametr:-
    format('������ ��: ~n1)������� (��2); ~n2)����� (��); ~n3)������� (��).~n'),
    read(Number),
    choice_parametr(Number).
find_parametr.

choice_parametr(Number):-
    (   Number=1, findS; Number\=1),
    (   Number=2, find_riverL; Number\=2),
    (   Number=3, find_lakeL; Number\=3).

print_diapazon:-
    format('������: ~n1)������ ������ �������; ~n2)������ ������� �������; ~n3)��������.~n').

print_min:-
    format('������� ������ �������:~n').

print_max:-
    format('������� ������� �������:~n').

findS:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), findS_file(1, Min,0),
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S), S>=Min,
        printsd(Name, S),
        fail; Num\=1),

    (   Num=2, print_max, read(Max), findS_file(2, 0,  Max),
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S), S=<Max,
        printsd(Name, S),
        fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        findS_file(3, Min,Max),
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S),
        fail; Num\=3).

find_riverL:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), find_riverL_file(1, Min,0),
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, print_max, read(Max), find_riverL_file(2, 0,  Max),
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        find_riverL_file(3, Min,Max),
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3).

find_lakeL:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), find_lakeL_file(1, Min,0),
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, print_max, read(Max), find_lakeL_file(2, 0,  Max),
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        find_lakeL_file(3, Min,Max),
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3).


printss(First,Second):-
    format('| ~t~s~t~15|| ~t~s~t~15+|~n', [First, Second]).

printsd(First,Second):-
    format('| ~t~s~t~15|| ~t~d~t~15+|~n', [First, Second]).

printtitle(Title):-
    write(" ----------------------------- "), nl,
    format('| ~t~s~t~30+|~n', [Title]),
    write("|-----------------------------|"), nl.


print_country:-
    printtitle("������"),
    printss("��������", "�������, ��^2"),
    country(X,Y),
    write("|-----------------------------|"), nl,
    printsd(X,Y), fail.



print_river:-
    printtitle("����"),
    printss("��������", "�����, ��"),
    river(X,Y),
    write("|-----------------------------|"), nl,
    printsd(X,Y), fail.

print_lake:-
    printtitle("����"),
    printss("��������", "�������, ��"),
    lake(X,Y),
    write("|-----------------------------|"), nl,
    printsd(X,Y), fail.

print:-
    print_country;
    print_river;
    print_lake;
    write(" ----------------------------- "), fail;
    print_file.
%print.

print_file:-
    (   tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/table.txt'),
    print_country;
    print_river;
    print_lake;
    write(" ----------------------------- "), fail);
    nl,
    told.

findS_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/found.txt'),
    write("����� �� ������� (��2)"), nl,
    (   Num=1, write("������ ������ �������: "), write(Min), nl,
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S), S>=Min,
        printsd(Name, S),
        fail; Num\=1),

    (   Num=2, write("������ ������� �������: "), write(Max), nl,
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S), S=<Max,
        printsd(Name, S),
        fail; Num\=2),

    (   Num=3, write("������ ������ �������: "), write(Min), nl, write("������ ������� �������: "), write(Max), nl,
        printtitle("������"),
        printss("��������", "�������, ��^2"),
        country(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S),
        fail; Num\=3));
    told.

find_riverL_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/found.txt'),
    write("����� �� ����� (��)"), nl,
    (   Num=1, write("������ ������ �������: "), write(Min), nl,
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, write("������ ������� �������: "), write(Max), nl,
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, write("������ ������ �������: "), write(Min), nl, write("������ ������� �������: "), write(Max), nl,
        printtitle("����"),
        printss("��������", "�����, ��"),
        river(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3));
    told.

find_lakeL_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/������������� ������/��� �����/found.txt'),
    write("����� �� ������� (��)"), nl,
    (   Num=1, write("������ ������ �������: "), write(Min), nl,
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, write("������ ������� �������: "), write(Max), nl,
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, write("������ ������ �������: "), write(Min), nl, write("������ ������� �������: "), write(Max), nl,
        printtitle("�����"),
        printss("��������", "�������, ��"),
        lake(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3));
    told.
