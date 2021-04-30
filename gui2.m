function convertRGB()
  %canvas here:
  f1=figure('units','pixels','position', [200 200 1000 400]);
  
  
  ax1=axes('units','normalize','position',[0.05 0.1 0.3 0.3]);
  ax2=axes('units','normalize','position',[0.55 0.1 0.3 0.3]);
  
  txt1=uicontrol('units','normalize','style','text','string','R :','position',[0.35 0.4 0.1 0.1]);
  txt2=uicontrol('units','normalize','style','text','string','G :','position',[0.35 0.3 0.1 0.1]);
  txt3=uicontrol('units','normalize','style','text','string','B :','position',[0.35 0.2 0.1 0.1]);
  
  edit1=uicontrol('units','normalize','style','edit','position',[0.45 0.4 0.05 0.1],'enable','off');
  edit2=uicontrol('units','normalize','style','edit','position',[0.45 0.3 0.05 0.1],'enable','off');
  edit3=uicontrol('units','normalize','style','edit','position',[0.45 0.2 0.05 0.1],'enable','off');
  
  rad1=uicontrol('units','normalize','style','radiobutton','string','Default','position',[0.35 0.5 0.1 0.1],'value',1);
  rad2=uicontrol('units','normalize','style','radiobutton','string','Manual','position',[0.35 0.6 0.1 0.1],'value',0);
  
  set(rad1, 'callback',{@radbtn1 rad1,rad2,edit1,edit2,edit3})
  set(rad2, 'callback',{@radbtn2 rad1,rad2,edit1,edit2,edit3})
  
  push1=uicontrol('units','normalize','style','pushbutton','string','buka file','position',[0.1 0.8 0.15 0.1],'callback',{@bukafile ax1});
  push2=uicontrol('units','normalize','style','pushbutton','string','convert','position',[0.5 0.8 0.15 0.1],'callback', {@convert edit1,edit2,edit3,ax2,rad1});
endfunction

function radbtn1(hObject, eventdata, rad1,rad2,edit1,edit2,edit3)
  set(rad1,'value',1)
  set(rad2,'value',0)
  set(edit1,'enable','off')
  set(edit2,'enable','off')
  set(edit3,'enable','off')
endfunction

function radbtn2(hObject, eventdata, rad1,rad2,edit1,edit2,edit3)
  set(rad1,'value',0)
  set(rad2,'value',1)
  set(edit1,'enable','on')
  set(edit2,'enable','on')
  set(edit3,'enable','on')
endfunction

function bukafile(hObject,eventdata,ax1)
  [namafile pathfile] = uigetfile('*.jpg','browse jpg file')
  img1=imread([pathfile namafile]);
  axes(ax1);
  imshow(img1);
  save img1.mat img1
endfunction

function convert(hObject,eventdata,edit1,edit2,edit3,ax2,rad1)
  load img1.mat;
  a=str2num(get(edit1,'string'));
  b=str2num(get(edit2,'string'));
  c=str2num(get(edit3,'string'));
  if (get(rad1,'value')==1)
    grey=rgb2gray(img1);
  else
    R=img1(:,:,1);
    G=img1(:,:,2);
    B=img1(:,:,3);
    grey=a*R+b*G+c*B;
  endif
  axes(ax2);
  imshow(grey);
  save grey.mat grey
endfunction

