package q3.sy3g16;

import java.util.List;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

import org.aspectj.lang.Signature;

public aspect Aspect_part_three_1 {
	
	public String hist_file;
	
	pointcut callhist(int input_value): call(public int q3..*(int))
						&& args(input_value);
				
	after(int input_value) returning(Object o): callhist(input_value){
		
		Signature sig_hist = thisJoinPointStaticPart.getSignature();
		
		hist_file = "./" + sig_hist.toString() + "-hist.csv";
		
		int return_value = (Integer) o;
		
		File f = new File(hist_file);
		if(f.exists() && !f.isDirectory()){
			System.out.println("The file is existed");
			
			
			try {
				Scanner scanner;
				scanner = new Scanner(f);
					//scanner.useDelimiter(",");
					//while(scanner.hasNext()){}
				String value_line = scanner.nextLine();
				String input_fre = scanner.nextLine();
				String return_fre = scanner.nextLine();
				String[] list_value;
				String[] list_input_fr;
				String[] list_return_fr;
					
				list_value = value_line.split(",");
				list_input_fr = input_fre.split(",");
				list_return_fr = return_fre.split(",");
				
				List<String> lst_value = new ArrayList<String>(Arrays.asList(list_value));
				List<String> lst_input_fr = new ArrayList<String>(Arrays.asList(list_input_fr));
				List<String> lst_return_fr = new ArrayList<String>(Arrays.asList(list_return_fr));
				
				System.out.println(lst_value);
				System.out.println(list_value[0] + list_value[1]);
					
				for(int i=0; i<lst_value.size();i++){
					System.out.println(lst_value.get(i));
					if(Integer.toString(input_value).equals(lst_value.get(i))){
						System.out.println("the value is existed");
						System.out.println(lst_input_fr.get(i));
						int it_ve = Integer.parseInt(lst_input_fr.get(i));
						System.out.println("integer:" + ++it_ve);
						Integer.toString(it_ve);
						System.out.println("string:" + it_ve);
						//lst_input_fr.set(i, it_ve);
						
						//lst_input_fr.get(i) = it_ve;
						System.out.println(lst_input_fr.get(i));
					}
				}
					
					
					System.out.println("Line------");
	
				
					System.out.println(input_fre);
				
					System.out.println(return_fre);
				
				scanner.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
//			try {
//				FileReader fr = new FileReader(hist_file);
//				BufferedReader wr = new BufferedReader(fr);
//				
//				
//			} catch (FileNotFoundException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
			
			
			
		}else{
			System.out.println("The file is not existed");
			
				try {
					f.createNewFile();
					FileWriter wr = new FileWriter(f);
					if(input_value == return_value){
						wr.write(Integer.toString(input_value) + "," + System.getProperty("line.separator"));
						wr.write(Integer.toString(1) + "," + System.getProperty("line.separator"));
						wr.write(Integer.toString(1) + "," + System.getProperty("line.separator"));
						wr.close();
					}else{
						wr.write(input_value + "," + return_value + System.getProperty("line.separator"));
						wr.write(Integer.toString(1) + "," + Integer.toString(0) + System.getProperty("line.separator"));
						wr.write(Integer.toString(0) + "," + Integer.toString(1) + System.getProperty("line.separator"));
						wr.close();
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			
			} 
		}

		System.out.println(hist_file);
		System.out.println("The input value:" + input_value);
		System.out.println("The return value:" + return_value);
	}
}
