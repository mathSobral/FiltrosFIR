function [janela] = janela_bartlett(M)
%JANELA_HAMMING Summary of this function goes here
%   Detailed explanation goes here
metade = ceil((M)/2) ;
n1 = [0:metade-1];
n2 = [metade+1:M];
w1 =  (2*n1)/(M);
w2 =  2 - (2*n2)/(M);
w = cat(2, w1, w2);
janela = w';
end

