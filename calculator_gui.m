function mygui()
g = figure(1);                             #ini coordinate
text1=uicontrol('style','text','position',[80 310 400 100],
 'string', 'Contoh GUI Calculator','fontsize',22);
 
edit1=uicontrol('style','edit','position',[170 150 200 30],
 'string', '---','fontsize',14);
edit2=uicontrol('style','edit','position',[100 250 130 40]
 ,'string','0');
edit3=uicontrol('style','edit','position',[310 250 130 40]
 ,'string','0');
 
push1=uicontrol('style','pushbutton','position',[175 200 40 40],
 'string', '*','fontsize',14 ,'callback', {@kali edit1, edit2, edit3});
push2=uicontrol('style','pushbutton','position',[225 200 40 40],
 'string', '/','fontsize',14 ,'callback', {@bagi edit1, edit2, edit3});
push3=uicontrol('style','pushbutton','position',[275 200 40 40],
 'string', '+','fontsize',14 ,'callback', {@tambah edit1, edit2, edit3});
push4=uicontrol('style','pushbutton','position',[325 200 40 40],
 'string', '-','fontsize',14 ,'callback', {@kurang edit1, edit2, edit3});
clear1=uicontrol('style','pushbutton','position',[290 50 80 40],
 'string', 'Clear','fontsize',14,'callback',{@clearstr edit1, edit2, edit3});
 
 
menu1=uimenu('label','menu','accelerator','m'); #jadi menu bar
endfunction


function clearstr(hObject, eventdata, edit1, edit2, edit3)
  set(edit1,'string','')
  set(edit3,'string','0')
  set(edit2,'string','0')
endfunction

function swappy(hObject, eventdata, edit2, edit3)
  stringedit2=get(edit2,'string');
  stringedit3=get(edit3,'string');
  %set(edit2,'string','')
  set(edit3,'string',stringedit2);
  set(edit2,'string',stringedit3);
 
endfunction

function kali(hObject, eventdata, edit1, edit2, edit3)
  a=str2double(get(edit2,'string'));
  b=str2double(get(edit3,'string'));
  set(edit1,'string',num2str(a*b));
endfunction  

function bagi(hObject, eventdata, edit1, edit2, edit3)
  a=str2double(get(edit2,'string'));
  b=str2double(get(edit3,'string'));
  set(edit1,'string',num2str(a/b));
endfunction
  
function tambah(hObject, eventdata, edit1, edit2, edit3)
  a=str2double(get(edit2,'string'));
  b=str2double(get(edit3,'string'));
  set(edit1,'string',num2str(a+b));
endfunction
  
function kurang(hObject, eventdata, edit1, edit2, edit3)  
  a=str2double(get(edit2,'string'));
  b=str2double(get(edit3,'string'));
  set(edit1,'string',num2str(a-b));
endfunction
mygui()