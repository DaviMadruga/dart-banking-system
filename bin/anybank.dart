import 'package:anybank/models/conta.dart';
import 'package:anybank/models/conta_corrente.dart';
import 'package:anybank/models/conta_poupanca.dart';
import 'package:anybank/models/conta_salario.dart';
import 'package:anybank/models/conta_empresa.dart';
import 'package:anybank/models/conta_investimento.dart';
import 'package:anybank/services/banco.dart';
import 'package:anybank/utils/exibicao.dart';

void main(){
  ContaCorrente contaChris = ContaCorrente("Chris", 4000);
  ContaPoupanca contaDenize = ContaPoupanca("Denize", 4000);
  ContaSalario contaCatarina = ContaSalario("Catarina", 0, "111111111", "AnyBank");
  ContaEmpresa contaMatheus = ContaEmpresa("Matheus", 2000);
  ContaInvestimento contaRoberta = ContaInvestimento("Roberta", 2000);

  mostrarSecao("ENVIO DE VALOR - CONTA CHRIS");
  mostrarSaldo(contaChris);
  bool resultadoEnvioChris = contaChris.enviar(4300);
  mostrarResultado(resultadoEnvioChris,"Envio realizado com sucesso", "Não foi possível realizar o envio",);
  mostrarSaldo(contaChris);

  mostrarSecao("ENVIO DE VALOR - CONTA DENIZE");
  mostrarSaldo(contaDenize);
  bool resultadoEnvioDenize = contaDenize.enviar(4300);
  mostrarResultado(resultadoEnvioDenize,"Envio realizado com sucesso", "Não foi possível realizar o envio",);
  mostrarSaldo(contaDenize);

  mostrarSecao("DEPOSITO DE SALARIO - CONTA CATARINA");
  mostrarSaldo(contaCatarina);
  bool resultadoSalarioDepositadoCatarina = contaCatarina.depositarSalario(2500);
  mostrarResultado(resultadoSalarioDepositadoCatarina,"Salário depositado com sucesso", "Não foi possível depositar o salário",);
  mostrarSaldo(contaCatarina);

  mostrarSecao("ENVIO DE VALOR - CONTA MATHEUS");
  mostrarSaldo(contaMatheus);
  bool resultadoEnvioMatheus = contaMatheus.enviar(1000);
  mostrarResultado(resultadoEnvioMatheus, "Envio realizado com sucesso", "Não foi possível realizar o envio");
  mostrarSaldo(contaMatheus);

  mostrarSecao("RECEBIMENTO DE VALOR - CONTA ROBERTA");
  mostrarSaldo(contaRoberta);
  bool resultadoRecebimentoRoberta = contaRoberta.receber(1000);
  mostrarResultado(resultadoRecebimentoRoberta, "Recebimento realizado com sucesso", "Não foi possível realizar o recebimento");

  mostrarSecao("TESTE DE TRANSFERÊNCIA");
  mostrarSaldo(contaChris);
  mostrarSaldo(contaDenize);
  bool resultadoTransferenciaRealizada = contaChris.transferir(contaDenize, 200);
  mostrarResultado(resultadoTransferenciaRealizada, "Transferência realizada com sucesso", "Não foi possível realizar a transferência");
  mostrarSaldo(contaChris);
  mostrarSaldo(contaDenize);

  Banco banco = Banco("AnyBank");
  banco.adicionarConta(contaChris);
  banco.adicionarConta(contaDenize);
  banco.adicionarConta(contaCatarina);
  banco.adicionarConta(contaMatheus);
  banco.adicionarConta(contaRoberta);

  mostrarSecao("CONTAS CADASTRADAS");
  banco.listarContas();

  mostrarSecao("BUSCAR CONTA");
  Conta? contaEncontrada = banco.buscarContaPorTitular("Denize");
  if(contaEncontrada != null){
    print("Conta encontrada: ${contaEncontrada.titular} | Saldo: R\$${contaEncontrada.saldo}");
  }else{
    print("Conta não encontrada");
  }

  mostrarSecao("TRANSFERÊNCIA VIA BANCO");
  mostrarSaldo(contaCatarina);
  mostrarSaldo(contaDenize);
  bool resultado = banco.transferir("Catarina", "Denize", 300);
  if(resultado){
    print("Transferência realizada com sucesso");
  }else{
    print("Falha na transferência");
  }
  mostrarSaldo(contaCatarina);
  mostrarSaldo(contaDenize);
}