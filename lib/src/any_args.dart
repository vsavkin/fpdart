part of fp;

Function anyArgs(Function func)
  => callSink((posArgs, namedArgs) => func());