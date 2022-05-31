function varargout = ChooseLevelMenu(varargin)
% Last Modified by GUIDE v2.5 12-May-2022 11:22:22

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
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ChooseLevelMenu (see VARARGIN)

% Choose default command line output for ChooseLevelMenu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow("menu_picture.jpg");
% UIWAIT makes ChooseLevelMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ChooseLevelMenu_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tag_level1.
function tag_level1_Callback(~, ~, ~)
game(1);
closereq();


% --- Executes on button press in tag_level2.
function tag_level2_Callback(~, ~, ~)
game(2);
closereq();


% --- Executes on button press in tag_level3.
function tag_level3_Callback(~, ~, ~)
game(3);
closereq();


% --- Executes on button press in tag_close.
function tag_close_Callback(~, ~, ~)
closereq();


% --- Executes on button press in tag_back.
function tag_back_Callback(~, ~, ~)
mainMenu();
closereq();
