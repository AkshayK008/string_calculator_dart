import 'package:test/test.dart';
import 'package:string_calculator/string_calculator.dart';

void main() {
  group('StringCalculator', () {
    final calculator = StringCalculator();

    test('returns 0 for an empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('returns the number itself for a single number', () {
      expect(calculator.add('1'), equals(1));
    });

    test('returns sum of two numbers', () {
      expect(calculator.add('1,2'), equals(3));
    });

    test('handles new line as delimiter', () {
      expect(calculator.add('1\n2,3'), equals(6));
    });

    test('supports custom delimiters', () {
      expect(calculator.add('//;\n1;2'), equals(3));
    });

    test('throws exception for negative numbers', () {
      expect(() => calculator.add('1,-2,-3'), throwsA(isA<ArgumentError>()));
    });
  });
}
