classdef General2
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
   properties
        xiold
        equation
        iArray
        eArray 
        xrArray
        xlArray
        diffe
        no_Iterations
    end
    
    methods
        function obj = General(equation,initial)
            obj.xiold = initial;
            obj.equation = str2sym(equation);
            obj.diffe = diff(obj.equation);
        end
        function [y,errorabs,length] = solve(obj,handles,Equation ,eps, maxI)
          obj.xrArray(1) = obj.xiold;  
          if((differen(obj,obj.xiold)> 0 && differen(obj,obj.xiold)<-1))
                obj.addErrorMessage(handles);
                return
          end
          for i = 1 : maxI
               pause on;
               pause(1.5);
               fn = obj.xiold + evaluate(obj,obj.xiold);
               g = (evaluate(obj,fn)-evaluate(obj,obj.xiold))/evaluate(obj,obj.xiold);
               if(g==0)
                   return
               end
              xinew = obj.xiold - (evaluate(obj,obj.xiold)/g);
              cla(handles.axes,'reset');
              funcHandle = str2func(['@(x)' Equation]);
              x = linspace(obj.xiold-2,obj.xiold+2,100);
              yfun = funcHandle(x);
              plot(handles.axes,x,yfun,'LineWidth',2);
              hold on;
              y1 = get(gca,'ylim');
              plot(handles.axes,[obj.xiold obj.xiold],y1,'LineWidth',2);
              plot(handles.axes,[xinew xinew],y1,'LineWidth',2);
              hold on;
              e = abs(xinew - obj.xiold);
              obj.iArray(i) = i;
              obj.eArray(i) = e;  
              obj.xlArray(i) = obj.xiold;
              obj.xrArray(i) = xinew;
              if(xinew==obj.xiold)
                  obj.no_Iterations = i;
                  break;
              end
             if(e < eps)
                 obj.no_Iterations = i;
                 break;
             end
              obj.xiold = xinew;
          end
          length = obj.iArray(end);
          errorabs = obj.eArray(end);
          y = xinew;
          line = [obj.iArray;obj.xlArray;obj.xrArray;obj.eArray];
          FID = fopen('GeneralMethod.txt', 'w');
         fprintf(FID,"   steps    |      xiOld    |      xiNew    | absolute error\n______________________________________________________________________________________________\n");
         fprintf(FID, '   %f | %08.10f | %08.10f | %08.10f  \n ______________________________________________________________________________________________\n', line);
         fclose(FID);
        end
        function v = evaluate(obj,x)
            v = subs(obj.equation,x);
        end
        function d = differen(obj,x)
            d = subs(obj.diffe,x);
        end
    end
end