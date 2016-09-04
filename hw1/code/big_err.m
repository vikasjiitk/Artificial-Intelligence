err_tr=importdata('err_tr_big.txt');
err_tt=importdata('err_tt_big.txt');
err_v=importdata('err_v_big.txt');   
deg=importdata('deg.txt');

p=plot(deg,err_tr);
hold on
q=plot(deg,err_tr,'o');
xlabel('Degree of Polynomial (M)');
ylabel('Error(RMS)');
title('Error plot for big Training Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);

p=plot(deg,err_tt);
hold on
q=plot(deg,err_tt,'o');
xlabel('Degree of Polynomial (M)');
ylabel('E_{rms}');
title('Error plot for Test Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);

p=plot(deg,err_v);
hold on
q=plot(deg,err_v,'o');
xlabel('Degree of Polynomial (M)');
ylabel('E_{rms}');
title('Error plot for Validation Set');
set(p,'Color','red','LineWidth',2);
set(q,'Color','red','LineWidth',2);
