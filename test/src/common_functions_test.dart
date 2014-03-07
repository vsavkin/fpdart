part of fp_test;

testCommonFunctions(){
  group("[common functions]", (){
    test("map", (){
      final multiplyByTwo = _.map((n) => n * 2);
      expect(multiplyByTwo([1,2]), equals([2,4]));
    });

    test("forEach", (){
      var sum = 0;
      _.forEach((n) => sum += n)([1,2]);
      expect(sum, equals(3));
    });

    test("reduce", (){
      final sum = _.reduce((a,b) => a + b);
      expect(sum([1,2]), equals(3));
    });

    test("fold", (){
      final sum = _.fold(10, (a,b) => a + b);
      expect(sum([1,2]), equals(13));
    });

    test("any", (){
      final containsEvenNumbers = _.any((a) => a % 2 == 0);
      expect(containsEvenNumbers([1,2,3]), isTrue);
      expect(containsEvenNumbers([1,3]), isFalse);
    });

    test("contains", (){
      final containsEvenNumbers = _.contains(2);
      expect(containsEvenNumbers([1,2,3]), isTrue);
      expect(containsEvenNumbers([1,3]), isFalse);
    });

    test("elementAt", (){
      final secondElement = _.elementAt(1);
      expect(secondElement([1,2,3]), equals(2));
    });

    test("getByKey", (){
      final getName = _.getByKey("name");
      expect(getName({"name" : "jim"}), equals("jim"));
    });

    test("where", (){
      final onlyEven = _.where((n) => n % 2 == 0);
      expect(onlyEven([1,2,3]), equals([2]));
    });

    test("firstWhere", (){
      final firstEven = _.firstWhere((n) => n % 2 == 0);
      expect(firstEven([1,2,3,4]), equals(2));
    });

    test("lastWhere", (){
      final lastEven = _.lastWhere((n) => n % 2 == 0);
      expect(lastEven([1,2,3,4]), equals(4));
    });
  });
}