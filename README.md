# FP in Dart

[![Build Status](https://drone.io/github.com/vsavkin/fpdart/status.png)](https://drone.io/github.com/vsavkin/fpdart/latest)

The DartFP library provides a lot of functional programming helpers.

## Installation

Add the DartFP dependency to your project’s pubspec.yaml.

    name: my_project
    dependencies:
      fp: '>=0.4.2 <0.5.0'

Then, run `pub install`.

Finally, import the DartFP libraries.

    import 'package:fp/fp.dart' as _;


## Common

This set of helpers wraps the `Iterable` methods into functions.

For example:

    final printIterable = _.forEach(print);
    printIterable([1,2,3]); // prints 1 2 3

Another example:

    final sum = _.reduce((a,b) => a + b);
    sum([1,2,3]); // returns 6

All helpers:

    forEach, map, reduce, fold, any, contains, elementAt, getByKey, where, firstWhere, lastWhere, skip



## invoke/getField/setField

This group of helpers allows you to call a function on a collection of objects.

    class Obj {
      var field;
      noArguments() => "no arguments";
      withPosArguments(posArg) => posArg;
      withNamedArguments({key}) => key;
    }

    var obj = new Ojb();

    _.invoke(#noArguments)(obj); // returns "noArguments"
    _.invoke(#withPosArguments, ["pos"])(obj); // returns "pos"
    _.invoke(#withNamedArguments, [], {#key: "value"})(obj); // returns "value"

    obj.field = 'value';
    _.getField(#field)(obj); // returns "value"

    _.setField(#field, "new")(obj); // sets the field to "new"

You can pass strings instead of symbols.


## Compose

Composes two or more functions.

    var compose = _.compose([_.getField(#length), _.invoke(#trim)]);
    compose("   abc  ") => returns 3




## Curry

This is a very powerful helper that transforms a function taking multiple arguments into a chain of functions taking zero or more arguments.

    func(pos1, pos2) => "$pos1 $pos2";
    final c = _.curry(func);

    expect(c("pos1", "pos2"), equals("pos1 pos2"));
    expect(c("pos1")("pos2"), equals("pos1 pos2"));
    expect(c()("pos1")()("pos2"), equals("pos1 pos2"));

You can think about it as follows:
The function `c` remembers all the given arguments. When it gets all the needed arguments, the original function will be called.

Obviously, there is no real remembering happening, which is demonstrated here:

    func(pos1, pos2, pos3) => "$pos1 $pos2 $pos3";
    final partial = _.curry(func)("pos1");

    expect(partial("pos2")("pos3"), equals("pos1 pos2 pos3"));
    expect(partial("pos4")("pos5"), equals("pos1 pos4 pos5"));


The `curry` helper also supports optional parameters:

    func(pos1, [pos2='pos2']) => "$pos1 $pos2";
    final c = _.curry(func);

    expect(c("pos1"), equals("pos1 pos2"));
    expect(c("pos1", "pos3"), equals("pos1 pos3"));

And named parameters:

    func(pos1, {named: 'named'}) => "$pos1 $named";
    final c = _.curry(func);

    expect(c("pos1"), equals("pos1 named"));
    expect(c("pos1", named: "named2"), equals("pos1 named2"));

Named parameters can be applied in any order:

    expect(c(named: "named2")("pos1"), equals("pos1 named2"));



## Partial

Partially applies a function.

    func(pos1, pos2, {named}) => "$pos1 $pos2 $named";

    var partial = _.partial(func, ["pos1"]);
    partial("pos2"); // returns "pos1 pos2";

    var partial = _.partial(func, [], {"named" : "named1"});
    partial("pos1", "pos2"); // returns "pos1 pos2 named1";



## Misc Iterable Utils

The `compact` helper filters out all nulls.

    _.compact([1,2,null,3]); // returns [1,2,3]

The `flatten` helper:

    _.flatten([[1,2], [3]]); // returns [1,2,3]

The `flatMap` helper calls map and flattens the result:

    final dup = _.flatMap((n) => [n,n]);
    dup([1,2]); // returns [1,1,2,2]

The `range` helper generates an iterable of integers:

    _.range(1,3); // returns [1,2,3]

The `first` helper returns the first element of the given iterable:

    _.first([1,2,3]); // returns 1

The `rest` helper skips the first element:

    _.rest([1,2,3]); // returns [2,3]



## Misc Function Decorators

The `anyArgs` helper is useful for event handlers.

    var c = () => "RES";
    var anyArgsC = _.anyArgs(c);
    anyArgsC(1,2,3); // returns "RES"
    anyArgsC(one: 'one', two: 'two'); // equals("RES");

The `log` helper is useful while debugging.

    add(a, b) => a + b;
    var addWithLogging = _.log((a,b) => print("arguments are $a and $b"), add);
    addWithLogging(1,2) => also prints arguments are 1 and 2


## Misc Utils

The `symbolize` helper returns a map with symbolized keys.

    _.symbolize({"one" : 1}); // returns {#one : 1}

The `identity` returns the given parameter.

    _.identity(5); // returns 5

The `present` returns true if the given object is not null

    _.present(5); // returns true
    _.present(null); // returns false
