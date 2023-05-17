class BoardItem {
  int xPosition;
  int yPosition;
  int? selectedByPlayerNumber;

  BoardItem({
    required this.xPosition,
    required this.yPosition,
    this.selectedByPlayerNumber,
  });

  select(int selectedByPlayerNumber) {
    this.selectedByPlayerNumber = selectedByPlayerNumber;
  }

  BoardItem copyWith(
      {int? xPosition, int? yPosition, int? selectedByPlayerNumber}) {
    return BoardItem(
        xPosition: xPosition ?? this.xPosition,
        yPosition: yPosition ?? this.yPosition,
        selectedByPlayerNumber:
            selectedByPlayerNumber ?? this.selectedByPlayerNumber);
  }
}
