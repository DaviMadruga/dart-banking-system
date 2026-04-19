import 'package:anybank/models/conta.dart';

class ContaPoupanca extends Conta{
  double rendimento = 0.05;

  ContaPoupanca(super.titular,super.saldo);

  void calculaRendimento(){
    if(saldo > 0){
      adicionarSaldo(saldo * rendimento);
    }
  }
}