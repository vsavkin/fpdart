part of fp_test;

partialPosTest(pos1, pos2) => "$pos1 $pos2";

partialNamedTest({named1, named2}) => "$named1 $named2";

testPartial() {
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