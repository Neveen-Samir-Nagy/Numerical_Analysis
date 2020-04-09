classdef GaussJordan
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        A
        B
    end
    
    methods
        function obj = GaussJordan(inputA,inputB)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            obj.A = inputA;
            obj.B = inputB;
            
        end
        
        function [solution,time] = calculate(obj)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
             tic;
          FID = fopen('GaussJordan.txt', 'w');
         if FID == -1, error('Cannot create file.'); end
            matrix = [obj.A,obj.B];
            line = [matrix];
            fmt = [repmat('%15.10f ', 1, size(matrix,2)-1), '%15.10f\n'];
            fprintf(FID,fmt,matrix.');
            fprintf(FID,"\n");
            [n,m] = size(obj.A);
            for i=1 : n
                if matrix(i,i) ~= 1 %scaling
                    s = matrix(i,i);
                    matrix(i,:) = matrix(i,:)/s;
                    line = [matrix];
                    fprintf(FID,"  scaling: \n");
                    fprintf(FID,"R");
                    fprintf(FID,'%d',i);
                    fprintf(FID,"=");
                    fprintf(FID,"R");
                    fprintf(FID,'%d',i);
                    fprintf(FID,"/");
                    fprintf(FID,'%15.10f',s);
                    fprintf(FID,"\n");
                    fmt = [repmat('%15.10f ', 1, size(matrix,2)-1), '%15.10f\n'];
                    fprintf(FID,fmt,matrix.');
                    fprintf(FID,"\n");
                end
                for j =1 : n
                  if j ~= i
                       s=matrix(j,i);
                       matrix(j,:)=matrix(j,:)-matrix(i,:)*s;
                         fprintf(FID,"R");
                         fprintf(FID,'%d',j);
                         fprintf(FID,"=");
                         fprintf(FID,"R");
                         fprintf(FID,'%d',j);
                         fprintf(FID,"-");
                         fprintf(FID,"R");
                         fprintf(FID,'%d',i);
                         fprintf(FID,"*");
                         fprintf(FID,'%15.10f',s);
                       fprintf(FID,"\n");
                       fmt = [repmat('%15.10f ', 1, size(matrix,2)-1), '%15.10f\n'];
                       fprintf(FID,fmt,matrix.');
                       fprintf(FID,"\n");
                  end
                end
            end
            solution=matrix(:,n+1);
            line = [solution];
            fprintf(FID,"Solution: \n");
            fprintf(FID,'%15.10f%15.10f%15.10f%15.10f\n',line);
            fclose(FID);
            time = toc;
        end
    
    end
end