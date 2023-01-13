class Card {
  final Suit suit;
  final Rank rank;

  const Card({required this.suit, required this.rank});

  List<int> get values {
    switch (rank) {
      case Rank.ace:
        return [1, 11];
      case Rank.two:
        return [2];
      case Rank.three:
        return [3];
      case Rank.four:
        return [4];
      case Rank.five:
        return [5];
      case Rank.six:
        return [6];
      case Rank.seven:
        return [7];
      case Rank.eight:
        return [8];
      case Rank.nine:
        return [9];
      case Rank.ten:
        return [10];
      case Rank.jack:
        return [10];
      case Rank.queen:
        return [10];
      case Rank.king:
        return [10];
    }
  }

  String get suitStringValue {
    switch (suit) {
      case Suit.hearts:
        return '♥';
      case Suit.spades:
        return '♠';
      case Suit.diamonds:
        return '♦';
      case Suit.clubs:
        return '♣';
    }
  }

  String get rankStringValue {
    switch (rank) {

      case Rank.ace:
        return 'A';
      case Rank.two:
        return '2';
      case Rank.three:
        return '3';
      case Rank.four:
        return '4';
      case Rank.five:
        return '5';
      case Rank.six:
        return '6';
      case Rank.seven:
        return '7';
      case Rank.eight:
        return '8';
      case Rank.nine:
        return '9';
      case Rank.ten:
        return '10';
      case Rank.jack:
        return 'J';
      case Rank.queen:
        return 'Q';
      case Rank.king:
        return 'K';
    }
  }

  @override
  String toString() {
    var output = StringBuffer();
    output.write(suitStringValue);
    output.write(rankStringValue);
    return output.toString();
  }
}

enum Suit { hearts, spades, diamonds, clubs }

enum Rank { ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king }

// ♠♥♦♣
