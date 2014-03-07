part of fp;

Iterable flatten(Iterable<Iterable> list) => list.expand((i) => i);

flatMap(Function func) => (Iterable<Iterable> list) => flatten(list.map(func));

Iterable compact(Iterable list) => list.where(present);

Iterable<int> range(int start, int end){
  final r = [];
  for(var i = start; i <= end; ++i)
    r.add(i);
  return r;
}

first(Iterable list) => list.first;

Iterable rest(Iterable list) => list.skip(1);