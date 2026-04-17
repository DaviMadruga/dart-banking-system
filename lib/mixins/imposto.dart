mixin Imposto {
  double taxa = 0.03;

  double valorTaxado(double valor){
    return valor * taxa;
  }
}