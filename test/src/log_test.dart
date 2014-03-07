part of fp_test;

testLog() {
  group("[log]", () {
    test("example", () {
      plus(a, b) => a + b;

      final tappedArgs = [];
      final tappedPlus = _.log((a,b) => tappedArgs..add(a)..add(b), plus);

      expect(tappedPlus(1,2), equals(3));
      expect(tappedArgs, equals([1,2]));
    });
  });
}