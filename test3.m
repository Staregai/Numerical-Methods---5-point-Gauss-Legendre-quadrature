fileID = 1;
%fileID = fopen('test3.txt','w');

fprintf(fileID , '%s\n' , "Test sprawdzający warunek stopu dwupunktowej kwadratury Gaussa-Legendere'a");
fprintf(fileID , '%s\n' , "poprzez obliczanie całki dla maxymalnego podziału na 1e7 przedziałów");
fprintf(fileID , '%s\n' , "i dokładności 1e-40. Sprawdzany jest również błąd przybliżenia");

pause;

tic;[y1,M1,del1]=P2Z09_IST_gaussleg2p(1,2,@(x)1./x,1,1e7,1e-40);t1=toc;
tic;[y2,M2,del2]=P2Z09_IST_gaussleg2p(0,pi,@(x)sin(x),1,1e7,1e-40);t2=toc;
tic;[y3,M3,del3]=P2Z09_IST_gaussleg2p(0,2,@(x)3.^x.*log(3),1,1e7,1e-40);t3=toc;
tic;[y4,M4,del4]=P2Z09_IST_gaussleg2p(1,3,@(x)1./x.^3,1,1e7,1e-40);t4=toc;

fprintf(fileID , '%16s %8s\t  %13s\t %10s\t %10s %10s\t\t %10s\t %10s\n' , "funkcja podcałkowa" , "[a,b]" , "oczekiwana wartość", "otrzymana wartość", "dokładność","błąd","ilosc podprzedziałów","czas(s)");
fprintf(fileID , '%16s\t %6s\t  %1.3e\t\t\t\t %1.3e\t\t\t %1.3e\t\t %1.3e\t %d\t\t\t\t\t\t %1.3e\n' , "1/x" , "[1,2]", log(2), y1, del1, abs(log(2)-y1), M1, t1);
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t\t %1.3e\t\t\t %1.3e\t\t %1.3e\t %d\t\t\t\t\t %1.3e\n' , "sin(x)" , "[0,pi]" , 2, y2, del2, abs(2-y2), M2,t2);
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t\t %1.3e\t\t\t %1.3e\t\t %1.3e\t %d\t\t\t\t\t\t %1.3e\n' , "3^x*log(3)" , "[0,2]" , 8, y3,del3, abs(8-y3), M3,t3);
fprintf(fileID , '%16s\t %6s\t  %1.3e\t\t\t\t %1.3e\t\t\t %1.3e\t\t %1.3e\t %d\t\t\t\t\t\t %1.3e\n' , "1/x^3" , "[1,3]" , 4/9, y4,del4, abs(4/9-y4), M4,t4);

%fclose(fileID);