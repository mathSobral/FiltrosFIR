function filtrar(sinal,janela, wc, M, fa, nome_janela)
% Função resposavel pela filtragem do sinal
%   Detailed explanation goes here

hd = ri_pb_ideal(wc, M)'; % resposta impulsiva do fpb ideal

h = hd.*janela; % multiplicação entre os vetores
sinal_filtrado = convolucao(h,sinal); %convolução entre os sinais
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
title(strcat('Resposta em frequência filtro com janela - ', nome_janela));
xlabel('Frequência (rad/s)');
xlim([0 50]);
grid on;

subplot(2,1,2)
plot(f,P) % plotando a FFT do sinal filtrado de 0Hz até fs/2
title('Espectro de frequência do sinal filtrado')
ylabel('Amplitude |X(e^j^w)|');
xlabel('Frequência (Hz)');
xlim([0 3000]);
grid on 
end

