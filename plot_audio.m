file='tone.wav';
[x,fs]=audioread(file);
K=floor(length(x)/2);
x1=x(1:K);
x2=x(K+1:end);
Xfrek1=fft(x1,2*fs);
Xfrek2=fft(x2,2*fs);
xaxis=[0:1:2*fs-1]; %ada sedikit kesalahan perhitungan array xaxis nya, jadi Xfrek1 dan 2 mengandung 16000 sampel sementara hasil looping nya inklusif, jadi xaxis punya 16001 sampel, sehingga sumbu x dan y gak sama jumlahnya pas di plot
figure(1)
stem(xaxis,abs(Xfrek1))
figure(2)
stem(xaxis,abs(Xfrek2))