x = [1 2 1 2 2; 2 2 2 2.1 1.5];
t = [0 1 0 1 1];
net = newp([0 2; 1 3],1);
net.IW{1} = [1 1] 
net.b{1} = 2
net.trainParam.epochs = 100;
net = train(net,x,t);
view(net)
xtest=[1.8;2.2];
y=net(xtest)