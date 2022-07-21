function varargout = test1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_OutputFcn, ...
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


% --- Executes just before test1 is made visible.
function test1_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for test1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test1_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y 
[y,fs] = audioread('samp.wav');

%innitial setting
    d = 1/fs;
    t = 0:d:(length(y)*d)-d;
    
 roam = y;
 %filter(noise clearing)

 for i = 1:length(y) 
     if (abs(y(i))<0.016)
         y(i)=0;
     end
 end

  handles.digi = seperate(y,roam);
  
%FFT
handles.freq = freqpick(handles.digi,fs);

%number converting
handles.num = tonummber(handles.freq);

set(handles.edit1,'string',num2str(handles.num))
axes(handles.axes1);
plot(y)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
r = audiorecorder(44100, 16, 1);
record(r); 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global r
stop(r);
tr = getaudiodata(r, 'int16');
axes(handles.axes1);
plot(tr)
fftTr = fft(tr);
axes(handles.axes2);
plot(abs(fftTr))


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


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
global y 
[y,fs] = audioread('samp.wav');

%innitial setting
    d = 1/fs;
    t = 0:d:(length(y)*d)-d;
    
 roam = y;
 %filter(noise clearing)

 for i = 1:length(y) 
     if (abs(y(i))<0.016)
         y(i)=0;
     end
 end

  handles.digi = seperate(y,roam);
  handles.freq = freqpick(handles.digi,fs);
  
  
val = get(handles.listbox1,'value');
if(val==1)
   axes(handles.axes2);
   plot(handles.digi{1});
   set(handles.edit2,'string',num2str(handles.freq(1,1)))
   set(handles.edit3,'string',num2str(handles.freq(2,1)))
elseif(val==2)
   axes(handles.axes2);
   plot(handles.digi{2});
   set(handles.edit2,'string',num2str(handles.freq(1,2)))
   set(handles.edit3,'string',num2str(handles.freq(2,2)))
    elseif(val==3)
   axes(handles.axes2);
   plot(handles.digi{3});
   set(handles.edit2,'string',num2str(handles.freq(1,3)))
   set(handles.edit3,'string',num2str(handles.freq(2,3)))
    elseif(val==4)
   axes(handles.axes2);
   plot(handles.digi{4});
   set(handles.edit2,'string',num2str(handles.freq(1,4)))
   set(handles.edit3,'string',num2str(handles.freq(2,4)))
    elseif(val==5)
    axes(handles.axes2);
   plot(handles.digi{5});
   set(handles.edit2,'string',num2str(handles.freq(1,5)))
   set(handles.edit3,'string',num2str(handles.freq(2,5)))
    elseif(val==6)
    axes(handles.axes2);
   plot(handles.digi{6});
   set(handles.edit2,'string',num2str(handles.freq(1,6)))
   set(handles.edit3,'string',num2str(handles.freq(2,6)))
    elseif(val==7)
   axes(handles.axes2);
   plot(handles.digi{7});
   set(handles.edit2,'string',num2str(handles.freq(1,7)))
   set(handles.edit3,'string',num2str(handles.freq(2,7)))
    elseif(val==8)
    axes(handles.axes2);
   plot(handles.digi{8});
   set(handles.edit2,'string',num2str(handles.freq(1,8)))
   set(handles.edit3,'string',num2str(handles.freq(2,8)))
    elseif(val==9)
 axes(handles.axes2);
   plot(handles.digi{9});
   set(handles.edit2,'string',num2str(handles.freq(1,9)))
   set(handles.edit3,'string',num2str(handles.freq(2,9)))
    elseif(val==10)
   axes(handles.axes2);
   plot(handles.digi{10});
   set(handles.edit2,'string',num2str(handles.freq(1,10)))
   set(handles.edit3,'string',num2str(handles.freq(2,10)))
end


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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


% --- Executes on key press with focus on listbox1 and none of its controls.
function listbox1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
