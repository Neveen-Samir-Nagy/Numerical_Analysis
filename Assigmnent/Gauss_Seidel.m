classdef Gauss_Seidel
    %Gauss_Seidel method
    
    properties
        equations
        x0
        time_Array
        x
    end
    
    methods
        function obj = Gauss_Seidel(equations,x0)
            obj.x = sym('x', [1 length(equations)]);
            obj.equations = equations;
            obj.x0 = x0;
        end
        
        function [y,errorabs,lengthOfiterations,time] = solve(obj,handles,maxi,es,str)
            cla(handles.axes,'reset');
            s = sym(zeros(1, length(obj.equations)));
            for i = 1 : length(obj.x)
                s(i) = solve(obj.equations(i),obj.x(i));
            end
            x0_old = [];
            initial = obj.x0;
            z = [];
            e = [];
            iter = [];
            for j = 1 : maxi
                tic;
                pause on;
                pause(1.5);
                x0_old = [x0_old;initial];
                iter=[iter j];
                [f,initial] = sub(obj,s,initial);
                z = [z f];
                Error = abs((initial - x0_old(j,:)));
                e = [e ; Error];
                time=toc;
                obj.time_Array(j,1) = time;
                if(str=="Sedial")
                set(handles.edit4,'string',sprintf("|"+'%f'+"|",x0_old(size(x0_old,1),:)));
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",e(size(e,1),:)));
                set(handles.edit6,'string',sprintf('%f',j));
                set(handles.edit9,'string',sprintf('%f',time));
                end
                if(str=="SedialF")
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",x0_old(size(x0_old,1),:)));
                 set(handles.edit9,'string',sprintf("|"+'%f'+"|",e(size(e,1),:)));
                 set(handles.edit10,'string',sprintf('%f',j));
                 set(handles.edit8,'string',sprintf('%f',time));
                end
                if(sum(e(j,:) < es) == length(initial))
                    x0_old = [x0_old ; initial];
                    lengthOfiterations = j;
                    errorabs = e(size(e,1),:);
                    break
                end
            end
            x0_old(1,:) = [];
            write(obj,x0_old,e);
            cla(handles.axes,'reset');
            y = x0_old(size(x0_old,1),:);
            maxrow = max(x0_old);
            xlim(handles.axes,[0 iter(end)]);
            ylim(handles.axes,[0 max(maxrow)]);
            hold(handles.axes,'on');
            for m = 1: length(x0_old(1,:))
                pause on;
                pause (1);
                x_S = x0_old(:,m);
                y_S = iter;
                plot(handles.axes,x_S,y_S,'o','LineWidth',1.5);
                plot(handles.axes,x_S,y_S,'LineWidth',1.5);
                hold on;
            end
        end
        function [y, x0] = sub(obj,equations,x0)
            y = [];
            for i = 1 : length(equations)
                y(i) = subs(equations(i),obj.x,x0);
                x0(i) = y(i);
            end
        end
        function write(obj,x0_old,e)
            FID = fopen('Guass_Sedial.txt', 'w');
            if FID == -1, error('Cannot create file.'); end
                 fmt = [repmat('%15.10s |', 1,size(x0_old,2)-1), '%15.10s |'];
                 fprintf(FID,fmt,obj.x);
                  fmt = [repmat('      error(%s) |', 1,size(x0_old,2)-1), '      error(%s)\n____________________________________________________________________________________________________\n'];
                 fprintf(FID,fmt,obj.x);
                 fmt = [repmat('%15.10f |', 1, 2*size(x0_old,2)), '%15.10f\n____________________________________________________________________________________________________\n'];
                 fprintf(FID,fmt,x0_old.',e.',obj.time_Array);
                 fclose(FID);
        end
    end
end

