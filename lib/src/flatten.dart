part of fp;

Iterable flatten(Iterable<Iterable> list) => list.expand((i) => i);

flatMap(Function func) => (Iterable<Iterable> list) => flatten(list.map(func));