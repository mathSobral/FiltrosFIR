function [janela] = janela_blackman(M)
%JANELA_HAMMING Summary of this function goes here
%   Detailed explanation goes here
n = [0:M-1];
w = 0.42 - 0.5 * cos((2*pi*n)/(M-1)) + 0.08 * cos((4*pi*n)/(M-1)) ;
janela = w';
end

