fileID = 1;
%fileID = fopen('test1.txt','w');

fprintf(fileID , '%s\n' , "Test sprawdzający rząd prostej dwupunktowej kwadratury Gaussa-Legendere'a");
fprintf(fileID , '%s\n' , "poprzez obliczanie całki dla wielomianów róznych stopni");
fprintf(fileID , '%s\n' , "(kwadratura powinna być stopnia 4, więc powinna ");
fprintf(fileID , '%s\n\n' , "być dokładna dla wielomianów co najwyżej trzeciego stopnia)");

pause;

[y1,M1,del1]=P2Z09_IST_gaussleg2p(0,1,@(x)1,1,1,1e-13);
[y2,M2,del2]=P2Z09_IST_gaussleg2p(3,5,@(x)x+2,1,1,1e-13);
[y3,M3,del3]=P2Z09_IST_gaussleg2p(2,4,@(x)2.*x+1,1,1,1e-13);
[y4,M4,del4]=P2Z09_IST_gaussleg2p(1,5,@(x)x./2,1,1,1e-13);

fprintf(fileID , '%s\n' , "całki wielomianów stopnia 0 i 1");
fprintf(fileID , '%16s %8s\t  %13s\t %10s\n' , "funkcja podcałkowa" , "[a,b]" , "oczekiwana wartość", "otrzymana wartość");
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t\t %d\n' , "1" , "[0,1]", 1, y1);
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t %d\n' , "x+2" , "[3,5]" , 12, y2);
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t %d\n' , "2*x+1" , "[2,4]" , 14, y3);
fprintf(fileID , '%16s\t %6s\t  %d\t\t\t\t\t\t %d\n\n' , "x/2" , "[1,5]" , 6, y4);

pause

[y1,M,del]=P2Z09_IST_gaussleg2p(3,5,@(x)x.^2,1,1,1e-13);
[y2,M,del]=P2Z09_IST_gaussleg2p(1,2,@(x)x.^2+1,1,1,1e-13);
[y3,M,del]=P2Z09_IST_gaussleg2p(0,2,@(x)3.*x.^2+x./2,1,1,1e-13);
[y4,M,del]=P2Z09_IST_gaussleg2p(4,8,@(x)5.*x.^2+4.*x-5,1,1,1e-13);

fprintf(fileID , '%s\n' , "całki wielomianów stopnia 2");
fprintf(fileID , '%16s %8s\t  %13s\t %10s\n' , "funkcja podcałkowa" , "(a,b)" , "oczekiwana wartość", "otrzymana wartość");
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t %1.3f\n', "x^2" , "(3,5)", 98/3, y1);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t\t %1.3f\n', "x^2+1" , "(1,2)" , 10/3, y2);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t\t %1.3f\n', "3*x^2+x/2" , "(0,2)" , 9, y3);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t %1.3f\n\n', "5*x^2+4*x-5" , "(4,8)" , 2468/3, y4);

pause;

[y1,M,del]=P2Z09_IST_gaussleg2p(3,5,@(x)x.^3,1,1,1e-13);
[y2,M,del]=P2Z09_IST_gaussleg2p(1,2,@(x)x.^3-x.^2,1,1,1e-13);
[y3,M,del]=P2Z09_IST_gaussleg2p(0,2,@(x)2.*x.^3+x,1,1,1e-13);
[y4,M,del]=P2Z09_IST_gaussleg2p(4,8,@(x)x.^3+5.*x.^2-2.*x-7,1,1,1e-13);

fprintf(fileID , '%s\n' , "całki wielomianów stopnia 3");
fprintf(fileID , '%16s %8s\t  %13s\t %10s\n' , "funkcja podcałkowa" , "(a,b)" , "oczekiwana wartość", "otrzymana wartość");
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t %1.3f\n', "x^3" , "(3,5)", 136, y1);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t\t %1.3f\n', "x^3-x^2" , "(1,2)" , 17/12, y2);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t %1.3f\n', "2*x^3+x" , "(0,2)" , 10, y3);
fprintf(fileID , '%16s\t %6s\t  %1.3f\t\t\t\t %1.3f\n\n', "x^3+5*x^2-2*x-7" , "(4,8)" , 4892/3, y4);

%fclose(fileID);