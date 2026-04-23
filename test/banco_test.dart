import 'package:test/test.dart';
import 'package:anybank/services/banco.dart';
import 'package:anybank/models/conta_corrente.dart';

void main(){
  group("Testes da classe Banco", (){
    test("deve adcionar e buscar conta por titular", (){
      Banco banco = Banco("AnyBank");
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      banco.adicionarConta(conta);

      expect(banco.buscarContaPorTitular("Davi"), isNotNull);
    });

    test("deve retonar null ao buscar conta inexistente", (){
      Banco banco = Banco("AnyBank");

      expect(banco.buscarContaPorTitular("Davi"),isNull);
    });

    test("deve remover conta existente", (){
      Banco banco = Banco("AnyBank");
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      banco.adicionarConta(conta);

      bool resultado = banco.removerContaPorTitular("Davi");

      expect(resultado, true);
      expect(banco.buscarContaPorTitular("Davi"), isNull);
    });

    test("deve retornar false ao tentar remover conta inexistente", (){
      Banco banco = Banco("Anybnak");

      bool resultado = banco.removerContaPorTitular("Davi");

      expect(resultado, false);
    });
  });

  group("Testes de operações em conta", (){
    test("deve depositar valor na conta com sucesso", (){
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      bool resultado = conta.receber(200);

      expect(resultado, true);
      expect(conta.saldo, 1200);
    });

    test("não deve aceitar depósito com valor inválido", (){
    ContaCorrente conta = ContaCorrente("Davi", 1000);

    bool resultado = conta.receber(0);

    expect(resultado, false);
    expect(conta.saldo, 1000);
  });

    test("deve sacar valor da conta com sucesso", (){
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      bool resultado = conta.enviar(300);

      expect(resultado, true);
      expect(conta.saldo, 700);
    });

    test("não deve sacar valor se saldo for insuficiente", (){
      ContaCorrente conta = ContaCorrente("Davi", 100);

      bool resultado = conta.enviar(500);

      expect(resultado, false);
      expect(conta.saldo, 100);
    });
  });

  group("Testes de transferência", (){
    test("deve transferir valor entre contas com sucesso", (){
      Banco banco = Banco("AnyBank");

      ContaCorrente origem = ContaCorrente("Davi", 1000);
      ContaCorrente destino = ContaCorrente("Chris", 500);

      banco.adicionarConta(origem);
      banco.adicionarConta(destino);

      bool resultado = banco.transferir("Davi", "Chris", 200);

      expect(resultado, true);
      expect(origem.saldo, 800);
      expect(destino.saldo, 700);
    });

    test("não deve transferir se saldo for insulficiente", (){
      Banco banco = Banco("AnyBank");

      ContaCorrente origem = ContaCorrente("Davi", 100);
      ContaCorrente destino = ContaCorrente("Chris", 500);

      banco.adicionarConta(origem);
      banco.adicionarConta(destino);

      bool resultado = banco.transferir("Davi", "Chris", 500);

      expect(resultado, false);
      expect(origem.saldo, 100);
      expect(destino.saldo, 500);
    });

    test("não deve transferir se a conta de destino não existir", (){
      Banco banco = Banco("AnyBank");

      ContaCorrente origem = ContaCorrente("Davi", 1000);
      banco.adicionarConta(origem);

      bool resultado = banco.transferir("Davi", "Chris", 200);

      expect(resultado, false);
      expect(origem.saldo, 1000);
    });
  });

  group("Testes de extrato", (){
    test("deve registrar depósito no extrato", (){
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      conta.receber(200);

      expect(conta.extrato.isNotEmpty, true);
    });

    test("deve registrar saque no extrato", (){
      ContaCorrente conta = ContaCorrente("Davi", 1000);

      conta.enviar(100);

      expect(conta.extrato.isNotEmpty, true);
    });
  });

  test("deve registrar movimentações no extrato após transferência", (){
    Banco banco = Banco("AnyBank");

    ContaCorrente origem = ContaCorrente("Davi", 1000);
    ContaCorrente destino = ContaCorrente("Chris", 500);

    banco.adicionarConta(origem);
    banco.adicionarConta(destino);

    banco.transferir("Davi", "Chris", 200);

    expect(origem.extrato.isNotEmpty, true);
    expect(destino.extrato.isNotEmpty, true);
  });
}