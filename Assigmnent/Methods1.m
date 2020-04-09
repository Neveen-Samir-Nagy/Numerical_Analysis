function varargout = Methods1(varargin)
% METHODS1 MATLAB code for Methods1.fig
%      METHODS1, by itself, creates a new METHODS1 or raises the existing
%      singleton*.
%
%      H = METHODS1 returns the handle to a new METHODS1 or the handle to
%      the existing singleton*.
%
%      METHODS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in METHODS1.M with the given input arguments.
%
%      METHODS1('Property','Value',...) creates a new METHODS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Methods1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Methods1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Methods1

% Last Modified by GUIDE v2.5 08-May-2019 11:52:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Methods1_OpeningFcn, ...
                   'gui_OutputFcn',  @Methods1_OutputFcn, ...
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


% --- Executes just before Methods1 is made visible.
function Methods1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Methods1 (see VARARGIN)

% Choose default command line output for Methods1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Methods1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Methods1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in getMethod.
function getMethod_Callback(hObject, eventdata, handles)
% hObject    handle to getMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns getMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from getMethod


% --- Executes during object creation, after setting all properties.
function getMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to getMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
switch get(handles.popupmenu,'Value')
    case 'Bisection'
       S.run('bisection.m');
    case 'False-position'  
        S.run('false.m');
    case 'Fixed point'  
        S.run('fixed.m');
    case 'Newton-Raphson' 
        S.run('newton.m');
    case 'Secant' 
        S.run('SecantGui.m');
    case 'Bierge-Vieta'  
        S.Methods1run('bierge.m');
end        
set(handles.popupmenu, 'UserData', S);
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bisection.
function bisection_Callback(hObject, eventdata, handles)
% hObject    handle to bisection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('bisection.m');

% --- Executes on button press in false.
function false_Callback(hObject, eventdata, handles)
% hObject    handle to false (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('falsePostion.m');

% --- Executes on button press in fixed.
function fixed_Callback(hObject, eventdata, handles)
% hObject    handle to fixed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('fixed.m');

% --- Executes on button press in newton.
function newton_Callback(hObject, eventdata, handles)
% hObject    handle to newton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('newton.m');

% --- Executes on button press in secant.
function secant_Callback(hObject, eventdata, handles)
% hObject    handle to secant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('SecantGui.m');

% --- Executes on button press in bierge.
function bierge_Callback(hObject, eventdata, handles)
% hObject    handle to bierge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('bierge.m');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('generalMethod.m');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('AllMethods.m');
