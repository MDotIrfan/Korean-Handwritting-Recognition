function varargout = pengujian_data_tunggal(varargin)
% PENGUJIAN_DATA_TUNGGAL MATLAB code for pengujian_data_tunggal.fig
%      PENGUJIAN_DATA_TUNGGAL, by itself, creates a new PENGUJIAN_DATA_TUNGGAL or raises the existing
%      singleton*.
%
%      H = PENGUJIAN_DATA_TUNGGAL returns the handle to a new PENGUJIAN_DATA_TUNGGAL or the handle to
%      the existing singleton*.
%
%      PENGUJIAN_DATA_TUNGGAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENGUJIAN_DATA_TUNGGAL.M with the given input arguments.
%
%      PENGUJIAN_DATA_TUNGGAL('Property','Value',...) creates a new PENGUJIAN_DATA_TUNGGAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pengujian_data_tunggal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pengujian_data_tunggal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pengujian_data_tunggal

% Last Modified by GUIDE v2.5 02-Oct-2016 02:43:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pengujian_data_tunggal_OpeningFcn, ...
                   'gui_OutputFcn',  @pengujian_data_tunggal_OutputFcn, ...
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


% --- Executes just before pengujian_data_tunggal is made visible.
function pengujian_data_tunggal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pengujian_data_tunggal (see VARARGIN)

% Choose default command line output for pengujian_data_tunggal
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes pengujian_data_tunggal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pengujian_data_tunggal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pilih_data.
function pilih_data_Callback(hObject, eventdata, handles)
Preprocessing;
handles.ciri1=ciri1;
handles.ciri2=ciri2;
handles.ciri3=ciri3;
handles.ciri4=ciri4;
handles.ciri5=ciri5;
handles.ciri6=ciri6;
axes(handles.axes2);
imshow(image1)
set(handles.path2,'String',file);
guidata(hObject, handles);
% hObject    handle to pilih_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pengenalan.
function pengenalan_Callback(hObject, eventdata, handles)
ciri1=handles.ciri1;
ciri2=handles.ciri2;
ciri3=handles.ciri3;
ciri4=handles.ciri4;
ciri5=handles.ciri5;
ciri6=handles.ciri6;
load('net.mat');
load('tr.mat');
load('datanormal.mat');
load('target.mat');
setappdata(0,'evalue',net);
net = getappdata(0,'evalue');
file_data = getappdata(0,'file_d');
testing_data_tunggal;
set(handles.text5,'String',hasil_huruf);
% hObject    handle to pengenalan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in menuutama.
function menuutama_Callback(hObject, eventdata, handles)
close;
menu_utama;
% hObject    handle to menuutama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in keluar.
function keluar_Callback(hObject, eventdata, handles)
close all;
% hObject    handle to keluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


function path2_Callback(hObject, eventdata, handles)
% hObject    handle to path2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path2 as text
%        str2double(get(hObject,'String')) returns contents of path2 as a double


% --- Executes during object creation, after setting all properties.
function path2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
