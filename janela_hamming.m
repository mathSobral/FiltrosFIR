function [janela] = janela_hamming(M)
%JANELA_HAMMING Summary of this function goes here
%   Detailed explanation goes here
n = [0:M-1];
w = 0.54 - 0.46*cos((2*pi*n)/(M-1));
janela = w';
end

