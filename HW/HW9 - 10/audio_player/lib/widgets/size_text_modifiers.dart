String textModifier1(String originalText) {
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

String textModifier2(String originalText) {
  int index = originalText.indexOf('by');
  if (index != -1) {
    String modifiedText = originalText.substring(index + 2).trim();
    return modifiedText;
  } else {
    return originalText;
  }
}

String sliderFormatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String minutes = twoDigits(duration.inMinutes.remainder(60));
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return '$minutes:$seconds';
}

String sliderValueFormatDuration(double sliderValue) {
  Duration duration = Duration(milliseconds: sliderValue.toInt());
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);
  String formattedDuration =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  return formattedDuration;
}
