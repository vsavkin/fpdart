part of fp_test;

testGenerators() {
  group("[generators]", () {
    group("[range]", (){
      test("example", () {
        expect(_.range(1,3), equals([1,2,3]));
      });
    });
  });
}