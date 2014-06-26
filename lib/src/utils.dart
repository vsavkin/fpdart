part of fp;

Symbol s(name) => name is Symbol ? name : new Symbol(name);

Map<Symbol, dynamic> symbolize(Map map){
  return map.keys.fold(new Map<Symbol, dynamic>(), (memo, key){
    memo[s(key)] = map[key];
    return memo;
  });
}

bool present(_) => _ != null;

identity(obj) => obj;