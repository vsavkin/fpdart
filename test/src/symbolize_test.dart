part of fp_test;

testSymbolize() {
  group("[symbolize]", () {
    test("returns a map with symbolized keys", () {
      var s = _.symbolize({"one" : 1});
      expect(s[const Symbol("one")], equals(1));
    });
  });
}