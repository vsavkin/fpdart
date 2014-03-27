part of fp_test;

partialPosTest(pos1, pos2) => "$pos1 $pos2";

partialNamedTest({named1, named2}) => "$named1 $named2";

partialPosTestWithOptional(pos1, [pos2='pos2']) => "$pos1 $pos2";

partialPosAndNamedTest(pos1, {named: 'named'}) => "$pos1 $named";

testPartial() {
  group("[curry]", (){
    test("makes a function", () {
      final c = _.curry(partialPosTest);

      expect(c("pos1", "pos2"), equals("pos1 pos2"));
      expect(c("pos1")("pos2"), equals("pos1 pos2"));
      expect(c()("pos1")("pos2"), equals("pos1 pos2"));
    });

    test("acts as a partial", (){
      final partial = _.curry(partialPosTest)("pos1");

      expect(partial("pos2"), equals("pos1 pos2"));
      expect(partial("pos3"), equals("pos1 pos3"));
    });

    test("supports optional parameters", (){
      final c = _.curry(partialPosTestWithOptional);

      expect(c("pos1"), equals("pos1 pos2"));
      expect(c("pos1", "pos3"), equals("pos1 pos3"));
    });

    test("supports named parameters", (){
      final c = _.curry(partialPosAndNamedTest);

      expect(c("pos1"), equals("pos1 named"));
      expect(c("pos1", named: "named2"), equals("pos1 named2"));
      expect(c(named: "named2")("pos1"), equals("pos1 named2"));
    });
  });

  group("[partial]", () {
    group("[positional]", () {
      test("partially applies an argument", () {
        final partial = _.partial(partialPosTest, ["pos1"]);
        expect(partial("pos2"), equals("pos1 pos2"));
      });

      test("partially applies two arguments", () {
        final partial1 = _.partial(partialPosTest, ["pos1"]);
        final partial2 = _.partial(partial1, ["pos2"]);
        expect(partial2(), equals("pos1 pos2"));
      });
    });

    group("[named]", () {
      test("partially applies an argument", () {
        final partial = _.partial(partialNamedTest, [], {"named1" : "named1"});
        expect(partial(named2: 'named2'), equals("named1 named2"));
      });

      test("partially applies two arguments", () {
        final partial1 = _.partial(partialNamedTest, [], {"named1" : "named1"});
        final partial2 = _.partial(partial1, [], {"named2" : "named2"});
        expect(partial2(), equals("named1 named2"));
      });

      test("allows overriding partially applied arguments", (){
        final partial = _.partial(partialNamedTest, [], {"named1" : "named1", "named2" : "named2"});
        expect(partial(named1: 'NEW'), equals("NEW named2"));
      });
    });

    group("[checked mode]", (){
      test("is a function", (){
        final partial = _.partial(partialPosTest, ["pos1"]);
        expect(partial is Function, equals(true));
      });
    });
  });
}