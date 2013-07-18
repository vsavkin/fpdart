part of fp;

compose(List<Function> funcs)
  => (arg)
    => funcs.reversed.fold(arg, (prevRes, func) => func(prevRes));