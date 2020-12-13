List<int> shuffleArray(int start, int end) {
  final int length = end - start + 1;
  if (length < 1) {
    return List.empty();
  }

  final List<int> items = List.generate(length, (index) => start + index);
  items.shuffle();
  return items;
}
