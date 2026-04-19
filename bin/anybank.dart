import 'package:anybank/models/conta.dart';
import 'package:anybank/models/conta_corrente.dart';
import 'package:anybank/models/conta_poupanca.dart';
import 'package:anybank/models/conta_salario.dart';
import 'package:anybank/models/conta_empresa.dart';
import 'package:anybank/models/conta_investimento.dart';
import 'package:anybank/services/banco.dart';

void main(){
  ContaCorrente contaChris = ContaCorrente("Chris", 4000);
  ContaPoupanca contaDenize = ContaPoupanca("Denize", 4000);
  ContaSalario contaCatarina = ContaSalario("Catarina", 0, "111111111", "AnyBank");
  ContaEmpresa contaMatheus = ContaEmpresa("Matheus", 2000);
  ContaInvestimento contaRoberta = ContaInvestimento("Roberta", 2000);


  print("Saldo atual de ${contaChris.titular}: R\$${contaChris.saldo}");
  bool envioChris = contaChris.enviar(4300);
  if(envioChris){
    print("Envio realizado com sucesso");
  }else{
    print("Não foi possível realizar o envio");
  }
  print("Saldo atual de ${contaChris.titular}: R\$${contaChris.saldo}\n");


  print("Saldo atual de ${contaDenize.titular}: R\$${contaDenize.saldo}");
  bool envioDenize = contaDenize.enviar(4300);
  if(envioDenize){
    print("Envio realizado com sucesso");
    contaDenize.calculaRendimento();
  }else{
    print("Não foi possível realizar o envio");
  }
  print("Saldo atual de ${contaDenize.titular}: R\$${contaDenize.saldo}\n");


  print("Saldo atual de ${contaCatarina.titular}: R\$${contaCatarina.saldo}");
  bool envioCatarina = contaCatarina.depositarSalario(2500);
  if(envioCatarina){
    print("Salário depositado com sucesso");
  }else{
    print("Não foi possível depositar o salário");
  }
  print("Saldo atual de ${contaCatarina.titular}: R\$${contaCatarina.saldo}\n");


  bool envioMatheus = contaMatheus.enviar(1000);
  if(envioMatheus){
    print("Envio realizado com sucesso");
  }else{
    print("Não foi possível realizar o envio");
  }
  print("Saldo atual de ${contaMatheus.titular}: R\$${contaMatheus.saldo}\n");


  bool envioRoberta = contaRoberta.receber(1000);
  if(envioRoberta){
    print("Envio realizado com sucesso");
  }else{
    print("Não foi possível realizar o envio");
  }
  print("Saldo atual de ${contaRoberta.titular}: R\$${contaRoberta.saldo}\n");


  print("\n=== TESTE DE TRANSFERÊNCIA ===");
  print("Saldo atual de ${contaChris.titular}: R\$${contaChris.saldo}");
  print("Saldo atual de ${contaDenize.titular}: R\$${contaDenize.saldo}");

  bool trasnfereciaRealizada = contaChris.transferir(contaDenize, 200);

  if(trasnfereciaRealizada){
    print("Transferência realizada com sucesso");
  }else{
    print("Não foi possível realizar a transferência");
  }

  print("Saldo atual de ${contaChris.titular}: R\$${contaChris.saldo}");
  print("Saldo atual de ${contaDenize.titular}: R\$${contaDenize.saldo}");


  Banco banco = Banco("AnyBank");

  banco.adicionarConta(contaChris);
  banco.adicionarConta(contaDenize);
  banco.adicionarConta(contaCatarina);
  banco.adicionarConta(contaMatheus);
  banco.adicionarConta(contaRoberta);

  print("=== CONTAS CADASTRADAS ===");
  banco.listarContas();

  print("=== BUSCAR CONTA ===");
  banco.buscarContaPorTitular("Denize");
  Conta? contaEncontrada = banco.buscarContaPorTitular("Denize");
  if(contaEncontrada != null){
    print("Conta encontrada: ${contaEncontrada.titular} | Saldo: R\$${contaEncontrada.saldo}");
  }else{
    print("Conta não encontrada");
  }

  print("=== TRANSFERÊNCIA VIA BANCO ===");

  bool resultado = banco.transferir("Catarina", "Denize", 300);

  if(resultado){
    print("Transferência realizada com sucesso");
  }else{
    print("Falha na transferência");
  }
}