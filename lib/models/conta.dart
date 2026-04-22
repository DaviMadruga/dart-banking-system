abstract class Conta{
  String titular;
  double _saldo;

  Conta(this.titular, this._saldo);

  double get saldo => _saldo;
  List<String> extrato = [];

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
    extrato.add("Depósito: R\$${valor}");
    return true;
  }

  bool enviar(double valor){
    if(valor <= 0){
      return false;
    }
    if(_saldo >= valor){
      removerSaldo(valor);
      extrato.add("Saque: -R\$${valor}");
      return true;
    }
    return false;
  }

  bool transferir(Conta destino, double valor){
    bool conseguiuEnviar = enviar(valor);

    if(conseguiuEnviar){
      bool conseguiuReceber = destino.receber(valor);

      if(conseguiuReceber){
        extrato.add("Transferência enviada: -R\$${valor} para ${destino.titular}");
        destino.extrato.add("Transferência recebida: +R\$${valor} de ${this.titular}");
        return true;
      }else{
        receber(valor);
      }
    }

    return false;
  }
}