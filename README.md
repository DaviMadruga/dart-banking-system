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

## 🧠 Conceitos de POO utilizados

* 🔹 Encapsulamento
* 🔹 Herança
* 🔹 Polimorfismo
* 🔹 Classes abstratas
* 🔹 Organização em camadas (models, services, utils)

---

## 📁 Estrutura do Projeto

```
lib/
 ├── models/       # Classes de domínio (Conta e suas variações)
 ├── services/     # Lógica do sistema (Banco)
 ├── utils/        # Funções auxiliares (exibição)
 ├── mixins/       # Comportamentos reutilizáveis
bin/
 └── anybank.dart  # Arquivo principal (main)
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
