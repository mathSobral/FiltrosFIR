function hd = ri_pb_ideal(wc,M)

alpha=(M-1)/2; % filtro passa baixas ideal
n=[0:M-1];
m=n-alpha+eps;
hd=sin(wc*m)./(pi*m); % resposta impulsiva do fpb ideal