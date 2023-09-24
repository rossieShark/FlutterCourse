class TextModifierService {
  String removeTextAfter(String originalText) {
    if (originalText.contains('-')) {
      int lastIndex = originalText.lastIndexOf('-');
      originalText = originalText.substring(0, lastIndex);
    }

    if (originalText.contains('Ft.')) {
      int lastIndex = originalText.lastIndexOf('(Ft.');
      originalText = originalText.substring(0, lastIndex);
    }

    if (originalText.contains('by')) {
      int lastIndex = originalText.lastIndexOf('by');
      originalText = originalText.substring(0, lastIndex);
    }

    if (originalText.contains('(')) {
      int lastIndex = originalText.lastIndexOf('(');
      originalText = originalText.substring(0, lastIndex);
    }

    return originalText;
  }

  String capitalizeFirstLetter(String input) {
    if (input.isEmpty) return input;

    final lowerCased = input.toLowerCase();
    final firstLetter = lowerCased[0].toUpperCase();
    final restOfWord = lowerCased.substring(1);

    return '$firstLetter$restOfWord';
  }
}
