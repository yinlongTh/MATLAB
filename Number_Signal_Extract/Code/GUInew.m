function varargout = GUInew(varargin)
%GUINEW MATLAB code file for GUInew.fig
%      GUINEW, by itself, creates a new GUINEW or raises the existing
%      singleton*.
%
%      H = GUINEW returns the handle to a new GUINEW or the handle to
%      the existing singleton*.
%
%      GUINEW('Property','Value',...) creates a new GUINEW using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUInew_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUINEW('CALLBACK') and GUINEW('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUINEW.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUInew

% Last Modified by GUIDE v2.5 24-Nov-2020 20:29:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUInew_OpeningFcn, ...
                   'gui_OutputFcn',  @GUInew_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before GUInew is made visible.
function GUInew_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for GUInew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUInew wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUInew_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start1.
function Start1_Callback(hObject, eventdata, handles)
% hObject    handle to Start1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y 
file=get(handles.edit1,'string');
axes1=[handles.axes5,handles.axes6,handles.axes7];
axes2=[handles.axes8,handles.axes9];

[num]=MainRun(file,axes1,axes2);
set(handles.edit2,'string',(num));

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)
% hObject    handle to Clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'string','')
set(handles.edit2,'string','')
set(handles.edit4,'string','')
set(handles.edit5,'string','')
axes1=[handles.axes5,handles.axes6,handles.axes7];
axes2=[handles.axes8,handles.axes9];
for i=1:1:3
cla(axes1(i),'reset');
end
for i=1:1:2
cla(axes2(i),'reset');
end



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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global y 
axes1=[handles.axes5,handles.axes6,handles.axes7];
axes2=[handles.axes8,handles.axes9];
file=get(handles.edit1,'string');

handles.zhou=pinpu(file);
handles.freq=pinlv(file);

[num]=MainRun(file,axes1,axes2);
set(handles.edit2,'string',(num));



%选择频谱图
val = get(handles.listbox1,'value');
if(val==2)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,1)))
   set(handles.edit5,'string',num2str(handles.freq(2,1)))

elseif(val==3)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,2)))
   set(handles.edit5,'string',num2str(handles.freq(2,2)))
   
elseif(val==4)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,3)))
   set(handles.edit5,'string',num2str(handles.freq(2,3)))
    
elseif(val==5)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,4)))
   set(handles.edit5,'string',num2str(handles.freq(2,4)))
   
elseif(val==6)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,5)))
   set(handles.edit5,'string',num2str(handles.freq(2,5)))
    
elseif(val==7)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,6)))
   set(handles.edit5,'string',num2str(handles.freq(2,6)))
    
elseif(val==8)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,7)))
   set(handles.edit5,'string',num2str(handles.freq(2,7)))
    
elseif(val==9)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,8)))
   set(handles.edit5,'string',num2str(handles.freq(2,8)))
    
elseif(val==10)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,9)))
   set(handles.edit5,'string',num2str(handles.freq(2,9)))
    
elseif(val==11)
plot(axes1(3),abs(handles.zhou{val-1}), abs(handles.zhou{val+9}));
   set(handles.edit4,'string',num2str(handles.freq(1,10)))
   set(handles.edit5,'string',num2str(handles.freq(2,10)))
end



% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes1=[handles.axes5,handles.axes6,handles.axes7];
axes2=[handles.axes8,handles.axes9];
fs=44100;
robj = audiorecorder(fs,16,1);  %设置采样频率、采样位数、通道数
recordblocking(robj,1);            %采集初步数据（1s长度）
rdata = getaudiodata(robj);        %获取音频数据


plot(axes2(1),rdata);                       %绘制波形
axis([1,fs,-0.1,0.1]);          %设置固定坐标轴
drawnow                            %刷新显示
n = 10000;                         %设定后续的采样更新次数，n与m可联合计算后续更新时间长度
m = 0.01;                           %设定更新间隔，m越小波形越连续
while n>1
    recordblocking(robj,m);
%     rlen = length(rdata);          %获取数据长度
    data1=getaudiodata(robj);
    rdata=[rdata ; data1];%待显示的数据 = 旧数据 + 新数据
    plot(axes2(1),rdata);
    axis([1,fs,-0.1,0.1]);
%     if n<9950
    [num]=LiveRun(rdata,fs,axes2);
    set(handles.edit2,'string',(num))
%     end
    m = m + 0.01;
    if m > 0.25
        break
    end
    if  length(num)==1
        break
    end
end
[num]=LiveRun(rdata,fs,axes2);
set(handles.edit2,'string',(num))

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
stop(r)








% --- Executes on button press in ChooseAudioFile.
function ChooseAudioFile_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseAudioFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename pathname]=uigetfile({'*.wav';'*.m4a'},'选择文件');
fpath=[pathname filename];
if filename==0
else
set(handles.edit1,'string',fpath);
end
