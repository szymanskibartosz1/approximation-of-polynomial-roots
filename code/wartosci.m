function [wartosc_funkcji, wartosc_pierwszej_pochodnej, wartosc_drugiej_pochodnej] = wartosci(a, x)
    % Funkcja obliczająca wartość wielomianu o wspołczynnikach a reprezentowanego w bazie
    % wielomianów Czebyszewa I-go rodzaju oraz wartość jego pierwszej i
    % drugiej pochodnej w punkcie x

    % Dla wielomianu o jednym wyrazie wartoćś funkcji to po prostu
    % współczynnik, a pozostałe wyrazy są równe 0
    if length(a) == 1
        wartosc_funkcji = a;
        wartosc_pierwszej_pochodnej = 0;
        wartosc_drugiej_pochodnej = 0;
        return;
    % Analogicznie dla przypadku o dwóch wyrazach
    elseif length(a) == 2
        wartosc_funkcji = a(1) + x*a(2);
        wartosc_pierwszej_pochodnej = a(2);
        wartosc_drugiej_pochodnej = 0;
        return;
    end
    % Dla wyrazów o liczbie wyrazów większej od 3:
    % Zapisujemy dwa pierwsze czynniki wielomianu Czebyszewa, jego
    % pochodnych oraz drugich pochodnych do wyliczania późniejszych
    % wartości
    T_minus2 = 1;
    T_minus1 = x;
    pochodna_T_minus2 = 0;
    pochodna_T_minus1 = 1;
    druga_pochodna_T_minus2 = 0;
    druga_pochodna_T_minus1 = 0;
    wartosc_funkcji = T_minus2 * a(1) + T_minus1 * a(2);
    wartosc_pierwszej_pochodnej = a(2);
    wartosc_drugiej_pochodnej = 0;

    for i = 3:length(a)
        T_aktualne = 2*x*T_minus1 - T_minus2; % Obliczamy T_i przy kolejnym współczynniku wielomianu
        pochodna_aktualne = 2*(T_minus1+x*pochodna_T_minus1)-pochodna_T_minus2; % Analogicznie dla pochodnej
        druga_pochodna_aktualne = 2 * pochodna_T_minus1 + 2 * (pochodna_T_minus1 + x * druga_pochodna_T_minus1) - druga_pochodna_T_minus2; % Oraz drugiej pochodnej
        wartosc_funkcji = wartosc_funkcji + a(i)*T_aktualne; % Wyliczamy wartośc funkcji wykorzystując policzone T_i
        wartosc_pierwszej_pochodnej = wartosc_pierwszej_pochodnej + a(i) * pochodna_aktualne; % I powtarzamy to dla pochodnej
        wartosc_drugiej_pochodnej = wartosc_drugiej_pochodnej + a(i) * druga_pochodna_aktualne; % Oraz drugiej pochodnej
        % Następnie aktualizujemy zapisywane wartości, żeby wykorzystać je
        % w kolejnej pętli
        T_minus2 = T_minus1;
        T_minus1 = T_aktualne;
        pochodna_T_minus2 = pochodna_T_minus1;
        pochodna_T_minus1 = pochodna_aktualne;
        druga_pochodna_T_minus2 = druga_pochodna_T_minus1;
        druga_pochodna_T_minus1 = druga_pochodna_aktualne;
    end
end