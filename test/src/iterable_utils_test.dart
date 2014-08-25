part of fp_test;


testIterableUtils(){
  group("[iterable utils]", (){
    group("[range]", (){
      test("example", () {
        expect(_.range(1,3), equals([1,2,3]));
      });
    });

    group("[flatten]", (){
      test("flattens a nested list", (){
        expect(_.flatten([[1,2], [3]]), equals([1,2,3]));
      });
    });

    group("[flatMap]", (){
      test("example", (){
        final dup = _.flatMap((n) => [n, n]);
        expect(dup([1,2]), equals([1,1,2,2]));
      });
    });

    group("[zip]", (){
      test("example", (){
        final zipped = _.zip([1,2], [3,4,5]);
        expect(zipped, equals([[1,3], [2,4]]));
      });
    });

    group("[seq functions]", (){
      test("first", (){
        expect(_.first([1,2,3,4]), equals(1));
      });

      test("rest", (){
        expect(_.rest([1,2,3,4]), equals([2,3,4]));
      });
    });
  });
}