import 'package:anybank/mixins/imposto.dart';
import 'package:anybank/models/conta.dart';

class ContaInvestimento extends Conta with Imposto{
  ContaInvestimento(super.titular,super._saldo);

  @override
  bool enviar(double valor){
    if(valor <= 0){
      return false;
    }
    if(saldo >= valor + valorTaxado(valor)){
      removerSaldo(valor + valorTaxado(valor));
      return true;
    }
    return false;
  }

  @override
  bool receber(double valor){
    if(valor <= 0){
      return false;
    }
    adicionarSaldo(valor + valorTaxado(valor));
    return true;
  }
}