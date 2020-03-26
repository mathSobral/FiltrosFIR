% M�todo de convolu��o entre dois sinais utilizando a propriedade de
% convolu��o no tempo
function convolcao_no_tempo = convolucao(sinal_a,sinal_b)    
    size = 0; 
    
    if(length(sinal_a) > length(sinal_b)) % Verifica qual o sinal maior para completar com zeros 
        size = length(sinal_a);
    else
        size = length(sinal_b);
    end
    
    transformada_a = fft_dec_freq(sinal_a, size); % For�a o complemento com zeros pras duas transformadas terem a mesma dim
    transformada_b = fft_dec_freq(sinal_b, size); % For�a o complemento com zeros pras duas transformadas terem a mesma dim
    % Ap�s os dois sinais serem transofados, a propriedade da convolu��o no
    % tempo discreto � aplicada
    convolucao_na_frequencia = transformada_a.* transformada_b; % A convolu��o no tempo � uma mutiplica��o na frequ�ncia
    convolcao_no_tempo = inv_fft_dec_freq(convolucao_na_frequencia, length(convolucao_na_frequencia)); % Retorna a inversa do sinal convoluido
end

