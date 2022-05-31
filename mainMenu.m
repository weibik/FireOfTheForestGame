function varargout = mainMenu(varargin)

% Last Modified by GUIDE v2.5 11-May-2022 19:31:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @mainMenu_OutputFcn, ...
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


% --- Executes just before mainMenu is made visible.
function mainMenu_OpeningFcn(hObject, ~, handles, varargin)
    imshow("menu_picture.jpg");
    handles.output = hObject;
    guidata(hObject, handles);   
    % UIWAIT makes mainMenu wait for user response (see UIRESUME)
    % uiwait(handles.figure1);

function varargout = mainMenu_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

function tag_start_Callback(~, ~, ~)
    ChooseLevelMenu();
    closereq();

function tag_free_Callback(~, ~, ~)
    freeModeMenu();
    closereq();

function tag_close_Callback(~, ~, ~)
    closereq();
