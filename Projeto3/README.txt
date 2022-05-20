Projeto 3 
Objetivo :  Projetar um sistema digital baseado em BO+BC

● Necessita-se de uma máquina (sistema digital - S.D.) de vendas capaz de gerenciar a venda de (apenas) um
tipo de mercadoria, doravante denominada “item”. Esta máquina possui um detector de moedas que provê
um sinal de 1 bit chamado “c”, o qual vale “1” durante um ciclo de relógio quando uma moeda é detectada.
(O controle da máquina de vendas e o seu detector de moedas são sincronizados pelo mesmo sinal de
relógio.)
O detector também possui um registrador de 8 bits no qual ele armazena o valor da moeda inserida, em
centavos. Este registrador é carregado somente quando o sinal “c” sobe. A saída deste registrador é entrada
para a máquina de vendas, sendo chamada “a”.
A máquina possui ainda uma entrada de 8 bits denominada “s”, pela qual o proprietário pode definir o preço
(unitário) da mercadoria. (Assuma que o valor correspondente ao preço permanece estável em “s” durante a
operação normal.)
Uma vez que o sistema digital identifica moedas cujo valor seja igual ou maior que o preço do item, ele
“seta” o valor do sinal de saída “d” (que tem um bit) durante um ciclo de relógio, causando a liberação de um
item. O Sistema não fornece troco.