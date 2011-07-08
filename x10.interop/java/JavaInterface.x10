import x10.interop.Java;
public class JavaInterface {
    public static class MyString(s:String) implements java.lang.CharSequence {
        def charAt(index:Java.int):Java.char {
            return Java.convert(s(Java.convert(index)));
        }
        def length():Java.int {
            return Java.convert(s.length());
        }
        def subSequence(start:Java.int, end:Java.int):java.lang.CharSequence {
            return new MyString(s.substring(Java.convert(start), Java.convert(end)));
        }
        def toString():java.lang.String { // this is a problem
            return Java.convert(s);
        }
    }
    public static def main(Array[String]) {
        val j_s:java.lang.String = Java.convert("abc");
        val ms:MyString = new MyString("bc");
        val j_ix:Java.int = j_s.indexOf(ms);
        Console.OUT.println("Java 'abc'.indexOf('bc'): "+Java.convert(j_ix));
    }
}