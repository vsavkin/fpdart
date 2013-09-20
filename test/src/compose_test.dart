part of fp_test;

testCompose() {
  group("[compose]", () {
    test("composes two functions", () {
      var add = (a,b) => a + b;
      var multiplyByTen = (n) => n * 10;

      var compose = _.compose([multiplyByTen, add]);

      expect(compose(1,2), equals(30));
    });
  });
}