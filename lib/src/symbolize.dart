part of fp;

s(String name) => new Symbol(name);

Map<Symbol, dynamic> symbolize(Map<String, dynamic> map){
  return map.keys.fold(new Map<Symbol, dynamic>(), (memo, key){
    memo[s(key)] = map[key];
    return memo;
  });
}
