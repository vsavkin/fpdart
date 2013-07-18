part of fp_test;

testCompose() {
  group("[compose]", () {
    test("composes two functions", () {
      var compose = _.compose([_.getField("length"), _.invoke("trim")]);
      expect(compose("   abc  "), equals(3));
    });
  });
}