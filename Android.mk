function varargout = noigui(varargin)
% NOIGUI MATLAB code for noigui.fig
%      NOIGUI, by itself, creates a new NOIGUI or raises the existing
%      singleton*.
%
%      H = NOIGUI returns the handle to a new NOIGUI or the handle to
%      the existing singleton*.
%
%      NOIGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOIGUI.M with the given input arguments.
%
%      NOIGUI('Property','Value',...) creates a new NOIGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before noigui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to noigui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help noigui

% Last Modified by GUIDE v2.5 18-Dec-2015 19:43:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @noigui_OpeningFcn, ...
                   'gui_OutputFcn',  @noigui_OutputFcn, ...
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


% --- Executes just before noigui is made visible.
function noigui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to noigui (see VARARGIN)

% Choose default command line output for noigui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes noigui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = noigui_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Fs=str2double(get(handles.edit1,'String'))
fLow=str2double(get(handles.edit2,'String'))

fsig = 50; % Hz
filterOrder =10; % Hz
%Fs=600; % Sampling frequency
Rp=2;
nPoint = 256;
t=(1:nPoint)/Fs; % time axis
s = 1 * sin(2*pi*t*3*fsig) + 2 * sin(2*pi*t*0.5*fsig);
[b, a] = butter( filterOrder, fLow*2/Fs);
[H,wf]=freqz(b,a,nPoint); % Calculate filter transmitance
axes(handles.axes1)
plot(wf*Fs/(2*pi), abs(H),'r'); % Plot filter transmitance
axes(handles.axes2)
signalFiltered = filter(b,a,s);
plot(t,signalFiltered ,'r',t,s,'b');
xlabel('Time (seconds)'); ylabel('Time waveform');

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text

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

