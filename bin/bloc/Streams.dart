import 'dart:async';

void streamController1() {
  //cria um stream
  final ctrl = StreamController();

  //adiciona um listener ao stream que vai imprimir os dados
  final sub = ctrl.stream.listen((dados) {
    print('$dados' + " de dentro da stream");
  });
  ctrl.sink.add("Caio");
  ctrl.sink.add("2000");
  ctrl.sink.add({'nome': 'Caio', 'idade': '21'});
  ctrl.sink.add("Amo a Iara");
}

void streamTransformer() {
  final StreamController<int> ctrl = StreamController<int>.broadcast();

  final StreamSubscription sub =
      ctrl.stream.where((valor) => (valor % 2 == 0)).listen((valor) {
    print("$valor");
  });

  for (var i = 0; i < 11; i++) {
    ctrl.sink.add(i);
  }

  ctrl.close();
}

void streamTransformer2() {
  final StreamController<String> ctrl = StreamController<String>.broadcast();

  final StreamSubscription sub = ctrl.stream
      .where((string) => (string.toString().length <= 5))
      .listen((string) {
    print(string);
  });

  ctrl.sink.add("Caio");
  ctrl.sink.add("Vinicius");
  ctrl.sink.add("Iara");
  ctrl.sink.add("Alves");
  ctrl.sink.add("Forest");

  ctrl.close();
}
