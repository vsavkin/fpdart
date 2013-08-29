part of fp_test;

testAnyArgs() {
  group("[anyArgs]", () {
    test("ignrores all args", () {
      var c = () => "RES";
      var anyArgsC = _.anyArgs(c);

      expect(anyArgsC(1,2,3), equals("RES"));
      expect(anyArgsC(one: 'one', two: 'two'), equals("RES"));
    });
  });
}