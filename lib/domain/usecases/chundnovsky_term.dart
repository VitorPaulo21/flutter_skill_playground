class ChudnovskyTerm {
  final BigInt P;
  final BigInt Q;
  final BigInt T;

  ChudnovskyTerm(this.P, this.Q, this.T);

  static ChudnovskyTerm binarySplit(int a, int b) {
    if (b - a == 1) {
      final BigInt k = BigInt.from(a);

      if (k == BigInt.zero) {
        // Termo para k = 0
        return ChudnovskyTerm(BigInt.one, BigInt.one, BigInt.from(13591409));
      }

      // Calcular P = (6k-5)(2k-1)(6k-1)
      final BigInt term1 = BigInt.from(6) * k - BigInt.from(5);
      final BigInt term2 = BigInt.from(2) * k - BigInt.from(1);
      final BigInt term3 = BigInt.from(6) * k - BigInt.from(1);
      final BigInt P = term1 * term2 * term3;

      // Calcular Q = k³ * 640320³ / 24
      final BigInt kCubed = k * k * k;
      final BigInt C = BigInt.from(640320);
      final BigInt cCubed = C * C * C;
      final BigInt Q = kCubed * cCubed ~/ BigInt.from(24);

      // Calcular T = P * (13591409 + 545140134k)
      final BigInt linearTerm =
          BigInt.from(13591409) + BigInt.from(545140134) * k;
      BigInt T = P * linearTerm;

      // Alternar sinal: (-1)^k
      if (k.isOdd) {
        T = -T;
      }

      return ChudnovskyTerm(P, Q, T);
    } else {
      // Combinar termos recursivamente
      final int m = (a + b) ~/ 2;
      final ChudnovskyTerm left = binarySplit(a, m);
      final ChudnovskyTerm right = binarySplit(m, b);

      // P = P_left * P_right
      final BigInt P = left.P * right.P;

      // Q = Q_left * Q_right
      final BigInt Q = left.Q * right.Q;

      // T = T_left * Q_right + P_left * T_right
      final BigInt T = left.T * right.Q + left.P * right.T;

      return ChudnovskyTerm(P, Q, T);
    }
  }
}
