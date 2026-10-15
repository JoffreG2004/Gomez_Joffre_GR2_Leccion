import '../modelos/numeros_modelos.dart';

class NumerosControladores {
  
  NumerosModelos invertir(int numero) {
    NumerosModelos datos = NumerosModelos(numero);
    int temporal = numero;

    while (temporal > 0) {
      datos.invertido = datos.invertido * 10 + temporal % 10;
      temporal = temporal ~/ 10;
    }

    return datos;
  }

  NumerosModelos sumarDigitos(int numero) {
    NumerosModelos datos = NumerosModelos(numero);
    int temporal = numero;

    while (temporal > 0) {
      datos.suma = datos.suma + temporal % 10;
      temporal = temporal ~/ 10;
    }

    if (datos.suma % 2 == 0) {
      datos.paridad = 'Par';
    } else {
      datos.paridad = 'Impar';
    }

    return datos;
  }

  NumerosModelos calcularDivisores(int numero) {
    NumerosModelos datos = NumerosModelos(numero);

    for (int i = 1; i <= numero; i++) {
      if (numero % i == 0) {
        if (datos.divisores.isNotEmpty) {
          datos.divisores = '${datos.divisores}, ';
        }
        datos.divisores = '${datos.divisores}$i';
        datos.cantidadDivisores++;
      }
    }

    return datos;
  }
}
