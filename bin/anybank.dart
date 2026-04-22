import 'package:anybank/models/conta_corrente.dart';
import 'package:anybank/models/conta_poupanca.dart';
import 'package:anybank/models/conta_salario.dart';
import 'package:anybank/models/conta_empresa.dart';
import 'package:anybank/models/conta_investimento.dart';
import 'package:anybank/services/banco.dart';
import 'package:anybank/services/menu_service.dart';
import 'package:anybank/utils/exibicao.dart';
import 'dart:io';

void main(){
  Banco banco = criarBancoInicial();
  iniciarSistema(banco);
}

void iniciarSistema(Banco banco){
  bool executando = true;
  String opcao = "";

  while(executando){
    print("");
    mostrarMenu();
    print("Escolha uma opção:");
    opcao = stdin.readLineSync() ?? "";
    
    switch(opcao){
      case "1":
        mostrarSecao("LISTAGEM DE CONTAS");
        banco.listarContas();
      break;
      case "2":
        mostrarSecao("BUSCA DE CONTA POR TITULAR");
        buscarConta(banco);
      break;
      case "3":
        mostrarSecao("TRANSFERENCIA DE CONTAS");
        transferirEntreContas(banco);
      break;
      case "4":
        mostrarSecao("CRIAÇÃO DE NOVA CONTA");
        criarConta(banco);
      break;
      case "5":
        mostrarSecao("DEPÓSITO EM CONTA");
        depositarEmConta(banco);
      break;
      case "6":
        mostrarSecao("SAQUE EM CONTA");
        sacarDeConta(banco);
      break;
      case "7":
        mostrarSecao("EXTRATO DA CONTA");
        verExtrato(banco);
      break;
      case "8":
        mostrarSecao("REMOÇÃO DE CONTA");
        removerConta(banco);
      break;
      case "9":
        print("Encerrando o sistema...");
        executando = false;
      break;
      default:
        print("Opção inválida. Tente novamente.");
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