classdef Birge_vieta
    %FALSE_POSITION     Method
    properties
        equation
        xrArray
        xArray
        eArray
        aArray
        iArray
        bArray
        cArray
        tArray
        no_Iterations
        xr
        deg
        roots
    end
    
    methods
        function obj = Birge_vieta(equation,xr)
            obj.equation = str2sym(equation);
            obj.deg = polynomialDegree(obj.equation);
            obj.xr = xr;
            obj.roots = 1;
        end
        function [y,errorabs,iteration,time] = solve(obj,handles,Equation ,es, maxI,str)
            a = coeffs(obj.equation);
            a=fliplr(a);
            new_deg = obj.deg;
            xrnew = obj.xr;
            c_arr = [];
            b_arr = [];
            a_arr = [];
            x_arr = [];
            t_arr = [];
            for j = 1 : maxI
                tic;
                if(str=="Bierge")
                    pause on;
                    pause(1.5);
                end
                c_arr = [];
                b_arr = [];
                a_arr = [];
                x_arr = [];
                t_arr = [];
                if(length(obj.xrArray)==new_deg)
                    break;
                end
                xOld = xrnew;
                for k = 1 :  length(a)
                    a_arr(k) = a(k);
                    if (k == 1)
                        t_arr(k) = "";
                        b_arr(k) = a(k);
                        c_arr(k) = a(k);
                    else
                        b_arr(k) = a(k) + xrnew * b_arr(k-1);
                        index = k-1;
                        if(k < length(a))
                            t_arr(k) = "";
                            c_arr(k) = b_arr(k) + xrnew * c_arr(index);
                        else
                            c_arr(k) = "";
                        end
                    end
                    x_arr(k) = xOld;
                end
                if(str=="Bierge")
                    cla(handles.axes,'reset');
                    funcHandle = str2func(['@(x)' Equation]);
                    x = linspace(xrnew-1,xrnew+1,100);
                    yfun = funcHandle(x);
                    plot(handles.axes,x,yfun,'LineWidth',2);
                    hold on;
                    y1 = get(gca,'ylim');
                    plot(handles.axes,[xrnew xrnew],y1,'LineWidth',2);
                    hold on;
                end
                xrnew = xrnew - b_arr(k)/c_arr(index);
                e = (abs((xrnew - xOld)));
                obj.aArray = [obj.aArray,a_arr];
                obj.bArray = [obj.bArray,b_arr];
                obj.cArray = [obj.cArray,c_arr];
                iteration = j;
                obj.iArray = [obj.iArray,j];
                errorabs = e;
                obj.xArray = [obj.xArray,x_arr];
                t= toc;
                t_arr(end + 1) = t;
                obj.tArray = [obj.tArray,t_arr];
                if(str=="Bierge")
                    set(handles.edit7,'string',sprintf("|"+'%f'+"|",xrnew));
                    set(handles.edit8,'string',sprintf('%f',e));
                    set(handles.edit9,'string',sprintf('%d',j));
                    set(handles.edit10,'string',sprintf('%f',t));
                end
                if(b_arr(end)==0)
                    obj.xrArray(obj.roots) = xrnew;
                    obj.roots = obj.roots+1;
                    b_arr(end) = [];
                    a = b_arr;
                end
                if(length(obj.xrArray)==new_deg)
                   break;
                end
                if(e == es)
                    break;
                end
            end
            
            if(length(obj.xrArray)~=new_deg)
                obj.xrArray(obj.roots) = xrnew;
            end
            time = t;
            y = obj.xrArray;
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
                plot(handles.axes1,x_F,y_F,'o','LineWidth',1.5);
                plot(handles.axes1,x_F,y_F,'LineWidth',1.5);
                hold on;
            end
            line = [obj.aArray;obj.bArray;obj.cArray;obj.xArray;obj.tArray];
            FID = fopen('Bierge_Vieta.txt', 'w');
            if FID == -1, error('Cannot create file.'); end
            fprintf(FID,"        a        |         b         |         c         |         X         |    Time   \n______________________________________________________________________________________________\n");
            fprintf(FID, '%15.10f  |  %15.10f  |  %15.10f  |  %15.10f  |  %15.10f\n ______________________________________________________________________________________________\n', line);
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

