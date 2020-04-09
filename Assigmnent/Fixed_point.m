classdef Fixed_point<handle
    %FIXED_POINT Method
    properties
        equation
        diff_equation
        no_Iterations
        iArray
        eArray
        xroldArray
        timeArray
        xrnewArray
    end
    
    methods
        function obj = Fixed_point(equation)
            equation = str2sym(equation);
            [c,t] = coeffs(equation);
            idx = t=="x";
            t(idx)= [];
            c = c/-c(idx);
            c(idx)= [];
            u = 0;
            for i = 1: length(c)
                u = u + c(i)*t(i);
            end
            obj.equation = u;
            obj.diff_equation = diff(u);
        end
        function [y,errorabs,length,time] = solve(obj,handles,x0,maxI,es,str)
            xr = x0;
            xrOld = x0;
            if (abs(evaluatediff(obj,xr)) > 1)
                return
            else
                for i = 1 : maxI
                    tic;
                    if(str=="Fixed" || str=="FixedF")
                        pause on;
                        pause(1.5);
                    end
                    xr = evaluate(obj,xr);
                    if(str=="Fixed" || str=="FixedF")
                        cla(handles.axes,'reset');
                        GX = char(obj.getGX);
                        GX2 =  strrep(GX,'^','.^');
                        funcHandle = str2func(['@(x)' GX2]);
                        x = linspace(xr-1,xr+1,100);
                        yfun = funcHandle(x);
                        plot(handles.axes,x,yfun,'LineWidth',2);
                        hold on;
                        y2 = x;
                        plot(handles.axes,x,y2,'LineWidth',2);
                        hold on;
                        y1 = get(gca,'ylim');
                        plot(handles.axes,[xrOld xrOld],y1,'LineWidth',2);
                        hold on;
                    end
                    e = (abs((xr - xrOld)));
                    obj.iArray(i) = i;
                    obj.eArray(i) = e;
                    obj.xroldArray(i) = xrOld;
                    obj.xrnewArray(i) = xr;
                    t = toc;
                    obj.timeArray(i) = t;
                    if(str=="Fixed")
                        set(handles.edit5,'string',sprintf('%f',xr));
                        set(handles.edit6,'string',sprintf('%f',e));
                        set(handles.edit7,'string',sprintf('%d',i));
                        set(handles.edit8,'string',sprintf('%f',t));
                    end
                    if(str=="FixedF")
                        set(handles.edit8,'string',sprintf('%f',xr));
                        set(handles.edit9,'string',sprintf('%f',e));
                        set(handles.edit10,'string',sprintf('%d',i));
                        set(handles.edit21,'string',sprintf('%f',t));
                    end
                    if(xr==xrOld)
                        obj.no_Iterations = i;
                        break;
                    end
                    if(e <= es)
                        obj.no_Iterations = i;
                        break;
                    end
                    xrOld = xr;
                end
            end
            time = t;
            length = obj.iArray(end);
            errorabs = obj.eArray(end);
            y = xr;
            if(str=="ALL")
                x_F = obj.xroldArray;
                y_F = obj.iArray;
                plot(handles.axes1,y_F,x_F,'x','LineWidth',1.5);
                plot(handles.axes1,y_F,x_F,'LineWidth',1.5);
                hold on;
            end
            if(str=="ALL")
                x_B = obj.eArray;
                y_B = obj.iArray;
                plot(handles.axes2,y_B,x_B,'x','LineWidth',1.5);
                plot(handles.axes2,y_B,x_B,'LineWidth',1.5);
                hold on;
            end
            line = [obj.iArray;obj.xroldArray;obj.xrnewArray;obj.eArray;obj.timeArray];
            FID = fopen('Fixed_Point.txt', 'w');
            fprintf(FID,"   steps    |      xiOld    |      xiNew    | absolute error | Time\n______________________________________________________________________________________________\n");
            fprintf(FID, '   %f | %15.10f | %15.10f | %15.10f | %15.10f \n ______________________________________________________________________________________________\n', line);
            fclose(FID);
            pause on;
            pause(2);
        end
        function v = evaluate(obj,x)
            v = subs(obj.equation,x);
        end
        function v = evaluatediff(obj,x)
            v = subs(obj.diff_equation,x);
        end
        function v = getGX(obj)
            v = obj.equation;
        end
        function e = geteArray(obj)
            e = obj.eArray;
        end
        function i = getiArray(obj)
            i = obj.iArray;
        end
    end
end

