R=2;
%x=-2:0.1:2;
%y=-2:0.1:2;
%x0=0;
%y0=0;
%a=(x-x0).^2 + (y-y0).^2 -r^2
%fplot(sin(x), [-2, 2])
%ezplot(@(x,y) (x-x0).^2 + (y-y0).^2 -r^2)
%plot((x).^2 + (y).^2 -r^2)
%plot(x,y)
th = linspace( 0, -pi*2/2, 100);
x = R*cos(th);
y = R*sin(th);
%fplot(w,z)
plot(x,y);
line(xlim(),[0,0])
%axis equal
axis([-4 4 -4 4])
grid on