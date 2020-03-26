% Método de convolução entre dois sinais utilizando a propriedade de
% convolução no tempo
function convolcao_no_tempo = convolucao(sinal_a,sinal_b)    
    size = 0; 
    
    if(length(sinal_a) > length(sinal_b)) % Verifica qual o sinal maior para completar com zeros 
        size = length(sinal_a);
    else
        size = length(sinal_b);
    end
    
    transformada_a = fft_dec_freq(sinal_a, size); % Força o complemento com zeros pras duas transformadas terem a mesma dim
    transformada_b = fft_dec_freq(sinal_b, size); % Força o complemento com zeros pras duas transformadas terem a mesma dim
    % Após os dois sinais serem transofados, a propriedade da convolução no
    % tempo discreto é aplicada
    convolucao_na_frequencia = transformada_a.* transformada_b; % A convolução no tempo é uma mutiplicação na frequência
    convolcao_no_tempo = inv_fft_dec_freq(convolucao_na_frequencia, length(convolucao_na_frequencia)); % Retorna a inversa do sinal convoluido
end

