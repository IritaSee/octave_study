function sldku()

f1 = figure('units','normalized','position', [0.1 0.2 1 0.6])
ax1 = axes('units','normalized','position', [0.04 0.2 0.2 0.3])
ax2 = axes('units','normalized','position', [0.4 0.2 0.2 0.3])
ax3 = axes('units','normalized','position', [0.65 0.2 0.2 0.3])


txt1 = uicontrol('units','normalized','style','text','string',...
'a : ','position',[0.25 0.55 0.05 0.1])
edit1 = uicontrol('units','normalized','style','edit','string',...
'0.5','position',[0.31 0.55 0.05 0.1])

txt2 = uicontrol('units','normalized','style','text','string',...
'b : ','position',[0.25 0.45 0.05 0.1])
edit2 = uicontrol('units','normalized','style','edit','string',...
'0.3','position',[0.31 0.45 0.05 0.1])

txt3 = uicontrol('units','normalized','style','text','string',...
'c : ','position',[0.25 0.35 0.05 0.1])
edit3 = uicontrol('units','normalized','style','edit','string',...
'0.2','position',[0.31 0.35 0.05 0.1])
edit4 = uicontrol('units','normalized','style','edit','string',...
'0.2','position',[0.65 0.5 0.05 0.1])

rd1 = uicontrol('units','normalized','style','radiobutton','string',...
'Default','position',[0.25 0.24 0.1 0.1],'value',1)
rd2 = uicontrol('units','normalized','style','radiobutton','string',...
'Manual','position',[0.25 0.14 0.1 0.1],'value',0)

%rd3 = uicontrol('units','normalized','style','radiobutton','string',...
%'Manual2','position',[0.45 0.04 0.1 0.1],'value',0)

push1 = uicontrol('units','normalized','style','pushbutton','string',...
'Buka File','position',[0.06 0.6 0.15 0.1],'callback',{@browse ax1})
push2 = uicontrol('units','normalized','style','pushbutton','string',...
'Convert','position',[0.42 0.6 0.15 0.1],'callback',{@konversi rd1 ax2 ax3 edit1 edit2 edit3})

sld = uicontrol('style', 'slider','min',0,'max',1,'units', 'normalized',...
        'position', [0.65 0.6 0.2 0.1])
set(sld,'callback',{@slider  sld ax3 edit4})
%run = uicontrol('units','normalized','style','pushbutton','string',...
%'Run','position',[0.72 0.04 0.05 0.05],'callback',{@slider  sld ax3 edit4})

set(rd1,'callback',{@radbtn1 rd1 rd2 edit1 edit2 edit3})
set(rd2,'callback',{@radbtn2 rd1 rd2 edit1 edit2 edit3})
%set(rd3,'callback',{@radbtn3 rd1 rd2 rd3 edit1 edit2 edit3})
endfunction

function radbtn1(hObject, eventdata, rd1,rd2,edit1,edit2,edit3)
  set(rd1,'value',1);
  set(rd2,'value',0);

  %kemudian edit1, 2 dan 3 harus didisable
  set(edit1,'enable','off');
  set(edit2,'enable','off');
  set(edit3,'enable','off');
endfunction

function radbtn2(hObject, eventdata, rd1,rd2,edit1,edit2,edit3)
  set(rd1,'value',0);
  set(rd2,'value',1);

  set(edit1,'enable','on');
  set(edit2,'enable','on');
  set(edit3,'enable','on');
  uicontrol(edit1)
endfunction

function browse(hObject, eventdata, ax1)
  [namafile pathfile] = uigetfile('*.jpg',  'buka file jpg')
  img1 = imread([pathfile namafile]);
  axes(ax1);
  imshow(img1);
  save img1.mat img1
endfunction

function konversi(hObject, eventdata, rd1,ax2,ax3,edit1,edit2,edit3)
load img1.mat

p = get(rd1,'value')
if p == 1 
  gray1 = rgb2gray(img1);
  axes(ax2);
  imshow(gray1);
  save gray1.mat gray1

  else p == 0

  a= str2num(get(edit1,'string'));
  b= str2num(get(edit2,'string'));
  c= str2num(get(edit3,'string'));
 
  R=img1(:,:,1);
  G=img1(:,:,2);
  B=img1(:,:,3);

  Gray=a*R+b*G+c*B;
  axes(ax2);
  imshow(Gray);
  save Gray.mat Gray;
  
endif
 endfunction
 
 function slider(hObject, eventdata,sld,ax3,edit4)
   load Gray.mat 
   get(sld)
   k = get(sld,'value')
   k2= k*255
   set(edit4,'string',num2str(k2));
   
   %Th = 75; 
  BW = (Gray>=k2);
  %uicontrol('style', 'text','units','normalized','string', num2str(k),...
  %'position', [0.78 0.04 0.05 0.05]);
  axes(ax3);
 imshow(BW);

 % save BW.mat BW
 endfunction
 
 