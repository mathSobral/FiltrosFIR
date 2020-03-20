close all;
[u,fs] = audioread('sinal_ruido.wav');
S = fft(u);
L = length(S); % normalizando S
P2 = abs(S/L);
P = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = fs*(0:(L/2))/L;
plot(f,P) % plotando a FFT de 0Hz até fs/2 da amostra de áudio


%% Filtro passa baixas FIR
fa = 44100; % frequencia de amost
sinal = u(:,1); %% sinal gravado
fp = 600; % frequência de passagem
fs = 1000; % frequência de corte
% normalização das frequências
wp = (fp/(fa/2))*pi
ws = (fs/(fa/2))*pi
bt = ws - wp; %banda de transição
M = ceil((6.6*pi/bt)) + 1; % M de acordo com a tabela das janelas
wc = (ws + wp)/2; %frequência de corte intermediária


% Filtragem do sinal utilizando diferentes tipos de janelas
filtrar(sinal,janela_retangular(M), wc, M, fa, 'Retangular');
filtrar(sinal,janela_bartlett(M), wc, M, fa, 'Bartlett (Triangular)');
filtrar(sinal,janela_hann(M), wc, M, fa, 'Hann');
filtrar(sinal,janela_hamming(M), wc, M, fa, 'Hamming');
filtrar(sinal,janela_blackman(M), wc, M, fa, 'Blackman');
