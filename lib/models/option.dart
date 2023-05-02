class Option {
  bool available;
  int xPosition;
  int yPosition;
  int? playerNumber;

  Option({
    this.available = true,
    required this.xPosition,
    required this.yPosition,
    this.playerNumber,
  });

  select(int playerNumber) {
    available = false;
    this.playerNumber = playerNumber;
  }

  Option copyWith(
      {bool? available, int? xPosition, int? yPosition, int? playerNumber}) {
    return Option(
        xPosition: xPosition ?? this.xPosition,
        yPosition: yPosition ?? this.yPosition,
        available: available ?? this.available,
        playerNumber: playerNumber ?? this.playerNumber);
  }
}
