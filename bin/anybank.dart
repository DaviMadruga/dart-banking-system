import '../lib/models/conta_corrente.dart';
import '../lib/models/conta_poupanca.dart';
import '../lib/models/conta_salario.dart';
import '../lib/models/conta_empresa.dart';
import '../lib/models/conta_investimento.dart';

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

}


