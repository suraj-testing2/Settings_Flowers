part of vector_math_test;

class ColorsTest extends BaseTest {

  void testToGrayscale() {
  	final input = new Vector4(0.0, 1.0, 0.5, 1.0);
  	final output = new Vector4.zero();

  	Colors.toGrayscale(input, output);
 	
 	relativeTest(output.r, 0.745);
 	relativeTest(output.g, 0.745);
 	relativeTest(output.b, 0.745);
 	expect(output.w, equals(1.0));
  }

  void testHexString() {
  	final color = new Vector4.zero();

  	Colors.fromHexString('#6495ED', color);

 	relativeTest(color.r, 0.3921);
 	relativeTest(color.g, 0.5843);
 	relativeTest(color.b, 0.9294);
 	relativeTest(color.a, 1.0);

 	expect(Colors.toHexString(color), equals('6495ed'));

  	Colors.fromHexString('#6495eD', color);

 	relativeTest(color.r, 0.3921);
 	relativeTest(color.g, 0.5843);
 	relativeTest(color.b, 0.9294);
 	relativeTest(color.a, 1.0);

 	expect(Colors.toHexString(color), equals('6495ed'));

  	Colors.fromHexString('6495eD', color);

 	relativeTest(color.r, 0.3921);
 	relativeTest(color.g, 0.5843);
 	relativeTest(color.b, 0.9294);
 	relativeTest(color.a, 1.0);

 	expect(Colors.toHexString(color), equals('6495ed'));

  	Colors.fromHexString('#F0F', color);

 	relativeTest(color.r, 1.0);
 	relativeTest(color.g, 0.0);
 	relativeTest(color.b, 1.0);
 	relativeTest(color.a, 1.0);

 	expect(Colors.toHexString(color), equals('ff00ff'));

 	expect(() => Colors.fromHexString('vector_math rules!', color), 
 		throwsA(new isInstanceOf<FormatException>()));
  }

  void testFromRGBA() {
  	final output = new Vector4.zero();

  	Colors.fromRGBA(100, 149, 237, 255, output);
 	
 	relativeTest(output.r, 0.3921);
 	relativeTest(output.g, 0.5843);
 	relativeTest(output.b, 0.9294);
 	expect(output.w, equals(1.0));
  }

  void testAlphaBlend() {
  	final output = new Vector4.zero();
  	final foreground1 = new Vector4(0.3921, 0.5843, 0.9294, 1.0);
  	final foreground2 = new Vector4(0.3921, 0.5843, 0.9294, 0.5);
  	final background1 = new Vector4(1.0, 0.0, 0.0, 1.0);
  	final background2 = new Vector4(1.0, 0.5, 0.0, 0.5);

  	Colors.alphaBlend(foreground1, background1, output);
 	
 	relativeTest(output.r, 0.3921);
 	relativeTest(output.g, 0.5843);
 	relativeTest(output.b, 0.9294);
 	expect(output.w, equals(1.0));

  	Colors.alphaBlend(foreground1, background2, output);

 	relativeTest(output.r, 0.3921);
 	relativeTest(output.g, 0.5843);
 	relativeTest(output.b, 0.9294);
 	expect(output.w, equals(1.0));

  	Colors.alphaBlend(foreground2, background1, output);

 	relativeTest(output.r, 0.6960);
 	relativeTest(output.g, 0.2921);
 	relativeTest(output.b, 0.4647);
 	expect(output.w, equals(1.0));

  	Colors.alphaBlend(foreground2, background2, output);

 	relativeTest(output.r, 0.5947);
 	relativeTest(output.g, 0.5561);
 	relativeTest(output.b, 0.6195);
 	expect(output.w, equals(0.75));
  }

  void run() {
    test('Colors From RGBA', testFromRGBA);
    test('Colors Hex String', testHexString);
    test('Colors To Grayscale', testToGrayscale);
    test('Colors Alpha Blend', testAlphaBlend);
  }
}
