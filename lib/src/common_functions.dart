part of fp;

forEach(Function func) => (List list) => list.forEach(func);

map(Function func) => (List list) => list.map(func);

reduce(Function func) => (List list) => list.reduce(func);

fold(dynamic initial, Function func) => (List list) => list.fold(initial, func);

any(Function func) => (List list) => list.any(func);

contains(dynamic element) => (List list) => list.contains(element);

elementAt(int index) => (List list) => list.elementAt(index);

getByKey(dynamic key) => (Map map) => map[key];

where(Function func) => (List list) => list.where(func);

firstWhere(Function func) => (List list) => list.firstWhere(func);

lastWhere(Function func) => (List list) => list.lastWhere(func);

skip(int n) => (List list) => list.skip(n);

first(List list) => list.first;

rest(List list) => list.skip(1);