Projeto 2

Objetivo: Exercitar a implementação recursos simples em VHDL, implementação de testbench e simulação.

Funcionalidade:
■ Implementar em VHDL uma entidade que realiza operações de soma, subtração, and e or de dois operandos, e
rotação de um bit para a esquerda do primero operando
■ Entradas: A e B (operandos), sel (seletor de operação), reset (sinal de reset assíncrono)
■ Saída: dado processado
● Passos:
Implementar em um VHDL entidades combinacionais (sem memória)
■ Somador, Subtrator, and, or, shift de duas entradas de largura de bits configurável
■ Implementar usando arquivos separados para cada operação, seguidos de um multiplexador; ou usar uma
estrutura CASE.
Implementar em VHDL a seguinte entidade sequencial (com memória)
■ Registrador com reset assíncrono e número de bits configurável
Implementar em VHDL a seguinte entidade estrutural
■ Entidade chamada top_level.vhd que instancia todos os códigos implementados. Criar os sinais necessários
■ Configurar este código de modo que as operações de soma ou de subtração sejam direcionados para a saída de
acordo com o sinal sel.
Implementar em VHDL o testbench para o código estrutural
■ O testbench deve possuir um array de constantes com os dados a serem usados na simulação
■ Os dados do array devem ser lidos a cada subida do clock.
■ Ao chegar ao último elemento do array, a simulação deve voltar ao início do array, ou seja, não deve parar de
enviar dados na simulação
■ Os dados de saída devem ser salvos em um arquivo
○Simulação com o Questasim
■ Incluir as formas de onda no relatório e comentar. Explicar o motivo de se obter tal saída, por exemplo, o motivo
de a saída estar atrasada em relação à entrada em alguns casos e em outros não (dica: devido a presença do
registrador)
Mostrar a estrutura do slide a seguir usando a ferramenta RTL viewer do Quartus