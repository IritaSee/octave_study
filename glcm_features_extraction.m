function glcm_features_extraction()
  f1=figure('units','pixels','position', [200 200 600 600]);
  ax1=axes('units','normalize','position',[0.3 0.6 0.3 0.3]);
  push1=uicontrol('units','normalize','style','pushbutton','string','buka file','position',[0.1 0.8 0.15 0.1],'callback',{@bukafile ax1});
  push2=uicontrol('units','normalize','style','pushbutton','string','convert','position',[0.7 0.8 0.15 0.1],'callback', {@convert,ax1});
endfunction


function bukafile(hObject,eventdata,ax1)
  [namafile pathfile] = uigetfile('*.jpg','browse jpg file')
  img1=imread([pathfile namafile]);
  axes(ax1);
  imshow(img1);
  save img1.mat img1
endfunction

function convert(hObject,eventdata,ax1)
  load img1.mat;
  grey=rgb2gray(img1);
  axes(ax1);
  imshow(grey);
  save grey.mat grey
  glcm=graycomatrix(grey)
endfunction
  


function Y=glcm(X, dx, dy, grayScale)  
  % (dx, dy):
%   ( 1, 0)   0°
%   ( 0, 1)  45°
%   ( 1, 1)  90°
%   (-1, 1) 135°

[m, n] = size(X);
maxGrayScale = max(X) + 1;
X = floor(X.*grayScale./maxGrayScale);
Y = zeros(grayScale,grayScale);
for i = 1:m-dy
    for j = 1:n-dx;
        r = X(i,j)+1;
        c = X(i+dy, j+dx)+1;
        Y(r,c) = Y(r,c)+1;
    end
end
Y = Y./(m*n);

end