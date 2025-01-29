class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }

    String delimiterPattern = ',|\n';
    if (numbers.startsWith('//')) {
      int delimiterIndex = numbers.indexOf('\n');
      String customDelimiter = numbers.substring(2, delimiterIndex);
      delimiterPattern = RegExp.escape(customDelimiter);
      numbers = numbers.substring(delimiterIndex + 1);
    }

    List<String> tokens = numbers.split(RegExp(delimiterPattern));
    List<int> negatives = [];
    int sum = 0;

    for (String token in tokens) {
      if (token.isEmpty) continue;
      int num = int.parse(token);
      if (num < 0) {
        negatives.add(num);
      }
      sum += num;
    }

    if (negatives.isNotEmpty) {
      throw ArgumentError('Negative numbers not allowed: ${negatives.join(', ')}');
    }

    return sum;
  }
}
