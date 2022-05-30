function varargout = game(varargin)

% Edit the above text to modify the response to help game

% Last Modified by GUIDE v2.5 30-May-2022 15:38:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game_OpeningFcn, ...
                   'gui_OutputFcn',  @game_OutputFcn, ...
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


% --- Executes just before game is made visible.
function game_OpeningFcn(hObject, eventdata, handles, varargin)


% Choose default command line output for game
handles.output = hObject;

% Update handles structure
axes(handles.tag_simulation);

choice = varargin{1};
switch choice
    case 1
        handles.density = 70;
        handles.wind = 35;
        handles.speed = 0.1;
        handles.x = 50;
        handles.y = 50;
    case 2
        handles.density = 80;
        handles.wind = 40;
        handles.speed = 0.1;
        handles.x = [25 70];
        handles.y = [25 70];
    case 3
        handles.density = 90;
        handles.wind = 45;
        handles.speed = 0.1;
        handles.x = [15 70 45];
        handles.y = [15 70 64];
    otherwise
        disp("Wrong choice")
end

handles.sim = simulation(handles.density);
set(handles.tag_level, "String", newline + "LEVEL " + varargin{1});
set(handles.tag_background,'visible', 'off');

guidata(hObject, handles);

%{
choice = varargin{1};
switch choice
    case 1
        fireSpread(handles, simulation(90), 50, 0.1, 50, 50)
    case 2
        fireSpread(handles, simulation(90), 50, 0.1, 50, 50)
    case 3
        fireSpread(handles, simulation(90), 50, 0.1, 50, 50)
    otherwise
        disp("Wrong choice")
end
guidata(hObject, handles);
%}

% UIWAIT makes game wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = game_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in tag_instruction.
function tag_instruction_Callback(hObject, eventdata, handles)
instruction();

% --- Executes on button press in tag_back.
function tag_back_Callback(hObject, eventdata, handles)
setappdata(handles.tag_simulation, 'stopPlot', 1);
guidata(hObject, handles);
ChooseLevelMenu();
closereq();


% --- Executes on button press in tag_close.
function tag_close_Callback(hObject, eventdata, handles)
setappdata(handles.tag_simulation, 'stopPlot', 1);
guidata(hObject, handles);
closereq();     

% --- Executes on button press in tag_start.
function tag_start_Callback(hObject, eventdata, handles)
fireSpread(handles, simulation(handles.density), handles.wind, handles.speed, handles.x, handles.y);