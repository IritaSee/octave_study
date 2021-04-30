#japan flag:

#make (100,100,3) matrix
j=uint8(zeros(100,100,3));


#equation used: sqrt((x-h)^2 - (y-k)^2)=r^2 (standard circle)
#logic: do for loop, if the iteration of the loop is within the circle, 
#draw crimson glory red (188, 0, 45) else make background white(255,255,255)

h=50;
k=50;
r=sqrt(0.6*50);

for x = 1:100
  for y = 1:100
    if round(sqrt((x-h).^2 + (y-k).^2)) < r.^2
      j(x,y,1)=188;
      j(x,y,2)=0;
      j(x,y,3)=45;
     else
      j(x,y,1)=255;
      j(x,y,2)=255;
      j(x,y,3)=255;
     end
   end
end


#show flag
figure,imshow(j);

clearvars



function star(r, mx, my, wh);

% Function to make star patches

  th  = linspace(0.3*pi, 2.3*pi, 6);
  x1  = (r/2)*cos(th);
  y1  = (r/2)*sin(th);
  x2  = (r/2)/3*cos(th+0.2*pi); % One-third dimension is approximate
  y2  = (r/2)/3*sin(th+0.2*pi);
  x3 = [x1; x2];
  y3 = [y1; y2];
   P   = patch(x3(:)+mx, y3(:)+my, wh, 'EdgeColor', wh);
end
   
   
function usflag;

% Draws the United States flag, based on proportions from http://www.usflag.org.
% Red and blue colors are approximate, along with star inner radius.
% Requires star()

%%usflag

s      = get(0, 'ScreenSize');
sz_fac = s(3)/7;
p      = sz_fac.*[1 1.9 7/13 0.76 0.054 0.054 0.063 0.063 0.0616 1/13];
red    = [0.8 0 0];
blue   = [0 0 0.5];
wh     = [1 1 1];

set(figure, 'Menubar', 'None', 'Position', [0 0 p(2) p(1)], 'Numbertitle', 'Off', 'Name', 'United States flag');
set(axes, 'YDir', 'reverse', 'Position', [0 0 1 1], 'XLim', [0 p(2)], 'YLim', [0 p(1)], 'Visible', 'Off');

patch([0 p(2) p(2) 0 0], [0 0 p(1) p(1) 0], wh); % White background for flag

for stripe = 1:7, % Red stripes
  patch([0 p(2) p(2) 0 0], (2*p(10)*(stripe-1))+[0 0 p(10) p(10) 0], red, 'EdgeColor', red);
end;

patch([0 p(4) p(4) 0 0], [0 0 p(3) p(3) 0], blue, 'EdgeColor', blue); % Dark blue for Union

for big = 1:4, % Fill in the stars
  for star_ind = 1:6,
    star(p(9), p(7)+(star_ind-1)*2*p(8), p(5)+p(6)*2*(big-1), wh);
    if star_ind < 6,
      star(p(9), 2*p(7)+(star_ind-1)*2*p(8), p(5)+p(6)+p(6)*2*(big-1), wh);
    end;
    if big == 4,
      star(p(9), p(7)+(star_ind-1)*2*p(8), p(5)+p(6)*2*big, wh);
    end;
  end;
end;

return;

end


usflag;

