function [T] = metodo_euler()

%ed_str = input('Ingresa una ecuación diferencial en terminos de "x" e "y":
%','s');%
ed = @(x,y) x + (1/5) * y;
sln_exacta = @(x) 22*exp(x/5)-5*x-25;

xinit = str2double(input('Ingresa el valor de x_0: ', 's'));
yinit = str2double(input('Ingresa el valor de y_0: ', 's'));

h = str2double(input('Ingresa el valor de "h": ', 's'));

inf = str2num(input('Ingresa el valor del limite inferior del intervalo: ', 's'));
sup = str2num(input('Ingresa el valor del limite superior del intervalo: ', 's'));

n = (sup-inf)/h;

x = [xinit zeros(1, n)];
y = [yinit zeros(1, n)];
real_y = [yinit zeros(1, n)];

for i=1:n
    x(i + 1) = x(i) + h;
    y(i + 1) = y(i) + h * ed(x(i), y(i));
    real_y(i+1) = sln_exacta(x(i + 1));
end

T = table(x', y', real_y', 'VariableNames', {'x', 'Aproximación de y', 'Valor real de y'});
plot(x, y, x, real_y);


end