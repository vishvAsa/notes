x = [-pi: 0.01: pi];
s1 = sin(x) + cos(2*x);
fx = [0:0.01:10];
s1_freq = zeros(size(fx));
s1_freq(100) = 1;
s1_freq(700) = 1;
s2 = zeros(size(x));
s2(12) = 2;
s2(24) = 2;
h = figure();
subplot(2,2,1);
plot(x, s1, '-b');
ylabel('s1');
xlabel('time');

hold on;
subplot(2,2,2);
plot(fx, s1_freq, '-k');
ylabel('s1');
xlabel('frequency');

subplot(2,2,3);
ylabel('s2');
plot(x, s2, '-r');
ylabel('s2');
xlabel('time');

subplot(2,2,4);
plot(x, s1+s2, '-k');
ylabel('s1 + s2');
xlabel('time');
