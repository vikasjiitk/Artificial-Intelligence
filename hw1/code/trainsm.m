time_sm=importdata('time_sm.txt');
height_sm=importdata('height_sm.txt');

p0=polyfit(time_sm,height_sm,0);
p1=polyfit(time_sm,height_sm,1);
p2=polyfit(time_sm,height_sm,2);
p3=polyfit(time_sm,height_sm,3);
p5=polyfit(time_sm,height_sm,5);
p9=polyfit(time_sm,height_sm,9);
x=linspace(2.3,7.3);
f0=polyval(p0,x);
f1=polyval(p1,x);
f2=polyval(p2,x);
f3=polyval(p3,x);
f5=polyval(p5,x);
f9=polyval(p9,x);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f0);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=0)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f1);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=1)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f2);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=2)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f3);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=3)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f5);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=5)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

p=plot(time_sm,height_sm,'*');
hold on
q=plot(x,f9);
xlabel('Time(t)');
ylabel('Height(h)');
title('Plot for Training Set (M=9)');
set(p,'Color','red','LineWidth',2);
set(q,'Color','green','LineWidth',2);

