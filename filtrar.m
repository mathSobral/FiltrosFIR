function filtrar(sinal,janela, wc, M, fa, nome_janela)
% Fun��o resposavel pela filtragem do sinal
%   Detailed explanation goes here

hd = ri_pb_ideal(wc, M)'; % resposta impulsiva do fpb ideal

h = hd.*janela; % multiplica��o entre os vetores
sinal_filtrado = convolucao(h,sinal); %convolu��o entre os sinais
% sound(sinal_filtrado,fa);
S = fft_dec_freq(sinal_filtrado, length(sinal_filtrado));
L = length(S); % normalizando S
P2 = abs(S/L);
P = P2(1:L/2+1);
P(2:end-1) = 2*P(2:end-1);

f = fa*(0:(L/2))/L;
figure();

subplot(2,1,1);
plot(abs(fft(h)));
title(strcat('Resposta em frequ�ncia filtro com janela - ', nome_janela));
xlabel('Frequ�ncia (rad/s)');
xlim([0 50]);
grid on;

subplot(2,1,2)
plot(f,P) % plotando a FFT do sinal filtrado de 0Hz at� fs/2
title('Espectro de frequ�ncia do sinal filtrado')
ylabel('Amplitude |X(e^j^w)|');
xlabel('Frequ�ncia (Hz)');
xlim([0 3000]);
grid on 
end

