function [janela] = janela_hann(M)
%JANELA_HAMMING Summary of this function goes here
%   Detailed explanation goes here
n = [0:M-1];
w =  0.5 - 0.5 * cos((2*pi*n)/(M-1));
janela = w';
end

