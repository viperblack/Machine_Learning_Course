 a2 = zeros (3, 1);
 Theta1 = randi(10, 3, 3);
 x = zeros (3,1);
 #{
 for i = 1:3
   for j = 1:3
     a2(i) = a2(i) + x(j) * Theta1 (i, j);
   endfor
   a2(i) = sigmoid(a2(i));
 endfor 
 
 z = Theta1 * x;
a2 = sigmoid(z);
 #}
 
z = sigmoid(x);
a2 = sigmoid(Theta1*z);