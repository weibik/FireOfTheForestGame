function varargout = game(varargin)

% Edit the above text to modify the response to help game

% Last Modified by GUIDE v2.5 31-May-2022 14:51:13

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
function game_OpeningFcn(hObject, ~, handles, varargin)
    handles.output = hObject;
    
    axes(handles.tag_simulation);
    
    handles.choice = varargin{1};
    switch handles.choice
        case 1
            handles.density = 75;
            handles.wind = 38;
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
    handles.fighterX = [];
    handles.fighterY = [];
    handles.sim = simulation(handles.density);
    set(handles.tag_level, "String", newline + "LEVEL " + varargin{1});
    set(handles.tag_background,'visible', 'off');
    
    guidata(hObject, handles);
    % UIWAIT makes game wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

function varargout = game_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

function tag_instruction_Callback(~, ~, ~)
    instruction();

function tag_firefighters_Callback(hObject, ~, handles)
    [x, y] = ginput(3);
    handles.fighterX = round(x, 0);
    handles.fighterY = round(y, 0);
    guidata(hObject, handles);

function tag_back_Callback(hObject, ~, handles)
    setappdata(handles.tag_simulation, 'stopPlot', 1);
    guidata(hObject, handles);
    ChooseLevelMenu();
    closereq();

function tag_close_Callback(hObject, ~, handles)
    setappdata(handles.tag_simulation, 'stopPlot', 1);
    guidata(hObject, handles);
    closereq();     

function tag_start_Callback(~, ~, handles)
    if isempty(handles.fighterX)
        forest = fireSpread(handles, simulation(handles.density), handles.wind, handles.speed, handles.x, handles.y);
    else
        forest = fireSpread(handles, simulation(handles.density), handles.wind, handles.speed, handles.x, handles.y, handles.fighterX, handles.fighterY);
    end
    if winningCheck(forest)
        message = msgbox("Congratulations! You have won!");     %#ok<NASGU> 
    else
        message = msgbox("You've lost. Try again");             %#ok<NASGU> 
    end

function tag_refresh_Callback(~, ~, handles)
    game(handles.choice)
