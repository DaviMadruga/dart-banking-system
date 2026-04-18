abstract class Conta{
  String titular;
  double _saldo;

  Conta(this.titular, this._saldo);

  double get saldo => _saldo;

  void adicionarSaldo(double valor){
    _saldo += valor;
  }

  void removerSaldo(double valor){
    _saldo -= valor;
  }

  bool receber(double valor){
    if(valor <= 0){
      return false;
    }
    adicionarSaldo(valor);
    return true;
  }

  bool enviar(double valor){
    if(valor <= 0){
      return false;
    }
    if(_saldo >= valor){
      removerSaldo(valor);
      return true;
    }
    return false;
  }
}