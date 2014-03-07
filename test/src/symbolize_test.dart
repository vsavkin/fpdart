part of fp_test;

testSymbolize() {
  group("[symbolize]", () {
    test("returns a map with symbolized keys", () {
      final s = _.symbolize({"one" : 1});
      expect(s[#one], equals(1));
    });
  });
}