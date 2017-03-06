package q2;

import test.Exception_test;

public class B {

	public int foo(int a) throws Exception_test{
		bar(2);
		return 0;
	}
	
	public int bar(int b) throws Exception_test{
		
		return baz(b);
	}
	
	public int baz(int a) throws Exception_test{
		
		if(a == 5){
			throw new Exception_test("part two");
		}
		return a + a;
	}
	
	public int tell(int a) throws Exception_test{
		System.out.println("shengyang");
		return baz(4);
	}
}
