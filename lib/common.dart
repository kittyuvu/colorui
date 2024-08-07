import 'dart:math';

bool randomBool() {
  return Random().nextBool();
}

int randomInt({int min = 0, required int max}) {
  return Random().nextInt(max - min) + min;
}

double randomDouble({double min = 0, required int max}) {
  return Random().nextDouble() * (max - min) + min;
}

String randomString({int length = 6}) {
  return String.fromCharCodes(
    Iterable.generate(length, (_) => randomInt(max: 62)),
  );
}
