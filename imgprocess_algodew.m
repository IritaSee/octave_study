function mygui()
  g=figure(1, 'position', [100 100 1300 600])
  ax1=axes('unit','pixels','position',[80 160 240 240], 'color', [0.5 0.5 0.5]);
  ax2=axes('unit','pixels','position',[400 160 240 240], 'color', [0.5 0.5 0.5]);
  ax3=axes('unit','pixels','position',[720 160 240 240], 'color', [0.5 0.5 0.5]);

  text2=uicontrol('style','text','position',[75 75 50 50],'string',
  'A');
  text3=uicontrol('style','text','position',[125 75 50 50],'string',
  'B');
  text4=uicontrol('style','text','position',[175 75 50 50],'string',
  'C');
  edit1=uicontrol('style','edit','position',[75 25 50 50]
  ,'string','0');
  edit2=uicontrol('style','edit','position',[125 25 50 50]
  ,'string','0');
  edit3=uicontrol('style','edit','position',[175 25 50 50]
  ,'string','0');
  
  text5=uicontrol('style','text','position',[425 75 50 50],'string',
  'D');
  text6=uicontrol('style','text','position',[475 75 50 50],'string',
  'E');
  text7=uicontrol('style','text','position',[525 75 50 50],'string',
  'F');
  edit4=uicontrol('style','edit','position',[425 25 50 50]
  ,'string','0');
  edit5=uicontrol('style','edit','position',[475 25 50 50]
  ,'string','0');
  edit6=uicontrol('style','edit','position',[525 25 50 50]
  ,'string','0');
                                    
  
  push1=uicontrol('style','pushbutton','position',[75 450 100 40],
 'string', 'browse','fontsize',14 ,'callback', {@bukafile ax1});
  push2=uicontrol('style','pushbutton','position',[300 75 100 40],
  'string', 'convert','fontsize',14 ,'callback', {@convert edit1,edit2,edit3,ax2});
  push3=uicontrol('style','pushbutton','position',[1000 75 175 40],
  'string', 'recover colour','fontsize',14 ,'callback', {@recover_colour edit4,edit5,edit6,edit1,edit2,edit3,ax3});
  push4=uicontrol('style','pushbutton','position',[1000 25 175 40],
  'string', 'recolour','fontsize',14 ,'callback', {@recolour edit4,edit5,edit6,ax3});
  
endfunction

function bukafile(hObject,eventdata,ax1)
  [namafile pathfile] = uigetfile('*.jpg','browse jpg file')
  img1=imread([pathfile namafile]);
  axes(ax1);
  imshow(img1);
  save img1.mat img1
endfunction

function convert(hObject,eventdata,edit1,edit2,edit3,ax2)
  load img1.mat
  a=str2num(get(edit1,'string'));
  b=str2num(get(edit2,'string'));
  c=str2num(get(edit3,'string'));
  R=img1(:,:,1);
  G=img1(:,:,2);
  B=img1(:,:,3);
  grey=a*R+b*G+c*B;
  axes(ax2);
  imshow(grey);
  save grey.mat grey
endfunction

function recover_colour(hObject,eventdata,edit4,edit5,edit6,edit1,edit2,edit3,ax3)
  load grey.mat
  a=str2num(get(edit4,'string'));
  b=str2num(get(edit5,'string'));
  c=str2num(get(edit6,'string'));
  r_rat=str2num(get(edit1,'string'));
  g_rat=str2num(get(edit2,'string'));
  b_rat=str2num(get(edit3,'string'));
  greyval=grey;
  r_rat
  g_rat
  b_rat

  
  if r_rat!=0, g_rat!=0, b_rat!=0
    red=(greyval/r_rat)*(0.3*a);
    green=(greyval/g_rat)*(0.59*b);
    blue=(greyval/b_rat)*(0.11*c);
  elseif a==0 | b==0 | c==0
    red=(greyval*r_rat)/(0.3*a);
    green=(greyval*g_rat)/(0.59*b);
    blue=(greyval*b_rat)/(0.11*c);
  endif

  rec(:,:,1)=red;
  rec(:,:,2)=green;
  rec(:,:,3)=blue;
  axes(ax3);
  imshow(rec);
  
  save rec.mat rec
endfunction

function recolour(hObject,eventdata,edit4,edit5,edit6,ax3)
  load grey.mat
  a=str2num(get(edit4,'string'));
  b=str2num(get(edit5,'string'));
  c=str2num(get(edit6,'string'));
  greyval=grey;
  red=greyval*a;
  green=greyval*b;
  blue=greyval*c;
  rec(:,:,1)=red;
  rec(:,:,2)=green;
  rec(:,:,3)=blue;
  axes(ax3);
  imshow(rec);
endfunction


