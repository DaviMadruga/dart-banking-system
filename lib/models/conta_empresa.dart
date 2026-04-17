import 'conta.dart';
import '../mixins/imposto.dart';

class ContaEmpresa extends Conta with Imposto{
  ContaEmpresa(super.titular,super.saldo);

  @override
  void enviar(double valor){
    if(saldo >= valor + valorTaxado(valor)){
      saldo -= valor + valorTaxado(valor);
      imprimeSaldo();
    }
  }

  @override
  void receber(double valor){
    saldo += valor - valorTaxado(valor);
    imprimeSaldo();
  }
}