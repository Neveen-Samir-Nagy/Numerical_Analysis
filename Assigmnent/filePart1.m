function varargout = filePart1(varargin)
    % FILEPART1 MATLAB code for filePart1.fig
    %      FILEPART1, by itself, creates a new FILEPART1 or raises the existing
    %      singleton*.
    %
    %      H = FILEPART1 returns the handle to a new FILEPART1 or the handle to
    %      the existing singleton*.
    %
    %      FILEPART1('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in FILEPART1.M with the given input arguments.
    %
    %      FILEPART1('Property','Value',...) creates a new FILEPART1 or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before filePart1_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to filePart1_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help filePart1
    
    % Last Modified by GUIDE v2.5 09-May-2019 00:42:33
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @filePart1_OpeningFcn, ...
        'gui_OutputFcn',  @filePart1_OutputFcn, ...
        'gui_LayoutFcn',  [] , ...
        'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end
    
    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT
    
    
    % --- Executes just before filePart1 is made visible.
function filePart1_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to filePart1 (see VARARGIN)
    
    % Choose default command line output for filePart1
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes filePart1 wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = filePart1_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    
function edit1_Callback(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit1 as text
    %        str2double(get(hObject,'String')) returns contents of edit1 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit2_Callback(hObject, eventdata, handles)
    % hObject    handle to edit2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit2 as text
    %        str2double(get(hObject,'String')) returns contents of edit2 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit3_Callback(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit3 as text
    %        str2double(get(hObject,'String')) returns contents of edit3 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit3 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit4_Callback(hObject, eventdata, handles)
    % hObject    handle to edit4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit4 as text
    %        str2double(get(hObject,'String')) returns contents of edit4 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit4 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit5_Callback(hObject, eventdata, handles)
    % hObject    handle to edit5 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit5 as text
    %        str2double(get(hObject,'String')) returns contents of edit5 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit5 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit6_Callback(hObject, eventdata, handles)
    % hObject    handle to edit6 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit6 as text
    %        str2double(get(hObject,'String')) returns contents of edit6 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit6 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit7_Callback(hObject, eventdata, handles)
    % hObject    handle to edit7 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit7 as text
    %        str2double(get(hObject,'String')) returns contents of edit7 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit7 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit8_Callback(hObject, eventdata, handles)
    % hObject    handle to edit8 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit8 as text
    %        str2double(get(hObject,'String')) returns contents of edit8 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit8 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit9_Callback(hObject, eventdata, handles)
    % hObject    handle to edit9 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit9 as text
    %        str2double(get(hObject,'String')) returns contents of edit9 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit9 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    
function edit10_Callback(hObject, eventdata, handles)
    % hObject    handle to edit10 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit10 as text
    %        str2double(get(hObject,'String')) returns contents of edit10 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit10 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
    
    
    % --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    FID = fopen([get(handles.edit1,'String') '.txt'], 'r');
    if exist([get(handles.edit1,'String') '.txt'], 'file')
        i=1;
        flag = false;
        while true
            thisline = fgetl(FID);
            if ~ischar(thisline); break; end
            if(contains(thisline, "x")&&i==1)
                set(handles.edit2,'string',thisline);
            end
            if(i==2)
                set(handles.edit3,'string',thisline);
            end
            if(i==3&&contains(thisline," "))
                set(handles.edit4,'string',extractBetween(thisline,1," "));
                set(handles.edit5,'string',extractAfter(thisline," "));
                flag = true;
            end
            if(~flag&&i==3)
                set(handles.edit4,'string',thisline);
                set(handles.edit5,'string',"---");
            end
            if(i==4&&str2double(thisline)==floor(str2double(thisline)))
                set(handles.edit6,'string',thisline);
                set(handles.edit7,'string',"---");
            else
                set(handles.edit7,'string',thisline);
                set(handles.edit6,'string',"---");
            end
            i = i+1;
        end
        fclose(FID);
        method = get(handles.edit3,'string');
        cla(handles.axes,'reset');
        switch method
            case 'bisection'
                equation = get(handles.edit2,'string');
                equation =  strrep(equation,'e^','exp');
                first = get(handles.edit4,'string');
                second = get(handles.edit5,'string');
                numOfiteration = get(handles.edit6,'string');
                epslion = get(handles.edit7,'string');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                if(epslion == "---")
                    epslion = "0.00001";
                end
                funcHandle = str2func(['@(x)' equation]);
                x = linspace(str2double(first)-2,str2double(second)+2,100);
                y = funcHandle(x);
                plot(handles.axes,x,y,'LineWidth',2);
                hold on;
                cal = ClassBisection(equation,str2double(first),str2double(second));
                [y,w,i,t]=cal.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"BisectionF");
                set(handles.edit8,'string',sprintf('%f',y));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
            case 'False-Position'
                equation = get(handles.edit2, 'String');
                equation =  strrep(equation,'e^','exp');
                first = (get(handles.edit4, 'String'));
                second = (get(handles.edit5, 'String'));
                numOfiteration = get(handles.edit6, 'String');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                epslion = get(handles.edit7, 'String');
                if(epslion == "---")
                    epslion = "0.00001";
                end
                funcHandle = str2func(['@(x)' equation]);
                x = linspace(str2double(first)-2,str2double(second)+2,100);
                y = funcHandle(x);
                plot(handles.axes,x,y,'LineWidth',2);
                hold on;
                cal = False_position(equation,str2double(first),str2double(second));
                [y,w,i,t]=cal.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"FalseF");
                set(handles.edit8,'string',sprintf('%f',y));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
            case 'Fixed-Point'
                equation = get(handles.edit2, 'String');
                equation =  strrep(equation,'e^','exp');
                interval = get(handles.edit4, 'String');
                numOfiteration = get(handles.edit6, 'String');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                epslion = get(handles.edit7, 'String');
                if(epslion == "---")
                    epslion = "0.00001";
                end
                cal = Fixed_point(equation);
                x = linspace(str2double(interval)-2,str2double(interval)+2,100);
                GX = char(cal.getGX);
                GX2 =  strrep(GX,'^','.^');
                funcHandle = str2func(['@(x)' GX2]);
                y = funcHandle(x);
                plot(handles.axes,x,y,'LineWidth',2);
                hold on;
                y2 = x;
                plot(handles.axes,x,y2,'LineWidth',2);
                hold on;
                y1 = get(gca,'ylim');
                plot(handles.axes,[str2double(interval) str2double(interval)],y1,'LineWidth',2);
                hold on;
                [yfun,w,i,t] = cal.solve(handles,str2double(interval),round(str2double(numOfiteration)),str2double(epslion),"FixedF");
                set(handles.edit8,'string',sprintf('%f',yfun));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
            case 'Newton-Raphson'
                equation = get(handles.edit2, 'String');
                equation =  strrep(equation,'e^','exp');
                initial = get(handles.edit4, 'String');
                numOfiteration = get(handles.edit6, 'String');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                epslion = get(handles.edit7, 'String');
                if(epslion == "---")
                    epslion = "0.00001";
                end
                funcHandle = str2func(['@(x)' equation]);
                x = linspace(str2double(initial)-2,str2double(initial)+2,100);
                yfun = funcHandle(x);
                plot(handles.axes,x,yfun,'LineWidth',2);
                hold on;
                cal = Newton_raphson(equation,str2double(initial));
                [y,w,i,t] = cal.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"NewtonF");
                set(handles.edit8,'string',sprintf('%f',y));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
            case 'Secant'
                equation = get(handles.edit2, 'String');
                equation =  strrep(equation,'e^','exp');
                first = get(handles.edit4, 'String');
                second = get(handles.edit5, 'String');
                numOfiteration = get(handles.edit6, 'String');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                epslion = get(handles.edit7, 'String');
                if(epslion == "---")
                    epslion = "0.00001";
                end
                funcHandle = str2func(['@(x)' equation]);
                x = linspace(str2double(first)-1,str2double(second)+1,100);
                y = funcHandle(x);
                plot(handles.axes,x,y,'LineWidth',2);
                hold on;
                cal = Secant_Method(equation,str2double(first),str2double(second));
                % Get object from the method to solve
                [y,w,i,t]=cal.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"SecantF");
                set(handles.edit8,'string',sprintf('%f',y));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
            case 'Bierge-Vieta'
                equation = get(handles.edit2, 'String');
                equation =  strrep(equation,'e^','exp');
                first = get(handles.edit4, 'String');
                numOfiteration = get(handles.edit6, 'String');
                if(numOfiteration == "---")
                    numOfiteration = "50";
                end
                epslion = get(handles.edit7, 'String');
                if(epslion == "---")
                    epslion = "0.00001";
                end
                funcHandle = str2func(['@(x)' equation]);
                x = linspace(str2double(first)-2,str2double(first)+2,100);
                yfun = funcHandle(x);
                plot(handles.axes,x,yfun,'LineWidth',2);
                hold on;
                cal=Birge_vieta(equation, str2double(first));
                [yl,w,i,t] = cal.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"BiergeF");
                set(handles.edit8,'string',sprintf("|"+'%f'+"|",yl));
                set(handles.edit9,'string',sprintf('%f',w));
                set(handles.edit10,'string',sprintf('%d',i));
                set(handles.edit21,'string',sprintf('%f',t));
        end
    else
        addErrorMessage(handles);
    end
    
    
    
function edit21_Callback(hObject, eventdata, handles)
    % hObject    handle to edit21 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    
    % Hints: get(hObject,'String') returns contents of edit21 as text
    %        str2double(get(hObject,'String')) returns contents of edit21 as a double
    
    
    % --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to edit21 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called
    
    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
