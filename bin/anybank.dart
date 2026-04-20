import 'package:anybank/models/conta.dart';
import 'package:anybank/models/conta_corrente.dart';
import 'package:anybank/models/conta_poupanca.dart';
import 'package:anybank/models/conta_salario.dart';
import 'package:anybank/models/conta_empresa.dart';
import 'package:anybank/models/conta_investimento.dart';
import 'package:anybank/services/banco.dart';
import 'package:anybank/utils/exibicao.dart';
import 'dart:io';

void main(){
  Banco banco = criarBancoInicial();
  bool executando = true;
  String? opcao = "";

  while(executando){
    print("");
    mostrarMenu();
    print("Escolha uma opção:");
    opcao = stdin.readLineSync();
    
    switch(opcao){
      case "1":
        mostrarSecao("LISTAGEM DE CONTAS");
        banco.listarContas();
      break;
      case "2":
        mostrarSecao("BUSCA DE CONTA POR TITULAR");
        String titular = lerEntrada("Digite o nome do titular:");
        Conta? contaEncontrada = banco.buscarContaPorTitular(titular);

        if(contaEncontrada != null){
          print("Conta encontrada: ${contaEncontrada.titular} | Saldo: R\$${contaEncontrada.saldo}");
        }else{
          print("Conta não encontrada");
        }
      break;
      case "3":
        mostrarSecao("TRANSFERENCIA DE CONTAS");
        String origem = lerEntrada("Digite o nome do titular da conta de origem:");
        String destino = lerEntrada("Digite o nome do titular da conta de destino:");
        String valorTexto = lerEntrada("Digite o valor da transferência:");

        double? valor = double.tryParse(valorTexto);

        if(valor == null){
          print("Valor inválido!");
          break;
        }

        bool resultado = banco.transferir(origem, destino, valor);

        mostrarResultado(
          resultado, 
          "Transferência realizada com sucesso", 
          "Não foi possível realizar a transferência"
        );
        
        Conta? contaOrigem = banco.buscarContaPorTitular(origem);
        Conta? contaDestino = banco.buscarContaPorTitular(destino);

        if(contaOrigem != null){
          mostrarSaldo(contaOrigem);
        }
        if(contaDestino != null){
          mostrarSaldo(contaDestino);
        }
      break;
      case "4":
        print("Encerrando o sistema...");
        executando = false;
      break;
      default:
        print("Opção inválida. Tente novamente");
    }
  }
}

Banco criarBancoInicial(){
  Banco banco = Banco("AnyBank");

  ContaCorrente contaChris = ContaCorrente("Chris", 4000);
  ContaPoupanca contaDenize = ContaPoupanca("Denize", 4000);
  ContaSalario contaCatarina = ContaSalario("Catarina", 4000, "111111111", "AnyBank");
  ContaEmpresa contaMatheus = ContaEmpresa("Matheus", 2000);
  ContaInvestimento contaRoberta = ContaInvestimento("Roberta", 3030); 

  banco.adicionarConta(contaChris);
  banco.adicionarConta(contaDenize);
  banco.adicionarConta(contaCatarina);
  banco.adicionarConta(contaMatheus);
  banco.adicionarConta(contaRoberta);

  return banco;
}

String lerEntrada(String mensagem){
  stdout.write(mensagem);
  return stdin.readLineSync() ?? "";
}