import 'package:app/domain/usecases/chundnovsky_term.dart';

class PiCalculation {
  PiCalculation._();

  static BigInt _sqrtBigInt(BigInt n) {
    if (n < BigInt.zero) throw ArgumentError('Negative input');
    if (n < BigInt.two) return n;

    // Estimativa inicial
    BigInt x0 = n;
    BigInt x1 = (x0 + n ~/ x0) >> 1; // x1 = (x0 + n/x0)/2

    // Continue enquanto estivermos melhorando a estimativa
    while (x1 < x0) {
      x0 = x1;
      x1 = (x0 + n ~/ x0) >> 1;
    }

    return x0;
  }

  static String calculatePiChudnovsky(
    int digits, {
    required void Function(int current, int total) progressCallback,
  }) {
    final int extraDigits = 20;
    final BigInt scale = BigInt.from(10).pow(digits + extraDigits);

    // Número de iterações (cada termo adiciona ~14 dígitos)
    final int n = (digits / 14).ceil() + 2;

    progressCallback(1, 4);

    // Calcular os termos usando binary splitting
    final ChudnovskyTerm term = ChudnovskyTerm.binarySplit(0, n);

    progressCallback(2, 4);

    // Calcular √(10005) com alta precisão
    final BigInt sqrt10005 = _sqrtBigInt(BigInt.from(10005) * scale * scale);

    progressCallback(3, 4);

    // Numerador: Q * 426880 * √(10005)
    final BigInt numerator = term.Q * BigInt.from(426880) * sqrt10005;

    // Denominador: T33
    final BigInt denominator = term.T;

    // π = numerador / denominador
    final BigInt piScaled = numerator ~/ denominator;

    final String piStr = piScaled.toString();

    progressCallback(4, 4);

    // Garantir que temos dígitos suficientes
    if (piStr.length <= digits) {
      return "3.${"0" * digits}";
    }

    // Extrair parte inteira e fracionária
    final String integerPart = piStr.substring(0, 1);
    final String fractionalPart = piStr.substring(1, digits + 1);

    return '$integerPart.$fractionalPart';
  }
}
