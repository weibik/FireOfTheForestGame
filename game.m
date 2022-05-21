function varargout = game(varargin)

% Edit the above text to modify the response to help game

% Last Modified by GUIDE v2.5 13-May-2022 16:23:43

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
set(handles.tag_background,'visible', 'off');

% Choose default command line output for game
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.tag_level, "String", newline + "LEVEL " + varargin{1})
simulation(90);

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
ChooseLevelMenu();
closereq();


% --- Executes on button press in tag_close.
function tag_close_Callback(hObject, eventdata, handles)
closereq();