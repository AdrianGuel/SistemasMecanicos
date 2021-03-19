clear all
close all

k=1;
b=0.5;
m=1;

syms x1(t) x2(t) %declarar variables de tipo simbólico

eqs = [diff(x1) == x2;
       diff(x2) == (-k/m)*x1+(-b/m)*x2];
%eqs  = subs(eqs,[k,],[]);
vars = [x1, x2];

[M,F] = massMatrixForm(eqs,vars);
f = M\F;
f = odeFunction(f, vars);
x0 = [1; 0.1];
tInit  = 0;
tFinal = 10;

%opts = odeset('RelTol',1e-8);%,'AbsTol',1e-4);
sols = ode45(f,[tInit tFinal],x0);%,opts);
x_pos = @(t) deval(sols,t,1);
%y_pos = @(t) -cos(deval(sols,t,1));
figure
fanimator(@(t) plot(x_pos(t),0,'ko','MarkerFaceColor','k'),'AnimationRange',[0 10]);
hold on;
fanimator(@(t) plot([-1.5 x_pos(t)],[0 0],'k-'),'AnimationRange',[0 10]);
fanimator(@(t) text(-0.3,0.5,"Timer: "+num2str(t,2)+" s"),'AnimationRange',[0 10]);
playAnimation
