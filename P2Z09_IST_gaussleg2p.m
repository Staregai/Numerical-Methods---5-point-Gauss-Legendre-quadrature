function [y,M,del] = P2Z09_IST_gaussleg2p(a,b,f,m,mmax,delta, mnoznik)
% Projekt 2,zadanie 9
% Igor Staręga,320741
%
% numeryczne obliczanie całki funkcji f(x) na przedziale [a,b] przy użyciu
% złożonej 2-punktowej kwadratury Gaussa-Legendre'a z dokłądnością delta
%
% Wejście:
% a - początek przedziału całkowania
% b - koniec przedziału całkowania
% f - uchwyt do funkcji będący funkcją (wektorową) podcałkową
% m - początkowa ilość podprzedziałow, na którą dzielimy przedział [a,b]
% mmax - maksymalna wartość parametru m
% delta - parametr odpowiadający za dokładność kwadratury
% (różnica wartości bezwzględnych dwóch kolejnych
% przybliżeń ma być mniejsza od delta)
% mnoznik - parametr mówiący na ile razy więcej podprzedziałów mamy
% podzielić przedział przy sprawdzaniu dokładności (domyślna wartość: 2)
% w przypadku niecałkowitej wartości nowe m jest częścią całkowitą z
% iloczynu mnożnika i starego m
%
% Wyjście:
% sum - wartość całki uzyskana przy pomocy złożonej kwadratury Gaussa-Legendra o
% dokładności delta
% M - ilośc podprzedziałów, na którą podzielono przedział (a,b) aby uzyskać
% dokładność delta
% del - dokładność otrzymanego przybliżenia

% w celu ułatwienia wywoływania funkcji argument mnoznik ma podstwową
% wartość 2 (nie jest to arguent należący do "właściwej funkcji" lecz
% do jej modyfikacji)
arguments
    a,b,f,m,mmax,delta,mnoznik = 2
end

x0 = 1 / sqrt(3); % pierwszy węzeł kwadratury
x1 = -1 / sqrt(3); % drugi węzeł kwadratury
a0 = 1; % pierwszy współczynnik kwadratury
a1 = 1; % drugi współczynnik kwadratury
yprev = 0; % zmienna trzymająca wartość poprzedniego przybliżenia
M = m; % zmienna określająca na ile podprzedziałów dzielimy przedział [a,b]

% pętla while obliczająca kolejne przybliżenia aż nie przekroczymy
% maksymalnej wartości parametru M
while M <= mmax

    h = (b - a) / M; % zmienna pozwalająca wyznaczyć podprzedziały
    c = a:h:b - h; % wektor punktów zaczynających podprzedziały
    d = a + h:h:b; % wektor punktów kończących podprzedziały

    % obliczanie przybliżenia wartości całki przy użyciu 2-punktowej
    % kwadratury Gaussa-Legendre'a
    y = sum((d - c) ./ 2 .* ( ...
        a0 .* f((d - c) ./ 2 .* x0 + (c + d) ./ 2) + ...
        a1 .* f((d - c) ./ 2 .* x1 + (c + d) ./ 2)));

    del = abs(y-yprev); % dokładność otrzymanego przybliżenia

    % if przerywający pętlę while w przypadku gdy
    % dokładność jest mniejsza od delta
    if del < delta
        break;
    end

    M = floor(mnoznik * M); % zwiększenie liczby podprzedziałów
    yprev = y; % przepisanie wartości przybliżenia
end

if M > mmax
    % if ustawiający wartość M na poprawną jeżeli while
    % zakończył się przez przekroczenie możliwej ilości podprzedziałów
    M = ceil(M/mnoznik);
end

end % function