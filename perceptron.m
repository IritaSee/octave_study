x = [0 0 1 1; 0 1 0 1];
t = [0 1 1 1];
net = newp([0 1; 0 1],1);
net.IW{1} = [1 1] 
net.b{1} = 1
net.trainParam.epochs = 2;
net = train(net,x,t);
view(net)
y = net(x);