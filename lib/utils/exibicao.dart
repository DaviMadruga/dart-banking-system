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

void mostrarMenu(){
  mostrarSecao("MENU PRINCIPAL");
  print("1 - Listar contas");
  print("2 - Buscar conta por titular");
  print("3 - Tranferir entre contas");
  print("4 - Criar nova conta");
  print("5 - Depositar dinheiro");
  print("6 - Sacar dinheiro");
  print("7 - Ver extrato");
  print("8 - Remover conta");
  print("9 - Sair");
}