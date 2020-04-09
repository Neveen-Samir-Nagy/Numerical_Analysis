classdef False_position
    %FALSE_POSITION     Method
    properties
        equation
        iArray
        eArray
        xrArray
        xuArray
        timeArray
        xlArray
        xrEvaluateArray
        no_Iterations
        xl
        xu
    end
    
    methods
        function obj = False_position(equation,first,second)
            obj.xl = first;
            obj.xu = second;
            obj.equation = str2sym(equation);
        end
        function [y,errorabs,length,time] = solve(obj,handles,Equation ,eps, maxI,str)
            xrOld = 0;
            for i = 1 : maxI
                tic;
                if(str=="False" || str=="FalseF")
                    pause on;
                    pause(1.5);
                end
                if(obj.evaluate(obj.xl)*obj.evaluate(obj.xu) > 0)
                    return
                end
                fl = evaluate(obj,obj.xl);
                fu = evaluate(obj,obj.xu);
                xr = ((obj.xl*fu) - (obj.xu*fl))/(fu - fl);
                if(str=="False" || str=="FalseF")
                    cla(handles.axes,'reset');
                    funcHandle = str2func(['@(x)' Equation]);
                    x = linspace(obj.xl-1,obj.xu+1,100);
                    yfun = funcHandle(x);
                    plot(handles.axes,x,yfun,'LineWidth',2);
                    hold on;
                    y1 = get(gca,'ylim');
                    plot(handles.axes,[obj.xl obj.xu],[fl fu],'LineWidth',2);
                    plot(handles.axes,[xr xr],y1,'LineWidth',2);
                    hold on;
                end
                e = (abs((xr - xrOld)));
                obj.eArray(i) = e;
                obj.iArray(i) = i;
                obj.xrEvaluateArray(i) = evaluate(obj,xr);
                obj.xrArray(i) = xr;
                obj.xuArray(i) = obj.xu;
                obj.xlArray(i) = obj.xl;
                t = toc;
                obj.timeArray(i) = t;
                if(str=="False")
                    set(handles.edit5,'string',sprintf('%f',xr));
                    set(handles.edit6,'string',sprintf('%f',e));
                    set(handles.edit7,'string',sprintf('%d',i));
                    set(handles.edit8,'string',sprintf('%f',t));
                end
                if(str=="FalseF")
                     set(handles.edit8,'string',sprintf('%f',xr));
                set(handles.edit9,'string',sprintf('%f',e));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
                end
                if(fl*evaluate(obj,xr) < 0)
                    obj.xu = xr;
                elseif(fl*evaluate(obj,xr) > 0)
                    obj.xl = xr;
                else
                    obj.no_Iterations = i;
                    break;
                end
                if(e <= eps)
                    obj.no_Iterations = i;
                    break
                end
                xrOld = xr;
            end
            time = t;
            length = obj.iArray(end);
            errorabs = obj.eArray(end);
            y = xr;
            if(str=="ALL")
                x_F = obj.xrArray;
                y_F = obj.iArray;
                plot(handles.axes1,y_F,x_F,'-.r*','LineWidth',1.5);
                plot(handles.axes1,y_F,x_F,'LineWidth',1.5);
                hold on;
            end
            if(str=="ALL")
                x_B = obj.eArray;
                y_B = obj.iArray;
                plot(handles.axes2,y_B,x_B,'-.r*','LineWidth',1.5);
                plot(handles.axes2,y_B,x_B,'LineWidth',1.5);
                hold on;
            end
            line = [obj.iArray;obj.xlArray;obj.xuArray;obj.xrArray;obj.xrEvaluateArray;obj.eArray;obj.timeArray];
            FID = fopen('False_position.txt', 'w');
            fprintf(FID,"   steps    |       xl      |       xu      |       xr      |      f(xr)    | absolute error\n______________________________________________________________________________________________\n");
            fprintf(FID, '   %f | %15.10f | %15.10f | %15.10f | %15.10f | %15.10f | %15.10f \n ______________________________________________________________________________________________\n', line);
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

