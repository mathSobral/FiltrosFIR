close all;
[u,fs] = audioread('sinal_ruido.wav', [100000,101999] );
S = fft_dec_freq(u, length(u));
L = length(S); % normalizando S
P2 = abs(S/L);
P = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);
f = fs*(0:(L/2))/L;
plot(f,P) % plotando a FFT de 0Hz at� fs/2 da amostra de �udio
title('Sinal de entrada x[n]')
ylabel('Amplitude |X(e^j^w)|');
xlabel('Frequ�ncia (Hz)');
xlim([0 3000]);


%% Filtro passa baixas FIR
fa = 44100; % frequencia de amost
sinal = u(:,1); % sinal gravado em mono
fp = 600; % frequ�ncia de passagem
fs = 1000; % frequ�ncia de corte
% normaliza��o das frequ�ncias
wp = (fp/(fa/2))*pi
ws = (fs/(fa/2))*pi
bt = ws - wp; %banda de transi��o
M = ceil((6.6*pi/bt)) + 1; % M de acordo com a tabela das janelas
wc = (ws + wp)/2; %frequ�ncia de corte intermedi�ria


% Filtragem do sinal utilizando diferentes tipos de janelas
filtrar(sinal,janela_retangular(M), wc, M, fa, 'Retangular');
filtrar(sinal,janela_bartlett(M), wc, M, fa, 'Bartlett (Triangular)');
filtrar(sinal,janela_hann(M), wc, M, fa, 'Hann');
filtrar(sinal,janela_hamming(M), wc, M, fa, 'Hamming');
filtrar(sinal,janela_blackman(M), wc, M, fa, 'Blackman');
