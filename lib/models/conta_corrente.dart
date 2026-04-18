import 'conta.dart';

class ContaCorrente extends Conta{
  double emprestimo = 300;

  ContaCorrente(super.titular,super.saldo);

  @override
  bool enviar(double valor){
    if(valor <= 0){
      return false;
    }
    if(saldo + emprestimo >= valor){
      removerSaldo(valor);
      return true;
    }
    return false;
  }
}