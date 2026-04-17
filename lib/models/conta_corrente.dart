import 'conta.dart';

class ContaCorrente extends Conta{
  double emprestimo = 300;

  ContaCorrente(super.titular,super.saldo);

  @override
  void enviar(double valor){
    if(saldo + emprestimo >= valor){
      saldo -= valor;
      imprimeSaldo();
    }else{
      print("Saldo insulficiente!");
      imprimeSaldo();
    }
  }
}