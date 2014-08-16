part of fp;

/**
 * Decorates a function so it can be called with any number of arguments.
 *
 * Example:
 *
 *    func() => 42;
 *    final decorated = _.anyArgs(func);
 *    decorated(); //returns 42
 *    decorated(1,2,3, named1: 1, named2: 2); //returns 42
 */
Function anyArgs(Function func)
  => callSink((posArgs, namedArgs) => func());

/**
 * Decorates a function to log the passed in parameter.
 *
 * Example:
 *
 *    add(a,b) => a + b;
 *    var addWithLogging = _.log((a,b) => print("arguments: $a and $b"), add);
 *    addWithLogging(1,2); // also prints arguments are 1 and 2
 */
Function log(Function tapFunction, Function func){
  return callSink((posArgs, namedArgs){
    Function.apply(tapFunction, posArgs, namedArgs);
    return Function.apply(func, posArgs, namedArgs);
  });
}