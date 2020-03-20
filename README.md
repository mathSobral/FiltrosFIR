# Filtros FIR

## Detalhamento do funcionamento
O arquivo filtro.m é o arquivo de script onde está a leitura do audio, a descrição das especificações do filtro e a chamada das funções de cada um dos filtros. <br>
Na linha 15 deste arquivo é definido a frequência de passagem e na 16 a frequência de corte. <br>
Foram criados arquivos separados contendo a implementação de cada janela, estes iniciam com o prefixo 'janela_'. <br>

## Para reproduizir a saida

A linha 10 do arquivo filtrar.m foi comentada pois este é invocado 6 vezes pelo script principal. Ao descomentar esta linha, o audio filtrado é reproduzido