function varargout = ChooseLevelMenu(varargin)
% Last Modified by GUIDE v2.5 31-May-2022 15:48:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ChooseLevelMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @ChooseLevelMenu_OutputFcn, ...
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


% --- Executes just before ChooseLevelMenu is made visible.
function ChooseLevelMenu_OpeningFcn(hObject, ~, handles, varargin)
    handles.output = hObject;
  
    imshow("menu_picture.jpg");
    guidata(hObject, handles);
    % UIWAIT makes ChooseLevelMenu wait for user response (see UIRESUME)
    % uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChooseLevelMenu_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;


function tag_level1_Callback(~, ~, ~)
    game(1);
    closereq();


function tag_level2_Callback(~, ~, ~)
    game(2);
    closereq();


function tag_level3_Callback(~, ~, ~)
    game(3);
    closereq();


function tag_close_Callback(~, ~, ~)
    closereq();


function tag_back_Callback(~, ~, ~)
    mainMenu();
    closereq();

function tag_instruction_Callback(~, ~, ~)
    instruction();
