abstract class Conta{
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);

  void receber(double valor){
    saldo += valor;

    imprimeSaldo();
  }

  void enviar(double valor){
    if(saldo >= valor){
      saldo -= valor;

      imprimeSaldo();
    }else{
      print("Saldo insulficiente");
    }
    
  }

  void imprimeSaldo(){
    print("O saldo atual de $titular, é: R\$$saldo");
  }
}