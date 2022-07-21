function varargout = UIInterf(varargin)

gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UIInterf_OpeningFcn, ...
                   'gui_OutputFcn',  @UIInterf_OutputFcn, ...
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


%==============================================================

function UIInterf_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

handles.bd = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
handles.flag = false;
handles.stt = "Continue";
handles.score = 0;

handles.namee = "yinlong";
handles.namescore = zeros(2,10);
handles.dummy = zeros(2,10);

guidata(hObject, handles);

%==============================================================

function varargout = UIInterf_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function bd11_Callback(hObject, eventdata, handles)
function bd11_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Status_Callback(hObject, eventdata, handles)


function Status_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Score_Callback(hObject, eventdata, handles)

function Score_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%==============================================================

function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


    for i = 1:5
        if handles.namescore(2,i)<handles.score
            handles.namescore(1,i) = handles.namee;
            handles.namescore(2,i) = handles.score;
            break
        end
    end


handles.score = 0;
handles.bd = startgame();
handles.score = 0;
handles.stt = "New Game";
handles.namee = get(handles.name,'string');

guidata(hObject,handles)
data = guidata(hObject)
set(handles.Score,'string',handles.score);
set(handles.Status,'string',handles.stt);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(1,1));
set(handles.bd32,'string',handles.bd(1,2));
set(handles.bd33,'string',handles.bd(1,3));
set(handles.bd34,'string',handles.bd(1,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

set(handles.score1,'string',handles.namescore(2,1));
set(handles.score2,'string',handles.namescore(2,2));
set(handles.score3,'string',handles.namescore(2,3));
set(handles.score4,'string',handles.namescore(2,4));
set(handles.score5,'string',handles.namescore(2,5));

set(handles.name1,'string',handles.namescore(1,1));
set(handles.name2,'string',handles.namescore(1,2));
set(handles.name3,'string',handles.namescore(1,3));
set(handles.name4,'string',handles.namescore(1,4));
set(handles.name5,'string',handles.namescore(1,5));


function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.bd = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
handles.stt = "New Game";
handles.namee = get(handles.name,'string');

handles.dummy = handles.namescore;

    for i = 1:5
        if handles.namescore(2,i)<handles.score
            handles.namescore(1,i) = handles.namee;
            handles.namescore(2,i) = handles.score;
            break
        end
    end


handles.score = 0;

guidata(hObject,handles)
set(handles.Score,'string',handles.score);
set(handles.Status,'string',handles.stt);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(3,1));
set(handles.bd32,'string',handles.bd(3,2));
set(handles.bd33,'string',handles.bd(3,3));
set(handles.bd34,'string',handles.bd(3,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

set(handles.score1,'string',handles.namescore(2,1));
set(handles.score2,'string',handles.namescore(2,2));
set(handles.score3,'string',handles.namescore(2,3));
set(handles.score4,'string',handles.namescore(2,4));
set(handles.score5,'string',handles.namescore(2,5));

set(handles.name1,'string',handles.namescore(1,1));
set(handles.name2,'string',handles.namescore(1,2));
set(handles.name3,'string',handles.namescore(1,3));
set(handles.name4,'string',handles.namescore(1,4));
set(handles.name5,'string',handles.namescore(1,5));



function Up_Callback(hObject, eventdata, handles)
% hObject    handle to Up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = false;
[handles.bd,handles.flag] = up(handles.bd);
        if handles.flag == true
        handles.bd = addnew(handles.bd);
        handles.score = handles.score + 2;
        end
handles.stt = stat(handles.bd);

        if handles.stt == "Ended" || handles.stt == "win"
            handles.bd = [8 8 8 8; 8 8 8 8; 8 8 8 8; 8 8 8 8];
        end

guidata(hObject,handles)
set(handles.Status,'string',handles.stt);
set(handles.Score,'string',handles.score);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(3,1));
set(handles.bd32,'string',handles.bd(3,2));
set(handles.bd33,'string',handles.bd(3,3));
set(handles.bd34,'string',handles.bd(3,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

function Down_Callback(hObject, eventdata, handles)
% hObject    handle to Down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = false;
[handles.bd,handles.flag] = down(handles.bd);
        if handles.flag == true
        handles.bd = addnew(handles.bd);
        handles.score = handles.score + 2;
        end
handles.stt = stat(handles.bd);

        if handles.stt == "Ended" || handles.stt == "win"
            handles.bd = [8 8 8 8; 8 8 8 8; 8 8 8 8; 8 8 8 8];
        end

guidata(hObject,handles)
set(handles.Status,'string',handles.stt);
set(handles.Score,'string',handles.score);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(3,1));
set(handles.bd32,'string',handles.bd(3,2));
set(handles.bd33,'string',handles.bd(3,3));
set(handles.bd34,'string',handles.bd(3,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

function Left_Callback(hObject, eventdata, handles)
% hObject    handle to Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = false;
[handles.bd,handles.flag] = left(handles.bd);
        if handles.flag == true
        handles.bd = addnew(handles.bd);
        handles.score = handles.score + 2;
        end
handles.stt = stat(handles.bd);

        if handles.stt == "Ended" || handles.stt == "win"
            handles.bd = [8 8 8 8; 8 8 8 8; 8 8 8 8; 8 8 8 8];
        end

guidata(hObject,handles)
set(handles.Status,'string',handles.stt);
set(handles.Score,'string',handles.score);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(3,1));
set(handles.bd32,'string',handles.bd(3,2));
set(handles.bd33,'string',handles.bd(3,3));
set(handles.bd34,'string',handles.bd(3,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

function Right_Callback(hObject, eventdata, handles)
% hObject    handle to Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.flag = false;
[handles.bd,handles.flag] = right(handles.bd);
        if handles.flag == true
        handles.bd = addnew(handles.bd);
        handles.score = handles.score + 2;
        end
handles.stt = stat(handles.bd);

        if handles.stt == "Ended" || handles.stt == "win"
            handles.bd = [8 8 8 8; 8 8 8 8; 8 8 8 8; 8 8 8 8];
        end

guidata(hObject,handles)
set(handles.Status,'string',handles.stt);
set(handles.Score,'string',handles.score);

set(handles.bd11,'string',handles.bd(1,1));
set(handles.bd12,'string',handles.bd(1,2));
set(handles.bd13,'string',handles.bd(1,3));
set(handles.bd14,'string',handles.bd(1,4));

set(handles.bd21,'string',handles.bd(2,1));
set(handles.bd22,'string',handles.bd(2,2));
set(handles.bd23,'string',handles.bd(2,3));
set(handles.bd24,'string',handles.bd(2,4));

set(handles.bd31,'string',handles.bd(3,1));
set(handles.bd32,'string',handles.bd(3,2));
set(handles.bd33,'string',handles.bd(3,3));
set(handles.bd34,'string',handles.bd(3,4));

set(handles.bd41,'string',handles.bd(4,1));
set(handles.bd42,'string',handles.bd(4,2));
set(handles.bd43,'string',handles.bd(4,3));
set(handles.bd44,'string',handles.bd(4,4));

%==============================================================

function name1_Callback(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name1 as text
%        str2double(get(hObject,'String')) returns contents of name1 as a double


% --- Executes during object creation, after setting all properties.
function name1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function score1_Callback(hObject, eventdata, handles)
% hObject    handle to score1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score1 as text
%        str2double(get(hObject,'String')) returns contents of score1 as a double


% --- Executes during object creation, after setting all properties.
function score1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name2_Callback(hObject, eventdata, handles)
% hObject    handle to name2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name2 as text
%        str2double(get(hObject,'String')) returns contents of name2 as a double


% --- Executes during object creation, after setting all properties.
function name2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function score2_Callback(hObject, eventdata, handles)
% hObject    handle to score2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score2 as text
%        str2double(get(hObject,'String')) returns contents of score2 as a double


% --- Executes during object creation, after setting all properties.
function score2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name3_Callback(hObject, eventdata, handles)
% hObject    handle to name3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name3 as text
%        str2double(get(hObject,'String')) returns contents of name3 as a double


% --- Executes during object creation, after setting all properties.
function name3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function score3_Callback(hObject, eventdata, handles)
% hObject    handle to score3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score3 as text
%        str2double(get(hObject,'String')) returns contents of score3 as a double


% --- Executes during object creation, after setting all properties.
function score3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name4_Callback(hObject, eventdata, handles)
% hObject    handle to name4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name4 as text
%        str2double(get(hObject,'String')) returns contents of name4 as a double


% --- Executes during object creation, after setting all properties.
function name4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function score4_Callback(hObject, eventdata, handles)
% hObject    handle to score4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score4 as text
%        str2double(get(hObject,'String')) returns contents of score4 as a double


% --- Executes during object creation, after setting all properties.
function score4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name5_Callback(hObject, eventdata, handles)
% hObject    handle to name5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name5 as text
%        str2double(get(hObject,'String')) returns contents of name5 as a double


% --- Executes during object creation, after setting all properties.
function name5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function score5_Callback(hObject, eventdata, handles)
% hObject    handle to score5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of score5 as text
%        str2double(get(hObject,'String')) returns contents of score5 as a double


% --- Executes during object creation, after setting all properties.
function score5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to score5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ScoreReset.
function ScoreReset_Callback(hObject, eventdata, handles)
% hObject    handle to ScoreReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.namescore = zeros(2,10);

set(handles.score1,'string',handles.namescore(2,1));
set(handles.score2,'string',handles.namescore(2,2));
set(handles.score3,'string',handles.namescore(2,3));
set(handles.score4,'string',handles.namescore(2,4));
set(handles.score5,'string',handles.namescore(2,5));

set(handles.name1,'string',handles.namescore(1,1));
set(handles.name2,'string',handles.namescore(1,2));
set(handles.name3,'string',handles.namescore(1,3));
set(handles.name4,'string',handles.namescore(1,4));
set(handles.name5,'string',handles.namescore(1,5));



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double

username = get(handles.name,'string'); %getting player name

% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd12_Callback(hObject, eventdata, handles)
% hObject    handle to bd12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd12 as text
%        str2double(get(hObject,'String')) returns contents of bd12 as a double


% --- Executes during object creation, after setting all properties.
function bd12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd13_Callback(hObject, eventdata, handles)
% hObject    handle to bd13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd13 as text
%        str2double(get(hObject,'String')) returns contents of bd13 as a double


% --- Executes during object creation, after setting all properties.
function bd13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd14_Callback(hObject, eventdata, handles)
% hObject    handle to bd14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd14 as text
%        str2double(get(hObject,'String')) returns contents of bd14 as a double


% --- Executes during object creation, after setting all properties.
function bd14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd21_Callback(hObject, eventdata, handles)
% hObject    handle to bd21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd21 as text
%        str2double(get(hObject,'String')) returns contents of bd21 as a double


% --- Executes during object creation, after setting all properties.
function bd21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd22_Callback(hObject, eventdata, handles)
% hObject    handle to bd22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd22 as text
%        str2double(get(hObject,'String')) returns contents of bd22 as a double


% --- Executes during object creation, after setting all properties.
function bd22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd23_Callback(hObject, eventdata, handles)
% hObject    handle to bd23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd23 as text
%        str2double(get(hObject,'String')) returns contents of bd23 as a double


% --- Executes during object creation, after setting all properties.
function bd23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd24_Callback(hObject, eventdata, handles)
% hObject    handle to bd24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd24 as text
%        str2double(get(hObject,'String')) returns contents of bd24 as a double


% --- Executes during object creation, after setting all properties.
function bd24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd31_Callback(hObject, eventdata, handles)
% hObject    handle to bd31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd31 as text
%        str2double(get(hObject,'String')) returns contents of bd31 as a double


% --- Executes during object creation, after setting all properties.
function bd31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd32_Callback(hObject, eventdata, handles)
% hObject    handle to bd32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd32 as text
%        str2double(get(hObject,'String')) returns contents of bd32 as a double


% --- Executes during object creation, after setting all properties.
function bd32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd33_Callback(hObject, eventdata, handles)
% hObject    handle to bd33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd33 as text
%        str2double(get(hObject,'String')) returns contents of bd33 as a double


% --- Executes during object creation, after setting all properties.
function bd33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd34_Callback(hObject, eventdata, handles)
% hObject    handle to bd34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd34 as text
%        str2double(get(hObject,'String')) returns contents of bd34 as a double


% --- Executes during object creation, after setting all properties.
function bd34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd41_Callback(hObject, eventdata, handles)
% hObject    handle to bd41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd41 as text
%        str2double(get(hObject,'String')) returns contents of bd41 as a double


% --- Executes during object creation, after setting all properties.
function bd41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd42_Callback(hObject, eventdata, handles)
% hObject    handle to bd42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd42 as text
%        str2double(get(hObject,'String')) returns contents of bd42 as a double


% --- Executes during object creation, after setting all properties.
function bd42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd43_Callback(hObject, eventdata, handles)
% hObject    handle to bd43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd43 as text
%        str2double(get(hObject,'String')) returns contents of bd43 as a double


% --- Executes during object creation, after setting all properties.
function bd43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bd44_Callback(hObject, eventdata, handles)
% hObject    handle to bd44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bd44 as text
%        str2double(get(hObject,'String')) returns contents of bd44 as a double


% --- Executes during object creation, after setting all properties.
function bd44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bd44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
