import 'package:anybank/models/conta.dart';

void mostrarSaldo(Conta conta){
  print("Saldo atual de ${conta.titular}: R\$${conta.saldo}");
}

void mostrarResultado(bool sucesso,String msgSucesso,String msgErro){
  if(sucesso){
    print(msgSucesso);
  }else{
    print(msgErro);
  }
}

void mostrarSecao(String titulo){
  print("\n=== $titulo ===");
}