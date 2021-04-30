x=[-2:0.1:2]
y=x.^2+2*x+3
z=0.33*x.^3+x.^2
plot(x,y)
hold on
plot(x,z)
hold on
line([-2 2], [3 3], 'Color','red','LineStyle','--','LineWidth',4)
h = legend('y','z');
set(h,'FontSize',30);
grid on