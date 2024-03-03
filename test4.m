fileID = 1;
%fileID = fopen('test4.txt','w');

fprintf(fileID , '%s\n' , "Test sprawdzający jak różne wartości mnożnika wpływają na");
fprintf(fileID , '%s\n' , "dokładność kwadratury oraz błąd przybliżenia");
fprintf(fileID , '%s\n' , "wszystkie testy przeprowadzone są na całce z funkcji 9*x^8 na przedziale [1,2]");

pause;

tic;[y125,M125,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,1.25);t125=toc;  
tic;[y15,M15,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,1.5);t15=toc; 
tic;[y2,M2,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40);t2=toc; 
tic;[y25,M25,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,2.5); t25=toc; 
tic;[y3,M3,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,3); t3=toc; 
tic;[y35,M35,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,3.5); t35=toc; 
tic;[y4,M4,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,4); t4=toc; 
tic;[y45,M45,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,4.5); t45=toc; 
tic;[y5,M5,d]=P2Z09_IST_gaussleg2p(1,2,@(x)9.*x.^8,4,1e7,1e-40,5); t5=toc;  

fprintf(fileID , '%16s\t %8s\t %10s\t %10s\n ',"wartośc mnożnika", "czas (s)", "ilość podprzedziałów", "błąd przybliżenia");
fprintf(fileID , '\t%s\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"1.25",t125, M125, abs(511-y125));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"1.5",t15, M15, abs(511-y15));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t\t %1.3e\n',"2.0",t2, M2, abs(511-y2));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"2.5",t25,M25, abs(511-y25));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"3.0",t3,M3,abs(511-y3));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"3.5",t35, M35, abs(511-y35));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"4.0",t4, M4, abs(511-y4));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"4.5",t45, M45, abs(511-y45));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"5.0",t5, M5, abs(511-y5));
fprintf(fileID , '\t%s\t\t\t\t %1.3e\t %d\t\t\t\t %1.3e\n',"5.0",t16, M16, abs(511-y16));

%fclose(fileID);