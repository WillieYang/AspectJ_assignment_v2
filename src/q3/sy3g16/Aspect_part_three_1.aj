package q3.sy3g16;

import org.aspectj.lang.Signature;

public aspect Aspect_part_three_1 {

	pointcut callhist(int input_value): call(public int q3..*(int))
						&& args(input_value);
				
	after(int input_value) returning(Object returnvalue): callhist(input_value){
		
		Signature sig_hist = thisJoinPointStaticPart.getSignature();
		String hist_file = "./" + sig_hist + ".csv";
		
		
		
		System.out.println("The input value:" + input_value);
		System.out.println("The return value:" + returnvalue);
	}
}
