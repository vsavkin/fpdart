part of fp;

invoke(String memberName, [List posArgs = const [], Map namedArgs = const {}])
  => (self)
    => reflect(self).
       invoke(s(memberName), posArgs, symbolize(namedArgs)).
       reflectee;