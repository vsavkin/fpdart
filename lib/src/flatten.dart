part of fp;

List flatten(List<List> list) => list.expand((i) => i);

List flatMap(Function func) => (List<List> list) => flatten(list.map(func));