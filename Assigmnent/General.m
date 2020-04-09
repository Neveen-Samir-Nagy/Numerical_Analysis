classdef General
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        xl
        xu 
        equation
        iArray
        eArray
        xrArray
        xlArray
        diffe
        no_Iterations
    end
    
    methods
        function obj = General(equation)
            obj.equation = equation;
            obj.xl = -50;
            obj.xu = obj.xl+10; 
        end
        function [y,errorabs,length,time] = solve(obj,handles,eps, maxI)
            if(obj.evaluate(str2double(obj.xl)) * obj.evaluate(str2double(obj.xu)) < 0)
                cal = ClassBisection(obj.equation,obj.xl,obj.xu);
                [y,errorabs,length,time]=cal.solve(handles,obj.equation,eps,maxI,"General");
            else
                cal = Secant_Method(obj.equation,obj.xl,obj.xu);  
                [y,errorabs,length,time]=cal.solve(handles,obj.equation,eps,maxI,"General");
            end
        end
        function v = evaluate(obj,x)
           equation1 = str2sym(obj.equation);
            v = subs(equation1,x);
        end
        function d = differen(obj,x)
            d = subs(obj.diffe,x);
        end
    end
end