%TEST 1; n = 3
a = [2,5,1] % Postać standardowa: 2x^2 + 5x + 1
a_s = [2,5,1] % Współczynniki wielomianu w bazie standardowej
x = 1 % Przybliżenie początkowe
przyblizone_miejsce_zerowe = przybliz([2,5,1],1) % Miejsce zerowe wyznaczone naszym algorytmem
matlab = roots(a_s) % Miejsca zerowe wyznaczone funkcją roots
roznica = matlab - przyblizone_miejsce_zerowe %0
%Pozostale testy przeprowadzane są analogicznie

%Test 2; n = 5
a = [0,7,2,9,0] % Postać standardowa 36x^3 + 4x^2 - 20x -2
a_s = [36,4,-20,-2]
x = -2
przyblizone_miejsce_zerowe = przybliz(a,x)
matlab = roots(a_s)
roznica = matlab - przyblizone_miejsce_zerowe %0

%Test 3; n = 7
a = [9, 11 , 3, 21 ,0 ,621 ,11]
a_s = [352,9936,-528,-12336,204,3053,-5] % Postać standardowa 352x^6 + 9936x^5 -528x^4 - 12336x^3 + 204x^2 + 3053x -5
x = 832
przyblizone_miejsce_zerowe = przybliz(a,x)
matlab = roots(a_s)
roznica = matlab - przyblizone_miejsce_zerowe %0.000000000000002 

%Test 4; n = 9
a = [0,54,-43,21,-2,43,4,-1,2]
a_s = [256,-1216,128,1664,-208,-1072,2,231,37] % Postać standardowa 256x^8 - 1216x^7 + 128x^6 + 1664x^5 -208x^4 - 1072x^3 + 2x^2 + 231x + 37
x = 0
przyblizone_miejsce_zerowe = przybliz(a,x)
matlab = roots(a_s)
matlab = matlab(imag(matlab) == 0)
roznica = matlab - przyblizone_miejsce_zerowe %0.014399071753086

%Test 5;
a = [-1,-2,-75,-11,-2,43]
a_s = [128,688,-208,-904,-62,246,68] % Postać standardowa 128x^6 + 688x^5 -208x^4 - 904x^3 - 62x^2 + 246x + 68
x = 0.5
przyblizone_miejsce_zerowe = przybliz(a,x)
matlab = roots(a_s);
matlab = matlab(imag(matlab) == 0)
roznica2 = matlab - przyblizone_miejsce_zerowe %  0.003073458042283


%Test6
a = [2.3,-11.3,0.4,-3.9]
a_s = [-15.6,0.8,0.4,1.9] % Postać standardowa  2.7x^3 + 0.4x^2 - 0.8x - 15.6
x = 12
przyblizone_miejsce_zerowe = przybliz(a,x)
matlab = roots(a_s);
matlab = matlab(imag(matlab) == 0)
roznica = matlab - przyblizone_miejsce_zerowe %  Różnica -4.440892098500626e-16

% Wykres

wa = [0,0,0.000000000000002,0.014399071753086, 0.003073458042283,-4.440892098500626*10^(-16)];
plot(1:6, wa, 'o-', 'LineWidth', 2, 'MarkerFaceColor', 'blue'); % Grubsza linia
hold on; % Zachowuje aktualny wykres na osiach
scatter(x, wa, 'filled'); % Kropki zamalowane
hold off; % Kończy zachowywanie wykresu na osiach

% Dostosowanie osi x
xlim([0.5, 6.5]); % Rozciąga osie x, aby kropki były równomiernie rozmieszczone
xticks(1:6); % Ustawia oznaczenia na osi x co jeden

% Dodanie etykiet i tytułu
xlabel('Numer testu'); 
ylabel('Różnica między przybliżeniem za pomocą funkcji roots, a implementacją');
title('Porównanie funkcji roots do zaimplementowanej metody Halleya');

% Dodanie siatki
grid on;



hold off

% II Test 

% Inicjalizacja wektora wyników
wyniki = zeros(1, 100);

% Utworzenie figury
figure;
hold on; % Zachowuje aktualny wykres na osiach

% Ustawienia wstępne wykresu
xlim([0.5, 100.5]); % Rozciąga osie x, aby kropki były równomiernie rozmieszczone
ylim([-10^(-14), 10^(-14)]); % Ustawienie zakresu osi y
xticks(1:100); % Ustawia oznaczenia na osi x co jeden

% Dodanie etykiet i tytułu
xlabel('Numer testu'); 
ylabel('Wartosc funkcji w przybliżonym punkcie');
title('Wartości funkcji w przybliżonych punktach');

% Dodanie siatki
grid on;

% Pętla do obliczania wyników i animowania wykresu
for i = 1:100
    wektor = randi(10, 1, 4);
    x = rand();
    y = przybliz(wektor, x);
    wyniki(i) = wartosci(wektor, y);
    
    % Aktualizacja wykresu
    scatter(i, wyniki(i), 'filled', 'MarkerFaceColor', 'blue'); % Zamalowana kropka
    drawnow; % Odświeża wykres
    
    % Pauza dla efektu animacji
    pause(0.1); % Pauza 0.1 sekundy
end

hold off; % Kończy zachowywanie wykresu na osiach

