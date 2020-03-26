% Implementação da transformada de fourier no tempo discreto utilizando o
% método da dizimação na frequência
%
function y = fft_dec_freq(x, N)
  N = pow2(ceil(log2(N))); % Força que o tamanho da sequência seja uma potência de dois

  if(N > length(x)) % Completa com zeros
    for i = [length(x)+1:N]
      x(i) = 0;
    end
  end
  
  m = log2(N);
    
  % FFT com dizimação na frequência utilizando o algoritmo de Sande-Tukey
  h = N;
    
    for i = 1 : m
        l = h;
        h = h/2;
        
        ang = 0;
        arg = 2*pi/l;
        
        for k = 1 : h
            w = exp(-j*ang);
            
            for n = k : l : N
                d = n + h;
                
                t = x(n) + x(d);
                x(d) = (x(n) - x(d)) * w;
                x(n) = t;
            end
            
            ang = k*arg;
        end
    end
    
    %inversão de bits
    i = 1;
        
    for c = 1 : N-1
        if (c < i)
            t = x(i);
            x(i) = x(c);
            x(c) = t;
        end
        
        k = N/2;
        
        while k < i
            i = i - k;
            k = k / 2;
        end
        
        i = i + k;
    end

    y = x;
end
