%база знаний

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
    write("Введите название географического объекта"), nl,
    read(X),
    (   find_countryName(X), fileNameCountry(X), told; not(find_countryName(X))),
    (   find_riverName(X), fileNameRiver(X), told; not(find_riverName(X))),
    (   find_lakeName(X), fileNameLake(X), told; not(find_lakeName(X))).

find_countryName(Name):-
    country(Name,S),
    printtitle("Страна"),
    printss("Название", "Площадь, км^2"),
    printsd(Name, S).

fileNameCountry(Name):-
    tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/foundcountry.txt'),
    find_countryName(Name);
    told.

find_riverName(Name):-
    river(Name,Z),
    printtitle("Река"),
    printss("Название", "Длина, км"),
    printsd(Name, Z).

fileNameRiver(Name):-
    tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/foundriver.txt'),
    find_riverName(Name);
    told.

find_lakeName(Name):-
    lake(Name,Yy),
    printtitle("Озеро"),
    printss("Название", "Глубина, км"),
    printsd(Name, Yy).

fileNameLake(Name):-
    tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/foundlake.txt'),
    find_lakeName(Name);
    told.

find_parametr:-
    format('Искать по: ~n1)площади (км2); ~n2)длине (км); ~n3)глубине (км).~n'),
    read(Number),
    choice_parametr(Number).
find_parametr.

choice_parametr(Number):-
    (   Number=1, findS; Number\=1),
    (   Number=2, find_riverL; Number\=2),
    (   Number=3, find_lakeL; Number\=3).

print_diapazon:-
    format('Задать: ~n1)только нижнюю границу; ~n2)только верхнюю границу; ~n3)интервал.~n').

print_min:-
    format('Задайте нижнюю границу:~n').

print_max:-
    format('Задайте верхнюю границу:~n').

findS:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), findS_file(1, Min,0),
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S), S>=Min,
        printsd(Name, S),
        fail; Num\=1),

    (   Num=2, print_max, read(Max), findS_file(2, 0,  Max),
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S), S=<Max,
        printsd(Name, S),
        fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        findS_file(3, Min,Max),
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S),
        fail; Num\=3).

find_riverL:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), find_riverL_file(1, Min,0),
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, print_max, read(Max), find_riverL_file(2, 0,  Max),
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        find_riverL_file(3, Min,Max),
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3).

find_lakeL:-
    print_diapazon,
    read(Num),
    (   Num=1, print_min, read(Min), find_lakeL_file(1, Min,0),
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
        lake(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, print_max, read(Max), find_lakeL_file(2, 0,  Max),
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
        lake(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, print_min, read(Min), print_max, read(Max),
        find_lakeL_file(3, Min,Max),
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
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
    printtitle("Страны"),
    printss("Название", "Площадь, км^2"),
    country(X,Y),
    write("|-----------------------------|"), nl,
    printsd(X,Y), fail.



print_river:-
    printtitle("Реки"),
    printss("Название", "Длина, км"),
    river(X,Y),
    write("|-----------------------------|"), nl,
    printsd(X,Y), fail.

print_lake:-
    printtitle("Озёра"),
    printss("Название", "Глубина, км"),
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
    (   tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/table.txt'),
    print_country;
    print_river;
    print_lake;
    write(" ----------------------------- "), fail);
    nl,
    told.

findS_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/found.txt'),
    write("Поиск по площади (км2)"), nl,
    (   Num=1, write("Задана нижняя граница: "), write(Min), nl,
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S), S>=Min,
        printsd(Name, S),
        fail; Num\=1),

    (   Num=2, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S), S=<Max,
        printsd(Name, S),
        fail; Num\=2),

    (   Num=3, write("Задана нижняя граница: "), write(Min), nl, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Страна"),
        printss("Название", "Площадь, км^2"),
        country(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S),
        fail; Num\=3));
    told.

find_riverL_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/found.txt'),
    write("Поиск по длине (км)"), nl,
    (   Num=1, write("Задана нижняя граница: "), write(Min), nl,
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, write("Задана нижняя граница: "), write(Min), nl, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Река"),
        printss("Название", "Длина, км"),
        river(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3));
    told.

find_lakeL_file(Num,Min,Max):-
    (   tell('C:/Users/79159/Desktop/NNGU/Представление знаний/мои проги/found.txt'),
    write("Поиск по глубине (км)"), nl,
    (   Num=1, write("Задана нижняя граница: "), write(Min), nl,
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
        lake(Name, S), S>=Min,
        printsd(Name, S), fail; Num\=1),

    (   Num=2, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
        lake(Name, S), S=<Max,
        printsd(Name, S), fail; Num\=2),

    (   Num=3, write("Задана нижняя граница: "), write(Min), nl, write("Задана верхняя граница: "), write(Max), nl,
        printtitle("Озеро"),
        printss("Название", "Глубина, км"),
        lake(Name, S),
        S>=Min,
        S=<Max,
        printsd(Name, S), fail; Num\=3));
    told.
