programa
{
    real saldo = 150.00
    cadeia extrato = "Depósito inicial: R$ 150.00\n"
    inteiro senhaCorreta = 3589

    funcao inicio() {
        inteiro opcao 

        escreva("Escolha uma opção:\n")
        escreva("1. Ver saldo\n")
        escreva("2. Ver extrato\n")
        escreva("3. Fazer depósito\n")
        escreva("4. Fazer saque\n")
        escreva("5. Fazer transferência\n")
        escreva("6. Sair\n")
        leia(opcao)

        escreva("A opção selecionada foi: ", opcao, "\n")

        se (opcao == 1) {
            solicitarSenha()
            verSaldo()
        } senao se (opcao == 2) {
            solicitarSenha()
            verExtrato()
        } senao se (opcao == 3) {
            fazerDeposito()
        } senao se (opcao == 4) {
            solicitarSenha()
            fazerSaque()
        } senao se (opcao == 5) {
            solicitarSenha()
            fazerTransferencia()
        } senao se (opcao == 6) {
            sair()
        } senao {
            erro()
        }
    }

    funcao solicitarSenha() {
        inteiro senha
        escreva("Digite a senha: ")
        leia(senha)

        se (senha <> senhaCorreta) {
            escreva("Senha incorreta! Tente novamente por favor! \n")
            solicitarSenha()
        }
    }

    funcao verSaldo(){
        escreva("Seu saldo atual é: R$ ", saldo, "\n")
        inicio()
    }

    funcao verExtrato() {
        escreva("Extrato:\n", extrato, "\n")
        inicio()
    }

    funcao fazerDeposito() {
        real deposito
        
        escreva("Qual o valor para depósito? ")
        leia(deposito)

        se (deposito <= 0) {
            escreva("Operação não autorizada.\n")
            fazerDeposito()
        } senao {
            saldo = saldo + deposito
            extrato = extrato + "Depósito: R$ " + deposito + "\n"
            verSaldo()
        }
    }

    funcao fazerSaque() {
        real saque

        escreva("Qual o valor para saque? ")
        leia(saque)

        se (saque <= 0) {
            escreva("Operação não autorizada.\n")
            fazerSaque()
        } senao se (saque > saldo) {
            escreva("Operação não autorizada. \n")
            inicio()
        } senao {
            saldo = saldo - saque
            extrato = extrato + "Saque: R$ " + saque + "\n"
            verSaldo()
        }
    }

    funcao fazerTransferencia() {
        real valorTransferencia
        cadeia numeroConta

        escreva("Informe o número da conta (somente números): ")
        leia(numeroConta)

        se (numeroConta = "" ou nao ehNumero(numeroConta)) {
            escreva("Operação não autorizada: número de conta inválido.\n")
            fazerTransferencia()
        } senao {
            escreva("Informe o valor da transferência: ")
            leia(valorTransferencia)

            se (valorTransferencia <= 0) {
                escreva("Operação não autorizado.\n")
                fazerTransferencia()
            } senao se (valorTransferencia > saldo) {
                escreva("Operação não autorizada.\n")
                inicio()
            } senao {
                saldo = saldo - valorTransferencia
                extrato = extrato + "Transferência: R$ " + valorTransferencia + " para conta " + numeroConta + "\n"
                escreva("Transferência de R$ ", valorTransferencia, " para a conta ", numeroConta, " realizada com sucesso!\n")
                verSaldo()
            }
        }
    }

    funcao erro() {
        escreva("Opção Inválida.\n")
        inicio()
    }

    funcao sair() {
        escreva("Obrigado por utilizar nossos serviços!\n")
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3520; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */