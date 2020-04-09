function varargout = AllMethods(varargin)
    % ALLMETHODS MATLAB code for AllMethods.fig
    %      ALLMETHODS, by itself, creates a new ALLMETHODS or raises the existing
    %      singleton*.
    %
    %      H = ALLMETHODS returns the handle to a new ALLMETHODS or the handle to
    %      the existing singleton*.
    %
    %      ALLMETHODS('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in ALLMETHODS.M with the given input arguments.
    %
    %      ALLMETHODS('Property','Value',...) creates a new ALLMETHODS or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before AllMethods_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to AllMethods_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help AllMethods
    
    % Last Modified by GUIDE v2.5 09-May-2019 14:15:19
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @AllMethods_OpeningFcn, ...
        'gui_OutputFcn',  @AllMethods_OutputFcn, ...
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
    
    
    % --- Executes just before AllMethods is made visible.
function AllMethods_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to AllMethods (see VARARGIN)
    
    % Choose default command line output for AllMethods
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes AllMethods wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = AllMethods_OutputFcn(hObject, eventdata, handles)
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
    
    
    % --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    equation = get(handles.edit1, 'String');
    equation =  strrep(equation,'e^','exp');
    first = get(handles.edit2, 'String');
    second = get(handles.edit3, 'String');
    numOfiteration = get(handles.edit4, 'String');
    if(numOfiteration == "")
        numOfiteration = "50";
    end
    epslion = get(handles.edit5, 'String');
    if(epslion == "")
        epslion = "0.00001";
    end
    cla(handles.axes1,'reset');
    cla(handles.axes2,'reset');
    xlim(handles.axes2,[0 round(str2double(numOfiteration))]);
    ylim(handles.axes2,[0 round(str2double(second))]);
    hold(handles.axes2,'on');
    xlim(handles.axes1,[0 round(str2double(numOfiteration))]);
    ylim(handles.axes1,[round(str2double(first)) round(str2double(second))]);
    hold(handles.axes1,'on');
    calBisection = ClassBisection(equation,str2double(first),str2double(second));
    calBisection.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"ALL");
    calFalse = False_position(equation,str2double(first),str2double(second));
    calFalse.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"ALL");
    calFixed = Fixed_point(equation);
    calFixed.solve(handles,str2double(first),round(str2double(numOfiteration)),str2double(epslion),"ALL");
    calNewton = Newton_raphson(equation,str2double(first));
    calNewton.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"ALL");
    calSecant = Secant_Method(equation,str2double(first),str2double(second));
    calSecant.solve(handles,equation,str2double(epslion),round(str2double(numOfiteration)),"ALL");
    calBierge=Birge_vieta(equation, str2double(first));
    calBierge.solve(handles,equation,str2double(epslion),str2double(numOfiteration),"ALL");
    
