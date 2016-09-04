err_tr=importdata('err_tr_sm.txt');
err_tt=importdata('err_tt_sm.txt'); %log value
err_v=importdata('err_v_sm.txt');   %ln value
deg=importdata('deg.txt');

p=plot(deg,err_tr);
hold on
q=plot(deg,err_tr,'o');
xlabel('Degree of Polynomial (M)');
ylabel('Error(RMS)');
title('Error plot for Small Training Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);

p=plot(deg,err_tt);
hold on
q=plot(deg,err_tt,'o');
xlabel('Degree of Polynomial (M)');
ylabel('log_{10}(E_{rms})');
title('Error plot for Test Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);

p=plot(deg,err_v);
hold on
q=plot(deg,err_v,'o');
xlabel('Degree of Polynomial (M)');
ylabel('log_{e}(E_{rms})');
title('Error plot for Validation Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);
