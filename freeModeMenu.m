function varargout = freeModeMenu(varargin)

% Last Modified by GUIDE v2.5 31-May-2022 12:43:24

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
function freeModeMenu_OpeningFcn(hObject, ~, handles, varargin)
    handles.output = hObject; 
    
    handles.density = 95;
    handles.wind = 70;
    handles.speed = 0.01;
    handles.fighterX = [];
    handles.fighterY = [];
    
    set(handles.tag_wind, "String", "WIND " + handles.wind);
    set(handles.tag_speed, "String","SPEED " + (1 - handles.speed));
    set(handles.tag_density, "String", newline + "DENSITY " + handles.density);
    handles.sim = simulation(handles.density);
    set(handles.tag_background,'visible', 'off');
    
    guidata(hObject, handles);
    % UIWAIT makes freeModeMenu wait for user response (see UIRESUME)
    % uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = freeModeMenu_OutputFcn(~, ~, handles) 
    varargout{1} = handles.output;

function tag_close_Callback(hObject, ~, handles)
    setappdata(handles.tag_simulation, 'stopPlot', 1);
    guidata(hObject, handles);
    closereq();

function tag_back_Callback(hObject, ~, handles)
    setappdata(handles.tag_simulation, 'stopPlot', 1);
    guidata(hObject, handles);
    mainMenu();
    closereq();

function tag_lightning_Callback(hObject, ~, handles)
    [x, y] = ginput(1);
    handles.x = round(x, 0);
    handles.y = round(y, 0);
    set(handles.tag_cords, "String", "COORDINATES OF THE FIRE: " + handles.x + " " + handles.y);
    guidata(hObject, handles);

 

function tag_wind_slider_Callback(~, ~, ~)    
function tag_wind_slider_CreateFcn(~, ~, ~) 

function tag_density_slider_Callback(~, ~, ~)    
function tag_density_slider_CreateFcn(~, ~, ~) 

function tag_speed_slider_Callback(~, ~, ~)    
function tag_speed_slider_CreateFcn(~, ~, ~) 

function tag_update_Callback(hObject, ~, handles)
    handles.density = get(handles.tag_density_slider, 'Value') * 100;
    handles.density = round(handles.density, 0);
    handles.speed = get(handles.tag_speed_slider, 'Value');
    handles.speed = round(handles.speed, 2);
    handles.wind = get(handles.tag_wind_slider, 'Value') * 100;
    handles.wind = round(handles.wind, 0);
    set(handles.tag_wind, "String", "WIND " + handles.wind);
    set(handles.tag_speed, "String","SPEED " + ( 1 - handles.speed));
    set(handles.tag_density, "String", newline + "DENSITY " + handles.density);
    handles.x = [];
    handles.y = [];
    handles.fighterX = [];
    handles.fighterY = [];
    cla(handles.tag_simulation);
    guidata(hObject, handles);
    handles.sim = simulation(handles.density);
    guidata(hObject, handles);

function tag_firefigther_Callback(hObject, ~, handles)
    [x, y] = ginput(1);
    handles.fighterX = round(x, 0);
    handles.fighterY = round(y, 0);
    guidata(hObject, handles);

function tag_start_Callback(~, ~, handles)
    if isempty(handles.fighterX)
        fireSpread(handles, simulation(handles.density), handles.wind, handles.speed, handles.x, handles.y);
    else
        fireSpread(handles, simulation(handles.density), handles.wind, handles.speed, handles.x, handles.y, handles.fighterX, handles.fighterY);
    end


