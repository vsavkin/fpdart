part of fp;

/**
 * Composes two or more functions.
 * Usage: `compose([f2, f1])(arg)` is the same as `f2(f1(arg))`
 */
Function compose(List<Function> funcs)
  => callSink((posArgs, namedArgs){
    final reversed = funcs.reversed;
    final firstResult = Function.apply(reversed.first, posArgs, namedArgs);
    return reversed.skip(1).fold(firstResult, (prevRes, func) => func(prevRes));
  });