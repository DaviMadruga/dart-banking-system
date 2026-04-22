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

void criarConta(Banco banco){
  print("Tipos de conta disponíveis:");
  print("1 - Conta corrente");
  print("2 - Conta Poupaça");
  print("3 - Conta Salário");
  print("4 - Conta Empresa");
  print("5 - Conta Investimento");

  String tipoDeConta = lerEntrada("\nEscolha o tipo de conta:");
  if(!["1","2","3","4","5"].contains(tipoDeConta)){
    print("\nTipo de conta inválida");
    return;
  } 

  String titular = lerEntrada("\nDigite o nome do titular:");
  if(titular.trim().isEmpty){
    print("\nNome do titular inválido");
    return;
  }

  String saldoTexto = lerEntrada("\nDigite o saldo inicial:");
  double? saldo = double.tryParse(saldoTexto);
  if(saldo == null || saldo < 0){
    print("\nSaldo inicial inválido");
    return;
  }

  switch(tipoDeConta){
    case "1":
      banco.adicionarConta(ContaCorrente(titular, saldo));
      print("Conta Corrente criada com sucesso");
    break;
    case "2":
      banco.adicionarConta(ContaPoupanca(titular, saldo));
      print("Conta Poupaça criada com sucesso");
    break;
    case "3":
      String cnpj = lerEntrada("Digite o CNPJ:");
      String empresa = lerEntrada("Digite o nome da empresa:");
      if(cnpj.trim().isEmpty || empresa.trim().isEmpty){
        print("CNPJ ou empresa inválidos");
        return;
      }

      banco.adicionarConta(ContaSalario(titular, saldo, cnpj, empresa));
      print("Conta salário criada com sucesso");
    break;
    case "4":
      banco.adicionarConta(ContaEmpresa(titular, saldo));
      print("Conta empresa criada com sucesso");
    break;
    case "5":
      banco.adicionarConta(ContaInvestimento(titular, saldo));
      print("Conta Investimento criada com sucesso");
    break;
    default:
      print("Tipo de conta inválido");
  }
}

void depositarEmConta(Banco banco){
  String titular = lerEntrada("Digite o nome do titular:");
  Conta? conta = banco.buscarContaPorTitular(titular);

  if(conta == null){
    print("Conta não encontrada");
    return;
  }

  String valorTexto = lerEntrada("Digite o valor do depósito:");
  double? valor = double.tryParse(valorTexto);

  if(valor == null || valor <= 0){
    print("Valor inválido");
    return;
  }

  bool resultado = conta.receber(valor);

  mostrarResultado(resultado, "Depósito realizado com sucesso","Não foi possível realizar o depósito");

  mostrarSaldo(conta);
}

void sacarDeConta(Banco banco){
  String titular = lerEntrada("Digite o nome do titular:");
  Conta? conta = banco.buscarContaPorTitular(titular);

  if(conta == null){
    print("Conta não encontrada");
    return;
  }

  String valorTexto = lerEntrada("Digite o valor do saque:");
  double? valor = double.tryParse(valorTexto);

  if(valor == null || valor <= 0 ){
    print("Valor inválido");
    return;
  }

  bool resultado = conta.enviar(valor);

  mostrarResultado(resultado, "Saque realizado com sucesso", "Não foi possível realizar o saque");

  mostrarSaldo(conta);
}

void verExtrato(Banco banco){
  String titular = lerEntrada("Digite o nome do titular:");
  Conta? conta = banco.buscarContaPorTitular(titular);


  if(conta == null){
    print("Conta não encontrada");
    return;
  }

  print("\n Extrato de ${conta.titular}");

  if(conta.extrato.isEmpty){
    print("Nenhuma movimentação");
  }

  for(var item in conta.extrato){
    print(item);
  }

  mostrarSaldo(conta);
}