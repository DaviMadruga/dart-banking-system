import 'package:anybank/models/conta.dart';

class ContaSalario extends Conta{
  String cnpj;
  String empresa;

  ContaSalario(super.titular,super.saldo,this.cnpj,this.empresa);

  bool depositarSalario(double salario){
    if(salario <= 0){
      return false;
    }
    adicionarSaldo(salario);
    return true;
  }
}