classdef Gauss_Elimination
    %Gauss_Elimination method

    
    properties
      A 
      b
    end
    
    methods
        function obj = Gauss_Elimination(A,b)
              obj.A = A;
              obj.b = b;
        end
        
        function [y,time] = solve(obj)
          obj.A = [obj.A obj.b];
          write(obj,"1")
          %gauss elimination process
         for i = 1 : size(obj.A,1) - 1
             tic;
           [M,I] = max(abs(obj.A(i:size(obj.A,1),i)));        %pivote
           obj.A([i I+i-1],:)=obj.A([I+i-1 i],:);
           scale = ["R" i "<->" "R" I+i-1];
           write(obj,join(scale))
           for j = i + 1 : size(obj.A,1)
               scale = ["R" j "-" string(obj.A(j,i)) "/" string(obj.A(i,i)) "*" "R" i];
               obj.A(j,:) = obj.A(j,:) - (obj.A(j,i)/obj.A(i,i))*obj.A(i,:);
               write(obj,join(scale));
           end
         end
         %solve
         obj.A = [obj.A; ones(1,size(obj.A,2))];
         for i = size(obj.A,1)-1 :-1: 1
            obj.A(i,:) = obj.A(i,:) / obj.A(i,i); 
            if(i == size(obj.A,1) - 1)
                obj.A(size(obj.A,1),i) = obj.A(i,size(obj.A,2));
            else
                obj.A(i,:) = obj.A(i,:).*obj.A(size(obj.A,1),:);
                obj.A(size(obj.A,1),i) = obj.A(i,size(obj.A,1)) - sum(obj.A(i,i+1 : size(obj.A,1)-1));
                
            end
         end
         time=toc;
         y = obj.A(size(obj.A,1),:);
         y(end) = [];
        end
     
        function write(obj, x)
            if x == "1"
               FID = fopen('Guass_Elimination.txt', 'w');
            else
               FID = fopen('Guass_Elimination.txt', 'a');
               fprintf(FID, '%s \n',x);  
            end
             if FID == -1, error('Cannot create file.'); end
                 fmt = [repmat('%15.10f ', 1, size(obj.A,2)-1), '|%15.10f\n'];
                 fprintf(FID,fmt,obj.A.');
                 fprintf(FID, '__________________________________________________________________\n'); 
                 fclose(FID);
        end
    end
end

