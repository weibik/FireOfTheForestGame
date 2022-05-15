function varargout = freeModeMenu(varargin)
% FREEMODEMENU MATLAB code for freeModeMenu.fig
%      FREEMODEMENU, by itself, creates a new FREEMODEMENU or raises the existing
%      singleton*.
%
%      H = FREEMODEMENU returns the handle to a new FREEMODEMENU or the handle to
%      the existing singleton*.
%
%      FREEMODEMENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FREEMODEMENU.M with the given input arguments.
%
%      FREEMODEMENU('Property','Value',...) creates a new FREEMODEMENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before freeModeMenu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to freeModeMenu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help freeModeMenu

% Last Modified by GUIDE v2.5 13-May-2022 16:31:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @freeModeMenu_OpeningFcn, ...
                   'gui_OutputFcn',  @freeModeMenu_OutputFcn, ...
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


% --- Executes just before freeModeMenu is made visible.
function freeModeMenu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to freeModeMenu (see VARARGIN)

% Choose default command line output for freeModeMenu
handles.output = hObject; 

% Update handles structure
guidata(hObject, handles);
simulation(10);
% UIWAIT makes freeModeMenu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = freeModeMenu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tag_close.
function tag_close_Callback(hObject, eventdata, handles)
closereq();


% --- Executes on button press in tag_back.
function tag_back_Callback(hObject, eventdata, handles)
mainMenu();
closereq();


% --- Executes on button press in tag_lightning.
function tag_lightning_Callback(hObject, eventdata, handles)


% --- Executes on slider movement.
function tag_wind_slider_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function tag_wind_slider_CreateFcn(hObject, eventdata, handles)


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function tag_time_to_burn_slider_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function tag_time_to_burn_slider_CreateFcn(hObject, eventdata, handles)


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in tag_update.
function tag_update_Callback(hObject, eventdata, handles)
simulation(2);
