part of fp;

anyArgs(Function func)
  => callSink((posArgs, namedArgs) => func());