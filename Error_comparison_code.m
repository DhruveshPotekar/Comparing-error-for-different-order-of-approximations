clear all
close all
clc 

% solving function f(x)= sin(x)/x^3

% Analytical derivative
% f'(x) = (x^3*(cos(x)) - 3*(sin(x))*x^2)/x^6
x = pi/3;
analytical_derivative = (x^3*(cos(x)) - 3*(sin(x))*x^2)/x^6 ; 


% Numerical derivative
dx = pi/20;

% First order Approximation
% forward differencing = (f(x+dx) - f(x))/dx
first_order_approx = ((sin(x+dx)/(x+dx)^3) - (sin(x)/(x)^3))/dx ;

% Second order Approximation
% central differencing = (f(x+dx) - f(x-dx))/2*dx
second_order_approx = ((sin(x+dx)/(x+dx)^3) - (sin(x-dx)/(x-dx)^3))/(2*dx) ; 

% Fourth order Approximation
% central differencing = (f(x-2*dx) - 8(f(x-dx)) + 8(f(x+dx) - f(x+2*dx))/12*dx
fourth_order_approx = ( (sin(x-(2*dx))/(x-(2*dx))^3) - ((8*sin(x-dx))/(x-dx)^3) + ((8*sin(x+dx))/(x+dx)^3) - ((sin(x+(2*dx))/(x+(2*dx))^3)) )/(12*dx);

% Errors
error_first_order = abs(first_order_approx - analytical_derivative);
error_second_order = abs(second_order_approx - analytical_derivative);
error_fourth_order = abs(fourth_order_approx - analytical_derivative);

% Bar graph plotting
x = [1 2 3];
y = [error_first_order error_second_order error_fourth_order];
bar(x,y,0.3,'FaceColor',[0.8500 0.3250 0.0980],'LineWidth',1.5)
text(1:length(y),y,num2str(y'),'vert','bottom','horiz','center','Fontsize',10,'Fontweight','bold');
xticklabels({'1^{st} Order','2^{nd} Order','4^{th} Order'})


xlabel('Order of Approximation ','Fontsize',15,'Fontweight','bold','color','k');
ylabel('Error of given grid size','Fontsize',15,'Fontweight','bold','color','k');
legend({'Error'},'Fontsize',20,'Location','best');


% Result 
A=['Analytical derivative is ',num2str(analytical_derivative)];
disp(A)
B=['First order approximation gives ',num2str(first_order_approx)];
disp(B)
C=['Second order approximation gives ',num2str(second_order_approx)];
disp(C)
D=['Fourth order approximation gives ',num2str(fourth_order_approx)];
disp(D)

E = ['The first order error is ', num2str(error_first_order)];
disp(E)
F = ['The second order error is ', num2str(error_second_order)];
disp(F)
G = ['The fourth order error is ', num2str(error_fourth_order)];
disp(G)
