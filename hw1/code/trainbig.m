time_big=importdata('time_big.txt');
height_big=importdata('height_big.txt');

p0=polyfit(time_big,height_big,0);
p1=polyfit(time_big,height_big,1);
p2=polyfit(time_big,height_big,2);
p3=polyfit(time_big,height_big,3);
p5=polyfit(time_big,height_big,5);
p9=polyfit(time_big,height_big,9);
x=linspace(2.3,10.3);
f0=polyval(p0,x);
f1=polyval(p1,x);
f2=polyval(p2,x);
f3=polyval(p3,x);
f5=polyval(p5,x);
f9=polyval(p9,x);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f0);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=0)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f1);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=1)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f2);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=2)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f3);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=3)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f5);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=5)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_big,height_big,'o');
hold on
q=plot(x,f9);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Big Training Set (M=9)');
set(p,'Color','blue','LineWidth',2);
set(q,'Color','green','LineWidth',2);