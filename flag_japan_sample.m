% create a 2-D matrix and paint it white 
I = uint8(zeros(300, 500, 3))+255;  
  
%the center point 1 through which the circle will pass 
circle_center1=150;  
  
%the center point 2 through which the circle will pass 
circle_center2=250;   
  
radius=6.32;    % radius of the circle 
x=i;            % x-axis co-ordinate 
y=j;            % y-axis co-ordinate 
  
%loop for rows i.e. for x-axis 
 for i = 101:200 
   
     %loop for columns i.e. for y-axis 
      for j = 101:300 
        
         %applying the equation of circle to make the circle in the center. 
          if round(sqrt((i-circle_center1)^2 + (j-circle_center2)^2)) < radius^2 
            
            % fill the circle with crimson glory 
            % color using RGB color representation. 
            I(i, j, 1) = 188; 
            I(i, j, 2) = 0; 
            I(i, j, 3) = 45; 
              
          end        
           
      end  % end column loop. 
 end       % end row loop. 
   
% show the image formed.  
figure, imshow(I); 