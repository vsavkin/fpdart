part of fp;

/**
 * Wraps an object into a symbol if needed.
 *
 * Example:
 *
 *   s("one"); //retuns new Symbol("one");
 *   s(s("one")); //retuns new Symbol("one");
 */
Symbol s(name) => name is Symbol ? name : new Symbol(name);

/**
 * Symbolizes all the keys in the given map.
 */
Map<Symbol, dynamic> symbolize(Map map){
  return map.keys.fold(new Map<Symbol, dynamic>(), (memo, key){
    memo[s(key)] = map[key];
    return memo;
  });
}

/**
 * Returns false if the given object is null. Returns true otherwise.
 */
bool present(_) => _ != null;

identity(obj) => obj;