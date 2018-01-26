function varargout = interface(varargin)
% INTERFACE MATLAB code for interface.fig
%      INTERFACE, by itself, creates a new INTERFACE or raises the existing
%      singleton*.
%
%      H = INTERFACE returns the handle to a new INTERFACE or the handle to
%      the existing singleton*.
%
%      INTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE.M with the given input arguments.
%
%      INTERFACE('Property','Value',...) creates a new INTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interface

% Last Modified by GUIDE v2.5 24-Jan-2018 19:03:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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


% --- Executes just before interface is made visible.
function interface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interface (see VARARGIN)
im_1 = imread('images/1.jpg');
im_2 = imread('images/2.jpg');
im_3 = imread('images/3.jpg');
im_4 = imread('images/4.jpg');
im_5 = imread('images/5.jpg');
im_6 = imread('images/6.jpg');
im_7 = imread('images/7.jpg');
im_8 = imread('images/8.jpg');
im_9 = imread('images/9.jpg');
im_0 = imread('images/0.jpg');
im_w = imread('images/w.jpg');
im_r = imread('images/r.jpg');
im_t = imread('images/t.jpg');
im_p = imread('images/p.jpg');
im_s = imread('images/s.jpg');
im_d = imread('images/d.jpg');
im_f = imread('images/f.jpg');
im_g = imread('images/g.jpg');
im_h = imread('images/h.jpg');
im_j = imread('images/j.jpg');
im_k = imread('images/k.jpg');
im_l = imread('images/l.jpg');
im_z = imread('images/z.jpg');
im_x = imread('images/x.jpg');
im_v = imread('images/v.jpg');
im_b = imread('images/b.jpg');
im_n = imread('images/n.jpg');
im_streepje = imread('images/-.jpg');
charsIm = {im_1, im_2, im_3, im_4, im_5, im_6, im_7, im_8, im_9, im_b, im_d, im_f, im_g, im_h, im_j, im_k, im_l, im_n, im_p, im_r, im_s, im_t, im_v, im_w, im_x, im_z,im_streepje};
indeces = ['1' '2' '3' '4' '5' '6' '7' '8' '9' 'B' 'D' 'F' 'G' 'H' 'J' 'K' 'L' 'N' 'P' 'R' 'S' 'T' 'V' 'W' 'X' 'Z' '-'];
for i=1:length(charsIm)
    charImage = charsIm{i};
    charImage = uint8(~threshold(rgb2gray(charImage)));
    charImage(all(~charImage,2),:) = [];
    charImage(:,all(~charImage,1)) = [];
    charsIm{i} = imresize(charImage, [80, 54]);
end
handles.charsIm = charsIm;
handles.indeces = indeces;


% Choose default command line output for interface
handles.output = hObject;
run('chars.m');
vid = videoinput('winvideo');
handles.vid = vid;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interface wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
axes(handles.axes2);
counter = 0;
video = VideoReader('images/TrainingVideo.avi');
plates = {};
table = {};
frame = 0;
while hasFrame(video)
    frame = frame + 1;
    vidFrame = readFrame(video);
    image(vidFrame,'Parent',handles.axes1);
    if counter==2
        %image(calculate(vidFrame).*255,'Parent',handles.axes2);
        
        plate = license_Pro(calculate(vidFrame),handles.charsIm,handles.indeces);
        matches = strfind(plates,plate);
        if  any(horzcat(matches{:}))==0
            plates{length(plates) + 1} = plate;
        else
            plates = {};
            any(horzcat(strfind(table,plate)))==0
            row = {plate, frame, video.currentTime};
            table = [table; row];
            handles.uitable1.Data = table;
        end
        counter = 0;
         
        %add plate to table if not it not already has plate
    end
    axes1.Visible='off';
    counter= counter + 1;
end




% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
