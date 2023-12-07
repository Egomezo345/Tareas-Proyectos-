n=-1000:1000;
x=exp(j*2*pi*0.01*n);  % definimos la exprecion
hold
subplot (2,1,1); % esto nos permite tener las dos graficas en la misma imagen
plot(n, real(x)) ; % graficamos la funcion x
subplot (2,1,2);  % esto nos permite tener las dos graficas en la misma imagen
y=exp(j*2*pi*2.01*n); %definimos la funcion
plot(n,real(y),'r'); %graficamos la funcion y
