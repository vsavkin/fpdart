part of fp;

/**
 * Transform a method invocation into a function call.
 *
 * Example:
 *
 *   class Obj {
 *     noArguments() => "no arguments";
 *     withPosArguments(posArg) => posArg;
 *     withNamedArguments({key}) => key;
 *   }
 *
 *    var obj = new Ojb();
 *    _.invoke(#noArguments)(obj) => returns "noArguments"
 *    _.invoke(#withPosArguments, ["pos"])(obj) => returns "pos"
 *    _.invoke(#withNamedArguments, [], {#key: "value"})(obj) => returns "value"
 *
 * Can be used as follows:
 *
 *   list.map(_.invoke(#toString));
 */
invoke(memberName, [List posArgs = const [], Map namedArgs = const {}])
  => (self)
    => reflect(self).
       invoke(s(memberName), posArgs, symbolize(namedArgs)).
       reflectee;

/**
 * Transform a field access into a function call.
 *
 * Example:
 *
 *   class Obj {
 *     var field;
 *   }
 *
 *    var obj = new Ojb();
 *    _.getField(#field)(obj);
 *
 * Can be used as follows:
 *
 *   list.map(_.getField(#field));
 */
Function getField(memberName)
  => (self)
    => reflect(self).
      getField(s(memberName)).
      reflectee;

/**
 * Transform a field access into a function call.
 *
 * Example:
 *
 *   class Obj {
 *     var field;
 *   }
 *
 *    var obj = new Ojb();
 *    _.setField(#field, 10)(obj);
 *
 * Can be used as follows:
 *
 *   list.forEach(_.setField(#field, value));
 */
Function setField(memberName, value)
  => (self)
    => reflect(self).
      setField(s(memberName), value).
      reflectee;