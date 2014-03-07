part of fp_test;

testCompose() {
  group("[compose]", () {
    test("composes two functions", () {
      final add = (a,b) => a + b;
      final multiplyByTen = (n) => n * 10;

      final composed = _.compose([multiplyByTen, add]);

      expect(composed(1,2), equals(30));
    });
  });
}