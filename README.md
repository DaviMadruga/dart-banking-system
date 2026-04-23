# 🏦 AnyBank - Sistema Bancário em Dart

## 📌 Descrição

O **AnyBank** é um sistema bancário desenvolvido em Dart com foco em Programação Orientada a Objetos (POO).
O projeto simula operações bancárias reais através de um menu interativo no terminal.

---

## ⚙️ Funcionalidades

* ✔ Criar contas (Corrente, Poupança, Salário, Empresa, Investimento)
* ✔ Listar contas cadastradas
* ✔ Buscar conta por titular
* ✔ Depositar dinheiro
* ✔ Sacar dinheiro
* ✔ Transferir entre contas
* ✔ Remover conta (com confirmação)
* ✔ Visualizar extrato de movimentações

---

## 🧠 Conceitos aplicados

- Programação Orientada a Objetos (POO)
- Herança
- Polimorfismo
- Encapsulamento
- Classes abstratas
- Organização em camadas (models, services, utils)
- Manipulação de listas
- Tratamento de entradas do usuário
---

## 📁 Estrutura do Projeto

```
lib/
 ├── models/
 │    ├── conta.dart
 │    ├── conta_corrente.dart
 │    ├── conta_poupanca.dart
 │    ├── conta_salario.dart
 │    ├── conta_empresa.dart
 │    └── conta_investimento.dart
 │
 ├── services/
 │    ├── banco.dart
 │    └── menu_services.dart
 │
 ├── utils/
 │    └── exibicao.dart
 │
 └── mixins/
      └── imposto.dart

bin/
 └── anybank.dart

test/
 └── banco_test.dart
```

---

## ▶️ Como executar o projeto

### Pré-requisitos:

* Dart instalado

### Rodar o projeto:

```bash
dart run
```

---

## 💻 Exemplo de uso

```text
=== MENU PRINCIPAL ===
1 - Listar contas
2 - Buscar conta por titular
3 - Transferir entre contas
4 - Criar nova conta
5 - Depositar dinheiro
6 - Sacar dinheiro
7 - Ver extrato
8 - Remover conta
9 - Sair
```

---

## 🚀 Melhorias futuras

* 💾 Persistência de dados em arquivo (JSON)
* 🔐 Sistema de autenticação
* 🧾 Extrato com data e hora
* 📱 Interface gráfica com Flutter

---

## 👨‍💻 Autor

Projeto desenvolvido por **Davi Madruga Cavalcanti**.
