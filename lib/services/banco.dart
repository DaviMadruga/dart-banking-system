import 'package:anybank/models/conta.dart';

class Banco {
  String nome;
  List<Conta> contas = [];

  Banco(this.nome);

  void adicionarConta(Conta conta){
    contas.add(conta);
  }

  void listarContas(){
    for(Conta conta in contas){
      print("Titular: ${conta.titular} | Saldo: R\$${conta.saldo}");
    }
  }

  Conta? buscarContaPorTitular(String titular){
    for(Conta conta in contas){
      if(conta.titular.toLowerCase() == titular.toLowerCase()){
        return conta;
      }
    }
    return null;
  }

  bool transferir(String nomeOrigem, String nomeDestino, double valor){
    Conta? origem = buscarContaPorTitular(nomeOrigem);
    Conta? destino = buscarContaPorTitular(nomeDestino);

    if(origem == null || destino == null){
      return false;
    }

    return origem.transferir(destino, valor);
  }

  bool removerContaPorTitular(String titular){
    Conta? conta = buscarContaPorTitular(titular);

    if(conta == null){
      return false;
    }

    contas.remove(conta);
    return true;
  }
}