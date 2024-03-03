function [y,M,del] = gaussleg5p(a,b,f,m,mmax,delta)
% Projekt 2,zadanie 9 (funkcja potrzebna do testu numerycznego)
% Igor Staręga,320741
%
% numeryczne obliczanie całki funkcji f(x) na przedziale [a,b] przy użyciu
% złożonej 5-punktowej kwadratury Gaussa-Legendre'a z dokłądnością delta
%
% Wejście:
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% f - uchwyt do funkcji będący funkcją (wektorową) podcałkową
% m - początkowa ilość podprzedziałow, na którą dzielimy przedział (a,b)
% mmax - maksymalna wartość parametru m
% delta - parametr odpowiadający za dokładność kwadratury
% (różnica wartości bezwzględnych dwóch kolejnych
% przybliżeń ma być mniejsza od delta)
%
% Wyjście:
% sum - wartość całki uzyskana przy pomocy złożonej kwadratury Gaussa-Legendra o
% dokładności delta
% M - ilośc podprzedziałów, na którą podzielono przedział (a,b) aby uzyskać
% dokładność delta
% del - dokładność otrzymanego przybliżenia

x0 = 0; % pierwszy węzeł kwadratury
x1 = 1/3 * sqrt(5 - 2 * sqrt(10/7)); % drugi węzeł kwadratury
x2 = -1/3 * sqrt(5 - 2 * sqrt(10/7)); % trzeci węzeł kwadratury
x3 = 1/3 * sqrt(5 + 2 * sqrt(10/7)); % czwarty węzeł kwadratury
x4 = -1/3 * sqrt(5 + 2 * sqrt(10/7)); % piąty węzeł kwadratury
a0 = 128/225; % pierwszy współczynnik kwadratury
a1 = (322 + 13 * sqrt(70))/900; % drugi współczynnik kwadratury
a2 = (322 + 13 * sqrt(70))/900; % trzeci współczynnik kwadratury
a3 = (322 - 13 * sqrt(70))/900; % czwarty współczynnik kwadratury
a4 = (322 - 13 * sqrt(70))/900; % piąty współczynnik kwadratury
yprev = 0; % zmienna trzymająca wartość poprzedniego przybliżenia
M = m; % zmienna określająca na ile podprzedziałów dzielimy przedział [a,b]

% pętla while obliczająca kolejne przybliżenia aż nie przekroczymy
% maksymalnej wartości parametru M
while M <= mmax

    h = (b - a) / M; % zmienna pozwalająca wyznaczyć podprzedziały
    c = a:h:b - h; % wektor punktów zaczynających podprzedziały
    d = a + h:h:b; % wektor punktów kończących podprzedziały

    % obliczanie przybliżenia wartości całki przy użyciu 5-punktowej
    % kwadratury Gaussa-Legendre'a
    y = sum((d - c) ./ 2 .* ( ...
        a0 .* f((d - c) ./ 2 .* x0 + (c + d) ./ 2) + ...
        a1 .* f((d - c) ./ 2 .* x1 + (c + d) ./ 2) + ...
        a2 .* f((d - c) ./ 2 .* x2 + (c + d) ./ 2) + ...
        a3 .* f((d - c) ./ 2 .* x3 + (c + d) ./ 2) + ...
        a4 .* f((d - c) ./ 2 .* x4 + (c + d) ./ 2)));

    del = abs(y-yprev); % dokładność otrzymanego przybliżenia

    % if przerywający pętlę while w przypadku gdy
    % dokładność jest mniejsza od delta
    if del < delta
        break;
    end

    M = floor(2 * M); % zwiększenie liczby podprzedziałów
    yprev = y; % przepisanie wartości przybliżenia
end

if M > mmax
    % if ustawiający wartość M na poprawną jeżeli while
    % zakończył się przez przekroczenie możliwej ilości podprzedziałów
    M = M/2;
end

end % function