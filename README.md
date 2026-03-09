# image-processing-filters-matlab

Comparison of several image filtering techniques for noise reduction and edge detection.

---
## Filters Implemented
- Mean filter
- Median filter
- Conservative filter
- Laplacian filter
- Sobel operator
---
## Results
Conservative filtering achieved the best balance between noise removal and edge preservation.

---
## Codes
function varargout = BASICGUI(varargin)
% BASICGUI MATLAB code for BASICGUI.fig
%      BASICGUI, by itself, creates a new BASICGUI or raises the existing
%      singleton*.
%
%      H = BASICGUI returns the handle to a new BASICGUI or the handle to
%      the existing singleton*.
%
%      BASICGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASICGUI.M with the given input arguments.
%
%      BASICGUI('Property','Value',...) creates a new BASICGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BASICGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BASICGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BASICGUI

% Last Modified by GUIDE v2.5 09-Apr-2022 09:27:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BASICGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BASICGUI_OutputFcn, ...
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


% --- Executes just before BASICGUI is made visible.
function BASICGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BASICGUI (see VARARGIN)

% Choose default command line output for BASICGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BASICGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BASICGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
    
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mean_pushbutton.
function mean_pushbutton_Callback(hObject, eventdata, handles)
      
       I=getappdata(0,'a')
I=imread('Test_image.jpg');
%figure(1), imshow(a)
I=rgb2gray(I);
%an=imnoise(a,'gaussian');
[m,n]=size(I);
%figure(3), imshow(uint8(a))
b=input('Enter Averaging Mask size: ');
z=ones(b);
[p,q]=size(z);
w=1:p;
x=round(median(w));
anz=zeros(m+2*(x-1),n+2*(x-1));
for i=x:(m+(x-1))
    for j=x:(n+(x-1))
        anz(i,j)=I(i-(x-1),j-(x-1));
    end
end
%figure, imshow(uint8(anz))
sum=0;
x=0;
y=0;
for i=1:m
    for j=1:n
        for k=1:p
            for l=1:q 
                sum= sum+anz(i+x,j+y)*z(k,l);
                y=y+1;
            end
            y=0;
            x=x+1;
        end
        x=0;
        ans(i,j)=(1/(p*q))*(sum);
        sum=0;
    end
end

%figure(2), imshow(uint8(ans))
          axes(handles.axes2);
             imshow(uint8(ans))
         setappdata(0,'name',uint8(ans))
            
% hObject    handle to mean_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in conservativesmoothing_pushbutton.
function conservativesmoothing_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to conservativesmoothing_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in median_pushbutton.
function median_pushbutton_Callback(hObject, eventdata, handles)
I=getappdata(0,'I')
I=imread('Test_image.jpg');
figure;imshow(I,[]);
if(size(I,3)~=1)
I=rgb2gray(I);
end
rr=0.1;  

[M,N]=size(I);
new =I-I
disp('******Note:zero-padding method is used!****');
disp('                                                           ');
kernel_size=input('enter the size of the kernel for the Median-ranking? 3 or 5 or 7 or 9=  ');
k=zeros(kernel_size);  %k is the kernel used. 
start=kernel_size-floor(kernel_size*0.5);
for x=start:1:M-floor(kernel_size*0.5)
for y=start:1:N-floor(kernel_size*0.5)

%defining x1 & y1 as the 1st coordinates in the kernel
x1=x-(floor(kernel_size*0.5));
y1=y-(floor(kernel_size*0.5));

%specifying image pixels to the kernel
for p=1:1:kernel_size
for q=1:1:kernel_size
 k(p,q)=I(x1+p-1,y1+q-1);
end    
end
d=reshape(k,1,[]);  %k values into an array d 
[r,c]=size(d);
%**Ordering kernel members******
for j=1:1:c-1
for i=1:1:c-1
    a=d(1,i);
    b=d(1,i+1);
    if(a>b)
     d(1,i)=b;
     d(1,i+1)=a;
    end
    end  
end
Median=d(1,floor(kernel_size*kernel_size*0.5)+1);
  %******end of ordering****
  %***************

   new(x,y)=Median;    
end
end
% figure;imshow(I,[]);
 axes(handles.axes2)
imshow(new,[]);
 setappdata(0,'name',new)
% hObject    handle to median_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in inputimage_pushbutton.
function inputimage_pushbutton_Callback(hObject, eventdata, handles)
        [FileName,FilePath]=uigetfile('.','SELECT FILE');
         name=strcat(FilePath,FileName);
         a=imread(name);
         axes(handles.axes1);
         imshow(a)
% hObject    handle to inputimage_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clear_pushbutton.
function clear_pushbutton_Callback(hObject, eventdata, handles)
I= getappdata(0,'I');
imshow(I);

% hObject    handle to clear_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in laplace_pushbutton.
function laplace_pushbutton_Callback(hObject, eventdata, handles)
I = getappdata(0,'I')
I = im2double(imread('Test_image.jpg')); %// Read in your image
lap = [-1 -1 -1; -1 8 -1; -1 -1 -1]; %// Change - Centre is now positive
pad1=size(lap,1)-1;

pad2=size(lap,2)-1;

resp =uint8(zeros(size(I)));

if(size(lap,1)==1)

   

 B=zeros(size(I,1),size(I,2)+pad2);

 m=0;

 n=floor(size(lap,2)/2);

 sz1=size(B,1);

 sz2=size(B,2)-pad2;

elseif(size(lap,2)==1)

    B=zeros(size(I,1)+pad1,size(I,2));

    m=floor(size(lap,1)/2);

    n=0;

    sz1=size(B,1)-pad1;

   sz2=size(B,2);

else

    B=zeros(size(I,1)+pad1,size(I,2)+pad2);

    m=floor(size(lap,1)/2);

    n=floor(size(lap,2)/2);

   

    sz1=size(B,1)-pad1;

 sz2=size(B,2)-pad2;

end

 for i=1:size(I,1)

     for j=1:size(I,2)

         B(i+m,j+n)=I(i,j);

     end

 end

 szcorr1=size(lap,1);

 szcorr2=size(lap,2);


for i=1:sz1

    for j=1:sz2

        sum=0;

        m=i;

        n=j;

        for x=1:szcorr1

          for y=1:szcorr2

       %The weighted sum of the neighborhood pixels is calculated.

               sum=sum+(B(m,n)*lap(x,y));

               n =n+1;                    

           end

             n=j;

            m=m+1;

       end

        resp(i,j)= sum;

    end

end


resp = imfilter(I, lap); %// Change

%// Change - Normalize the response image
minR = min(resp(:));
maxR = max(resp(:));
resp = (resp - minR) / (maxR - minR);

%// Change - Adding to original image now
sharpened = I + resp;

%// Change - Normalize the sharpened result
minA = min(sharpened(:));
maxA = max(sharpened(:));
sharpened = (sharpened - minA) / (maxA - minA);

%// Change - Perform linear contrast enhancement
sharpened = imadjust(sharpened, [60/255 200/255], [0 1]);

% figure; 
% subplot(1,3,1);imshow(I); title('Original image');
% subplot(1,3,2);imshow(resp); title('Laplacian filtered image');
% subplot(1,3,3);imshow(sharpened); title('Sharpened image');
 
 imshow(sharpened)
 axes(handles.axes2)
setappdata(0,'name',sharpened)
% hObject    handle to laplace_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
