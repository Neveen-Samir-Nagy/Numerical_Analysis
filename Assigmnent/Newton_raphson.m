classdef Newton_raphson
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xiold
        equation
        iArray
        eArray
        xrArray
        timeArray
        xlArray
        diffe
        no_Iterations
    end
    
    methods
        function obj = Newton_raphson(equation,initial)
            obj.xiold = initial;
            obj.equation = str2sym(equation);
            obj.diffe = diff(obj.equation);
        end
        function [y,errorabs,lengthOfiter,time] = solve(obj,handles,Equation ,eps, maxI,str)
            obj.xrArray(1) = obj.xiold;
            for i = 1 : maxI
                tic;
                if(str=="Newton" || str=="NewtonF")
                    pause on;
                    pause(1.5);
                end
                if(differen(obj,obj.xiold)== 0)
                    return
                end
                xinew = obj.xiold - (evaluate(obj,obj.xiold)/differen(obj,obj.xiold));
                if (str=="Newton" || str=="NewtonF")
                    cla(handles.axes,'reset');
                    funcHandle = str2func(['@(x)' Equation]);
                    x = linspace(obj.xiold-1,obj.xiold+1,100);
                    yfun = funcHandle(x);
                    plot(handles.axes,x,yfun,'LineWidth',2);
                    hold on;
                    y1 = get(gca,'ylim');
                    plot(handles.axes,[obj.xiold obj.xiold],y1,'LineWidth',2);
                    plot(handles.axes,[xinew xinew],y1,'LineWidth',2);
                    hold on;
                end
                e = (abs((xinew - obj.xiold)));
                obj.iArray(i) = i;
                obj.eArray(i) = e;
                obj.xlArray(i) = obj.xiold;
                obj.xrArray(i) = xinew;
                t = toc;
                obj.timeArray(i) = t;
                if (str=="Newton")
                    set(handles.edit5,'string',sprintf('%f',xinew));
                    set(handles.edit6,'string',sprintf('%f',e));
                    set(handles.edit7,'string',sprintf('%d',i));
                    set(handles.edit8,'string',sprintf('%f',t));
                end
                if (str=="NewtonF")
                    set(handles.edit8,'string',sprintf('%f',xinew));
                set(handles.edit9,'string',sprintf('%f',e));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
                end
                if(xinew==obj.xiold)
                    obj.no_Iterations = i;
                    break;
                end
                if(e <= eps)
                    obj.no_Iterations = i;
                    break;
                end
                obj.xiold = xinew;
            end
            time = t;
            lengthOfiter = obj.iArray(end);
            errorabs = obj.eArray(end);
            y = xinew;
            if(str=="ALL")
                x_F = obj.xrArray;
                y_F = obj.iArray;
                plot(handles.axes1,y_F,x_F,':bs','LineWidth',1.5);
                plot(handles.axes1,y_F,x_F,'LineWidth',1.5);
                hold on;
            end
            if(str=="ALL")
                x_B = obj.eArray;
                y_B = obj.iArray;
                plot(handles.axes2,y_B,x_B,':bs','LineWidth',1.5);
                plot(handles.axes2,y_B,x_B,'LineWidth',1.5);
                hold on;
            end
            line = [obj.iArray;obj.xlArray;obj.xrArray;obj.eArray;obj.timeArray];
            FID = fopen('NewtonRaphson.txt', 'w');
            fprintf(FID,"   steps    |      xiOld    |      xiNew    | absolute error | Time\n______________________________________________________________________________________________\n");
            fprintf(FID, '   %f | %08.10f | %08.10f | %08.10f | %08.10f \n ______________________________________________________________________________________________\n', line);
            fclose(FID);
            pause on;
            pause(2);
        end
        function v = evaluate(obj,x)
            v = subs(obj.equation,x);
        end
        function d = differen(obj,x)
            d = subs(obj.diffe,x);
        end
        function e = geteArray(obj)
            e = obj.eArray;
        end
        function i = getiArray(obj)
            i = obj.iArray;
        end
    end
end


