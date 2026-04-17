import 'conta.dart';

class ContaSalario extends Conta{
  String cnpj;
  String empresa;

  ContaSalario(super.titular,super.saldo,this.cnpj,this.empresa);

  void depositarSalario(double salario){
    saldo += salario;

    print("O salário da $empresa, de CNPJ $cnpj no valor de R\$$salario, foi depositado");
    imprimeSaldo();
  }
}