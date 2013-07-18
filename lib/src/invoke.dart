part of fp;

invoke(String memberName, [List positionalArguments = const []])
  => (self)
    => reflect(self).
       invoke(s(memberName), positionalArguments).
       reflectee;