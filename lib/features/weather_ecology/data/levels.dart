/// Перечисление уровней загрязнения воздуха.
enum Level {
  /// Минимальный уровень загрязнения.
  minimal,

  /// Низкий уровень загрязнения.
  low,

  /// Нормальный уровень загрязнения.
  normal,

  /// Высокий уровень загрязнения.
  high,

  /// Критический уровень загрязнения.
  critical;

  /// Получение уровня CO.
  static Level getCOLevel(double value) {
    if (value < 4400) {
      return Level.minimal;
    } else if (value < 9400) {
      return Level.low;
    } else if (value < 12400) {
      return Level.normal;
    } else if (value < 15400) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }

  /// Получение уровня NO2.
  static Level getNO2Level(double value) {
    if (value < 40) {
      return Level.minimal;
    } else if (value < 70) {
      return Level.low;
    } else if (value < 150) {
      return Level.normal;
    } else if (value < 200) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }

  /// Получение уровня O3.
  static Level getO3Level(double value) {
    if (value < 60) {
      return Level.minimal;
    } else if (value < 100) {
      return Level.low;
    } else if (value < 140) {
      return Level.normal;
    } else if (value < 180) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }

  /// Получение уровня SO2.
  static Level getSO2Level(double value) {
    if (value < 20) {
      return Level.minimal;
    } else if (value < 80) {
      return Level.low;
    } else if (value < 250) {
      return Level.normal;
    } else if (value < 350) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }

  /// Получение уровня PM25.
  static Level getPM25Level(double value) {
    if (value < 10) {
      return Level.minimal;
    } else if (value < 25) {
      return Level.low;
    } else if (value < 50) {
      return Level.normal;
    } else if (value < 75) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }

  /// Получение уровня PM10.
  static Level getPM10Level(double value) {
    if (value < 20) {
      return Level.minimal;
    } else if (value < 50) {
      return Level.low;
    } else if (value < 100) {
      return Level.normal;
    } else if (value < 200) {
      return Level.high;
    } else {
      return Level.critical;
    }
  }
}
