%exercice 4: 

t=[0:0.01:12]
x1=sin(2*pi*t)
x2=cos(2*pi*t)
%4.1. tracer de x1 en fonction du temp
figure(1)
plot(x1) %trace les valeurs de x en fonction de leurs indices
figure(2)
plot(t,x1) %trace les valeurs de x en fonction de t

%4.2. titre et etiquette au axes du graphique
title('sin(2pit)')
xlabel("t")
ylabel('x1')

%4.3. commande hold on
plot(x1,t)
hold on
plot(x2,t) 

%4.4. commande supblot
subplot(2,1,1); plot(t,x1);
subplot(2,1,2); plot(t,x2);

%4.5. 
plot(t,x,"r--o")
plot(x,y1,'r:+')

%4.6
x= 0:pi/100:2*pi;
y1=sin(x);
y2=sin(x-.25);
plot(x,y1,x,y2)
legent('sin(x)','sin(x-.25)')

%4.7.
x=1:10;
y=sin(x);
stem(x,y);
plot(x,y)
bar(x,y)

%4.8
x=-pi:pi/20:pi;
plot(x,exp(-x.^2));
hold on
bar(x,exp(-x.^2),'g');
hold off
stem(x,exp(-x.^2),'r');
