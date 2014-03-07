part of fp;

forEach(Function func) => (Iterable list) => list.forEach(func);

map(Function func) => (Iterable list) => list.map(func);

reduce(Function func) => (Iterable list) => list.reduce(func);

fold(dynamic initial, Function func) => (Iterable list) => list.fold(initial, func);

any(Function func) => (Iterable list) => list.any(func);

contains(dynamic element) => (Iterable list) => list.contains(element);

elementAt(int index) => (Iterable list) => list.elementAt(index);

getByKey(dynamic key) => (Map map) => map[key];

where(Function func) => (Iterable list) => list.where(func);

firstWhere(Function func) => (Iterable list) => list.firstWhere(func);

lastWhere(Function func) => (Iterable list) => list.lastWhere(func);

skip(int n) => (Iterable list) => list.skip(n);