classdef ClassBisection<handle
    % bisection method
    properties
        xl
        xu
        equation
        eArray
        xrArray
        iArray
        xuArray
        xlArray
        timeArray
        no_Iterations
    end
    
    methods
        function obj = ClassBisection(equation,first,second)
            obj.xl = first;
            obj.xu = second;
            obj.equation = str2sym(equation);
        end
        function [y,errorabs,lengthIter,time] = solve(obj,handles,Equation ,eps, maxI,str)
            xrOld = 0;
            for i = 1 : maxI
                tic;
                if(str=="Bisection" || str=="BisectionF" || str=="General")
                    pause on;
                    pause(1.5);
                end
                if(obj.evaluate(obj.xl)*obj.evaluate(obj.xu) > 0)
                    return
                end
                xr = (obj.xl+obj.xu)/2;
                if(str=="Bisection" || str=="BisectionF" || str=="General")
                    cla(handles.axes,'reset');
                    funcHandle = str2func(['@(x)' Equation]);
                    x = linspace(obj.xl-1,obj.xu+1,100);
                    yfun = funcHandle(x);
                    plot(handles.axes,x,yfun,'LineWidth',2);
                    hold on;
                    y1 = get(gca,'ylim');
                    plot(handles.axes,[obj.xl obj.xl],y1,'LineWidth',2);
                    plot(handles.axes,[obj.xu obj.xu],y1,'LineWidth',2);
                    plot(handles.axes,[xr xr],y1,'LineWidth',2);
                    hold on;
                end
                e = (abs((xr - xrOld)));
                obj.iArray(i) = i;
                obj.eArray(i) = e;
                obj.xrArray(i) = xr;
                obj.xuArray(i) = obj.xu;
                obj.xlArray(i) = obj.xl;
                t= toc;
                obj.timeArray(i) = t;
                if(str=="Bisection")
                    set(handles.edit5,'string',sprintf('%f',xr));
                    set(handles.edit6,'string',sprintf('%f',e));
                    set(handles.edit7,'string',sprintf('%d',i));
                    set(handles.edit8,'string',sprintf('%f',t));
                end
                if(str=="BisectionF")
                    set(handles.edit8,'string',sprintf('%f',xr));
                    set(handles.edit9,'string',sprintf('%f',e));
                    set(handles.edit10,'string',sprintf('%d',i));
                    set(handles.edit21,'string',sprintf('%f',t));
                end
                if(str=="General")
                    set(handles.edit12,'string',sprintf('%f',xr));
                    set(handles.edit13,'string',sprintf('%f',e));
                    set(handles.edit14,'string',sprintf('%d',i));
                    set(handles.edit15,'string',sprintf('%f',t));
                end
                if(evaluate(obj,obj.xl)*evaluate(obj,xr) < 0)
                    obj.xu = xr;
                elseif(evaluate(obj,obj.xl)*evaluate(obj,xr) > 0)
                    obj.xl = xr;
                else
                    obj.no_Iterations = i;
                    break;
                end
                if(e <= eps)
                    obj.no_Iterations = i;
                    break;
                end
                xrOld = xr;
            end
            y = xr;
            time = t;
            lengthIter = obj.iArray(end);
            errorabs = obj.eArray(end);
            if(str=="ALL")
                x_B = obj.eArray;
                y_B = obj.iArray;
                plot(handles.axes2,y_B,x_B,'o','LineWidth',1.5);
                plot(handles.axes2,y_B,x_B,'LineWidth',1.5);
                hold on;
            end
            if(str=="ALL")
                x_F = obj.xrArray;
                y_F = obj.iArray;
                plot(handles.axes1,y_F,x_F,'o','LineWidth',1.5);
                plot(handles.axes1,y_F,x_F,'LineWidth',1.5);
                hold on;
            end
            line = [obj.iArray;obj.xlArray;obj.xuArray;obj.xrArray;obj.eArray;obj.timeArray];
            FID = fopen('Bisection.txt', 'w');
            fprintf(FID,'   steps    |       xl      |       xu      |       xr    | absolute error | Time \n');
            fprintf(FID, '   %f | %08.10f | %08.10f | %08.10f | %08.10f | %08.10f \n ______________________________________________________________________________________________\n', line);
            fclose(FID);
            pause on;
            pause(2);
        end
        function v = evaluate(obj,x)
            v = subs(obj.equation,x);
        end
        function e = geteArray(obj)
            e = obj.eArray;
        end
        function i = getiArray(obj)
            i = obj.iArray;
        end
    end
end

