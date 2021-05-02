%Thresholdnya pake slider ya
function convertRGB()
  %canvas here:
  f1=figure('units','pixels','position', [200 200 1500 400]);
  
  ax1=axes('units','pixels','position',[60 50 250 250]);
  ax2=axes('units','pixels','position',[500 50 250 250]);
  ax3=axes('units','pixels','position',[1200 50 250 250]);
  
  txt1=uicontrol('units','pixels','style','text','string','R :','position',[350 150 25 25]);
  txt2=uicontrol('units','pixels','style','text','string','G :','position',[350 100 25 25]);
  txt3=uicontrol('units','pixels','style','text','string','B :','position',[350 50 25 25]);
  
  edit1=uicontrol('units','pixels','style','edit','position',[400 150 50 25],'enable','off');
  edit2=uicontrol('units','pixels','style','edit','position',[400 100 50 25],'enable','off');
  edit3=uicontrol('units','pixels','style','edit','position',[400 50 50 25],'enable','off');
  
  rad1=uicontrol('units','pixels','style','radiobutton','string','Default','position',[350 250 75 25],'value',1);
  rad2=uicontrol('units','pixels','style','radiobutton','string','Manual','position',[350 225 75 25],'value',0);
  
  set(rad1, 'callback',{@radbtn1 rad1,rad2,edit1,edit2,edit3})
  set(rad2, 'callback',{@radbtn2 rad1,rad2,edit1,edit2,edit3})
  
  push1=uicontrol('units','pixels','style','pushbutton','string','buka file','position',[150 350 75 25],'callback',{@bukafile ax1});
  push2=uicontrol('units','pixels','style','pushbutton','string','convert','position',[550 350 75 25],'callback', {@convert edit1,edit2,edit3,ax2,rad1});
 
  
  
  slide=uicontrol('style','slider','Min',0,'Max',255,'value',1,'units','pixels','position',[850 250 200 20]);
  edit4=uicontrol('units','pixels','style','edit','position',[925 225 50 25],'enable','off');
  push4=uicontrol('units','pixels','style','pushbutton','string','update','position',[910 200 75 25],'callback',{@showval slide,edit4});
  push3=uicontrol('units','pixels','style','pushbutton','string','apply threshold','position',[900 100 110 50],'callback',{@bwmaker slide,ax3});
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

function bwmaker(hObject,eventdata,slide,ax3)
  load grey.mat
  th = get(slide,'value');
  bw=(grey<=th);
  axes(ax3);
  imshow(bw);
endfunction

function showval(hObject,eventdata,slide,edit4)
  val=get(slide,'value');
  set(edit4,'string',int2str(val));
endfunction