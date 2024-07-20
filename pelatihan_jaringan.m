function varargout = pelatihan_jaringan(varargin)
% PELATIHAN_JARINGAN MATLAB code for pelatihan_jaringan.fig
%      PELATIHAN_JARINGAN, by itself, creates a new PELATIHAN_JARINGAN or raises the existing
%      singleton*.
%
%      H = PELATIHAN_JARINGAN returns the handle to a new PELATIHAN_JARINGAN or the handle to
%      the existing singleton*.
%
%      PELATIHAN_JARINGAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PELATIHAN_JARINGAN.M with the given input arguments.
%
%      PELATIHAN_JARINGAN('Property','Value',...) creates a new PELATIHAN_JARINGAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pelatihan_jaringan_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pelatihan_jaringan_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pelatihan_jaringan

% Last Modified by GUIDE v2.5 02-Oct-2016 02:42:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pelatihan_jaringan_OpeningFcn, ...
                   'gui_OutputFcn',  @pelatihan_jaringan_OutputFcn, ...
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

% --- Executes just before pelatihan_jaringan is made visible.
function pelatihan_jaringan_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pelatihan_jaringan (see VARARGIN)

% Choose default command line output for pelatihan_jaringan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1);
image(imread('Tour-ke-jepang-sakura','jpg'));
grid off;
axis off;
% UIWAIT makes pelatihan_jaringan wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pelatihan_jaringan_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- dijalankan ketika button pilih data ditekan
function pilih_data_Callback(hObject, eventdata, handles)
Load_Data; %menjalankan load_data.m
handles.datanormal=datanormal;
save('datanormal.mat', 'datanormal');
setappdata(0,'file_d',file_data);
guidata(hObject,handles);
% hObject    handle to pilih_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- dijalankan ketika button latih jaringan ditekan
function latihan_jaringan_Callback(hObject, eventdata, handles)
datanormal=handles.datanormal;
target_data; %menjalankan kodingan target_data.m
divide_target; %menjalankan kodingan divide_target.m
train_machine; %menjalan kodingan train_machine.m
handles.net=net;
handles.tr=tr;
handles.target=target;
save('net.mat', 'net'); %menyimpan jaringan yang telah di latih
save('tr.mat', 'tr'); %menyimpan properti jaringan
save('target.mat', 'target');
setappdata(0,'evalue',net);
guidata(hObject,handles);
% hObject    handle to latihan_jaringan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in menuutama.
function menuutama_Callback(hObject, eventdata, handles)
close;
menu_utama;
% hObject    handle to menuutama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in test_data_tunggal.
function test_data_tunggal_Callback(hObject, eventdata, handles)
pengujian_data_tunggal;
% hObject    handle to test_data_tunggal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in test.
function test_Callback(hObject, eventdata, handles)
load('net.mat');
load('tr.mat');
load('datanormal.mat');
load('target.mat');
net=net;
tr=tr;
datanormal=datanormal;
target=target;
testing_and_accuracy;
set(handles.banyak_data,'String',totaldata);
set(handles.banyak_data_benar,'String',benar);
set(handles.akurasi2,'String',akurasi);
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
