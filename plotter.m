function mygui()
  g = figure('position',[100 100 800 300]);
  axes1=axes('position',[0.07 0.35 0.9 0.6]);
  e1=uicontrol('style','edit','position',[20 30 40 40],
  'string', 'a');
  e2=uicontrol('style','edit','position',[80 30 40 40]
  ,'string','b');
  e3=uicontrol('style','edit','position',[140 30 40 40]
  ,'string','c');
  e4=uicontrol('style','edit','position',[425 30 40 40]
  ,'string','m');
  e5=uicontrol('style','edit','position',[505 30 40 40]
  ,'string','d');
  e6=uicontrol('style','edit','position',[680 30 40 40]
  ,'string','up');
  e7=uicontrol('style','edit','position',[640 30 40 40]
  ,'string','inc');
  e8=uicontrol('style','edit','position',[600 30 40 40]
  ,'string','dn');
  clr=uicontrol('style','pushbutton','position',[200 30 80 40],
 'string', 'clear','fontsize',14 ,'callback', {@cls e1, e2, e3, e4, e5, e6, e7, e8});
  create=uicontrol('style','pushbutton','position',[300 30 80 40],
 'string', 'plot','fontsize',14 ,'callback', {@graph e1, e2, e3, e4, e5, e6, e7, e8});
  %hslider = uicontrol (                    ...
  %       'style', 'slider',                ...
  %       'Units', 'normalized',            ...
  %       'position', [0.1, 0.1, 0.8, 0.1], ...
  %       'min', 1,                         ...
  %       'max', 50,                        ...
  %       'value', 10,                      ...
  %       'callback',          ...
  %     );
 
  endfunction


function graph(hObject, eventdata, e1, e2, e3, e4, e5, e6, e7, e8)
  a=str2double(get(e1,'string'));
  b=str2double(get(e2,'string'));
  c=str2double(get(e3,'string'));
  m=str2double(get(e4,'string'));
  d=str2double(get(e5,'string'));
  up=str2double(get(e6,'string'));
  inc=str2double(get(e7,'string'));
  down=str2double(get(e8,'string'));
  x=[down:inc:up];
  y=a*x.^2+b*x+c;
  %get(axes1);
  %axes(axes1);
  plot(x,y);
  hold on;
  y=m*x+d;
  plot(x,y)
  h = legend('y=ax^2+bx+c','y=mx+d');
  set(h,'FontSize',10);
  grid on;
endfunction
function cls(hObject, eventdata, e1, e2, e3, e4, e5, e6, e7, e8)
 cla
endfunction
