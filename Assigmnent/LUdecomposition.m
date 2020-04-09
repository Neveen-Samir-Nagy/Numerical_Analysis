classdef LUdecomposition
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        A
        B
        L
        U
        D
        X
        FID
    end
    
    methods
        function obj = LUdecomposition(inputA)
            obj.A= inputA;
         end
        
        function [solution,time] = solve(obj,inputB)
            tic;
           obj.FID = fopen('LUdecomposition.txt', 'w');
           if obj.FID == -1, error('Cannot create file.'); end
           obj.B= inputB;
           [obj.L,obj.U]= obj.calculateLU();
           obj.D =obj.getD();
           obj.X= obj.getX();
           solution = obj.X;
           time = toc;
        end
        function [L,U] = calculateLU(obj)
            fprintf(obj.FID,"Calculate U & L: \n");
            A1= obj.A;
            [n,m] = size(A1);
            for i=1 : n-1
                for j = i+1 :n
                    s = A1(j,i)/A1(i,i);
                    A1(j,:)=A1(j,:)-A1(i,:)*s;
                    fmt = [repmat('%15.10f ', 1, size(A1,2)-1), '%15.10f\n'];
                    fprintf(obj.FID,fmt,A1.');
                    fprintf(obj.FID,"\n");
                    L(j,i) = s;
                end
                fprintf(obj.FID,"\n L");
                fprintf(obj.FID,'%d',j);
                fprintf(obj.FID,'%d ',i);
                fprintf(obj.FID," = ");
                fprintf(obj.FID,'%15.10f ',s);
                fprintf(obj.FID,"\n");
            end
                for i=1 :n
                    for j=1 :n
                        if(i == j)
                         L(i,j) = 1;
                        end
                        if(j > i)
                          L(i,j) = 0;   
                        end
                    end
                end
                U = A1;
                fprintf(obj.FID,"U : \n");
                fmt = [repmat('%15.10f ', 1, size(U,2)-1), '%15.10f\n'];
                fprintf(obj.FID,fmt,U.');
                fprintf(obj.FID,"\n L : \n");
                fmt = [repmat('%15.10f ', 1, size(L,2)-1), '%15.10f\n'];
                fprintf(obj.FID,fmt,L.');
                fprintf(obj.FID,"\n");
        end
        function d = getD(obj)
            fprintf(obj.FID,"Calculate D: \n");
            A1 = obj.L;
            B1 = obj.B;
            [n,m] = size(A1);     
            for i=1 : n
                if i == 1
                   d(i) = B1(i); 
                   fprintf(obj.FID,"d1 = ");
                   fprintf(obj.FID,'%15.10f ',B1(i)); 
                   fprintf(obj.FID,"\n");
                else
                   s=0;
                   for j=1 : i-1
                       s = s + d(j) * A1(i,j);
                   end
                   d(i) = B1(i) - s;
                   fprintf(obj.FID,"d");
                   fprintf(obj.FID,'%d',i);
                   fprintf(obj.FID," = ");
                   fprintf(obj.FID,'%15.10f ',B1(i));
                   fprintf(obj.FID," - " );
                   fprintf(obj.FID,'%15.10f ',s);
                   fprintf(obj.FID," = ");
                   fprintf(obj.FID,'%15.10f ',d(i));
                   fprintf(obj.FID,"\n");
                end

            end
            fprintf(obj.FID,"\n D = \n");
            fmt = [repmat('%15.10f ', 1, size(d,2)-1), '%15.10f\n'];
            fprintf(obj.FID,fmt,d.');
            
        end
        function x = getX(obj)
            fprintf(obj.FID,"\n calculate X: \n");
            A1 = obj.U;
            D1 = obj.D;
            [n,m] = size(A1);
            for i=n :-1 :1
                k =0;
                if i == n
                    x(i) = D1(i)/A1(i,i);
                    fprintf(obj.FID,"x");
                    fprintf(obj.FID,'%d',i);
                    fprintf(obj.FID," = (");
                    fprintf(obj.FID,'%15.10f ',D1(i));
                    fprintf(obj.FID," / " );
                    fprintf(obj.FID,'%15.10f ',A1(i,i));
                    fprintf(obj.FID," = ");
                    fprintf(obj.FID,'%15.10f ', x(i));
                    fprintf(obj.FID," \n");
                else
                for j =n :-1: i
                    k = k+ A1(i,j) * x(j);
                end
                s= D1(i) - k;
                x(i) = s/A1(i,i);
                fprintf(obj.FID,"x");
                fprintf(obj.FID,'%d',i);
                fprintf(obj.FID," = (");
                fprintf(obj.FID,'%15.10f ',D1(i));
                fprintf(obj.FID," - " );
                fprintf(obj.FID,'%15.10f ',k);
                fprintf(obj.FID,") / " );
                fprintf(obj.FID,'%15.10f ',A1(i,i));
                fprintf(obj.FID," = ");
                fprintf(obj.FID,'%15.10f ', x(i));
                fprintf(obj.FID," \n");
                end
            end
            fprintf(obj.FID,"\n solution = \n");
            fmt = [repmat('%15.10f ', 1, size(x,2)-1), '%15.10f\n'];
            fprintf(obj.FID,fmt,x.');
        end
        end
end


