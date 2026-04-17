import 'conta.dart';
import '../mixins/imposto.dart';

class ContaInvestimento extends Conta with Imposto{
  ContaInvestimento(super.titular,super._saldo);

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