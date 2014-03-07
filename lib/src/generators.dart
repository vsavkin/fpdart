part of fp;

Iterable<int> range(int start, int end){
  final r = [];
  for(var i = start; i <= end; ++i)
    r.add(i);
  return r;
}