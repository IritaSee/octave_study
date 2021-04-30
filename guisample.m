function mygui()
g = figure(1);                             #ini coordinate
text1=uicontrol('style','text','position',[80 310 400 100],
 'string', 'Contoh GUI di Octave','fontsize',22);
 
edit1=uicontrol('style','edit','position',[170 250 200 30],
 'string', '---','fontsize',14);
edit2=uicontrol('style','edit','position',[100 140 130 40]
 ,'string','');
edit3=uicontrol('style','edit','position',[310 140 130 40]
 ,'string','');
 
push1=uicontrol('style','pushbutton','position',[170 200 80 40],
 'string', 'Show','fontsize',14 ,'callback', {@showstr edit1});
push2=uicontrol('style','pushbutton','position',[230 80 80 40],
 'string', 'Swap','fontsize',14 ,'callback', {@swappy edit2 edit3});
clear1=uicontrol('style','pushbutton','position',[290 200 80 40],
 'string', 'Clear','fontsize',14,'callback',{@clearstr edit1});
 
 
menu1=uimenu('label','menu','accelerator','m'); #jadi menu bar
endfunction



function showstr(hObject, eventdata, edit1)
  set(edit1,'string','Selamat Datang')
endfunction

function clearstr(hObject, eventdata, edit1)
  set(edit1,'string','---')
endfunction

function swappy(hObject, eventdata, edit2, edit3)
  stringedit2=get(edit2,'string');
  stringedit3=get(edit3,'string');
  %set(edit2,'string','')
  set(edit3,'string',stringedit2);
  set(edit2,'string',stringedit3);
 
endfunction


mygui()