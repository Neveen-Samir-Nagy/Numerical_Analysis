function varargout = filePart2(varargin)
    % FILEPART2 MATLAB code for filePart2.fig
    %      FILEPART2, by itself, creates a new FILEPART2 or raises the existing
    %      singleton*.
    %
    %      H = FILEPART2 returns the handle to a new FILEPART2 or the handle to
    %      the existing singleton*.
    %
    %      FILEPART2('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in FILEPART2.M with the given input arguments.
    %
    %      FILEPART2('Property','Value',...) creates a new FILEPART2 or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before filePart2_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to filePart2_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help filePart2
    
    % Last Modified by GUIDE v2.5 09-May-2019 16:04:37
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @filePart2_OpeningFcn, ...
        'gui_OutputFcn',  @filePart2_OutputFcn, ...
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
    
    
    % --- Executes just before filePart2 is made visible.
function filePart2_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to filePart2 (see VARARGIN)
    
    % Choose default command line output for filePart2
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes filePart2 wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = filePart2_OutputFcn(hObject, eventdata, handles)
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
    
    
    % --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    FID = fopen([get(handles.edit1,'String') '.txt'], 'r');
    if exist([get(handles.edit1,'String') '.txt'], 'file')
        i = 1;
        while true
            thisline = fgetl(FID);
            if ~ischar(thisline); break; end
            if(i==1)
                set(handles.edit3,'string',thisline);
            end
            i=i+1;
            lengthOfEq = get(handles.edit3, 'String');
            A =[];
            B = [];
            Eq=[];
            x = sym('x', [1 round(str2double(lengthOfEq))]);
            for j=1: round(str2double(get(handles.edit3,'String')))
                thisline = fgetl(FID);
                equation1 = str2sym(thisline);
                Eq = [Eq equation1];
                [a,b] = equationsToMatrix(equation1,x);
                A = [A a];
                B = [B b];
                curr = char(get(handles.edit4,'String'));
                if(j>1)
                    curr= [curr '||'];
                end
                curr= [curr thisline];
                set(handles.edit4,'string',curr);
                i = i+1;
            end
            thisline = fgetl(FID);
            set(handles.edit2,'string',thisline);
            if(thisline=="Gaussian-sedial")
                thisline = fgetl(FID);
                set(handles.edit7,'string',thisline);
                thisline = fgetl(FID);
                set(handles.edit6,'string',thisline);
            else
                break;
            end
        end
        fclose(FID);
        method = get(handles.edit2,'String');
        switch method
            case 'Gaussian-elimination'
                set(handles.edit6,'string',"---");
                set(handles.edit7,'string',"---");
                ColumnMatrixB = vec2mat(B,1);
                ColumnMatrixA = vec2mat(A,round(str2double(lengthOfEq)));
                cal = Gauss_Elimination(ColumnMatrixA,ColumnMatrixB);
                [solution,t] = cal.solve();
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",solution));
                set(handles.edit8,'string',sprintf('%f',t));
                set(handles.edit9,'string',"---");
                set(handles.edit10,'string',"---");
            case 'LU-decomposition'
                set(handles.edit6,'string',"---");
                set(handles.edit7,'string',"---");
                ColumnMatrixB = vec2mat(B,1);
                ColumnMatrixA = vec2mat(A,round(str2double(lengthOfEq)));
                cal = LUdecomposition(ColumnMatrixA);
                [solution,t] = cal.solve(ColumnMatrixB);
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",solution));
                set(handles.edit8,'string',sprintf('%f',t));
                set(handles.edit9,'string',"---");
                set(handles.edit10,'string',"---");
            case 'Gaussian-jordan'
                set(handles.edit6,'string',"---");
                set(handles.edit7,'string',"---");
                ColumnMatrixB = vec2mat(B,1);
                ColumnMatrixA = vec2mat(A,round(str2double(lengthOfEq)));
                cal = GaussJordan(ColumnMatrixA, ColumnMatrixB);
                [solution,t] = cal.calculate();
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",solution));
                set(handles.edit8,'string',sprintf('%f',t));
                set(handles.edit9,'string',"---");
                set(handles.edit10,'string',"---");
            case 'Gaussian-sedial'
                initial = get(handles.edit7,'String');
                eORi = str2double(get(handles.edit6,'String'));
                number=50;
                err = 0.00001;
                if(eORi==floor(eORi))
                    number = round(eORi);
                else
                    err = eORi;
                end
                Y = char(initial);
                Y(Y==44) = ' ';
                x = cell2mat(textscan(char(Y),'%f'));
                x1 = x.';
                ColumnMatrix = vec2mat(Eq,1);
                cal = Gauss_Seidel(ColumnMatrix,x1);
                [y,error,iter,t] = cal.solve(handles,number,err,"SedialF");
                set(handles.edit5,'string',sprintf("|"+'%f'+"|",y));
                set(handles.edit9,'string',sprintf("|"+'%f'+"|",error));
                set(handles.edit10,'string',sprintf('%f',iter));
                set(handles.edit8,'string',sprintf('%f',t));
        end
    else
        addErrorMessage(handles);
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
