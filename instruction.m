function varargout = instruction(varargin)

% Last Modified by GUIDE v2.5 31-May-2022 15:45:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @instruction_OpeningFcn, ...
                   'gui_OutputFcn',  @instruction_OutputFcn, ...
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


% --- Executes just before instruction is made visible.
function instruction_OpeningFcn(hObject, eventdata, handles, varargin)
    handles.output = hObject;
    guidata(hObject, handles);
    % UIWAIT makes instruction wait for user response (see UIRESUME)
    % uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = instruction_OutputFcn(hObject, eventdata, handles) 
    varargout{1} = handles.output;
    axis off;


% --- Executes on button press in tag_close.
function tag_close_Callback(hObject, eventdata, handles)
    closereq();
