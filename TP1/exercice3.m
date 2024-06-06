%Exercice n°3 :

%3.1. 
t = (0:0.001:1);
y = sin(2*pi*50*t) + 2*sin(2*pi*120*t);
figure(1)
plot(sin(2*pi*50*t))
saveas(cfg,figure1)

figure(2)
plot(y)
saveas(cfg,figure2)

%3.2. Comparer les deux courbes
yn = y + 0.5*randn(size(t));
figure(3)
plot(t(1:50),yn(1:50))
saveas(cfg,figure3)

figure(4)
plot(yn)
saveas(cfg,figure4)


