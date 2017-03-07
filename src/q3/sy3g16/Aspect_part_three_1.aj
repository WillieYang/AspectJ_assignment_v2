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
				if(scanner.hasNextLine()){
					//scanner.useDelimiter(",");
					//while(scanner.hasNext()){}
					String[] list_value;
					
						//System.out.println(scanner.nextLine());
					String value_line = scanner.nextLine();
					list_value = value_line.split(",");
					System.out.println(list_value);
					List<String> lst = new ArrayList<String>(Arrays.asList(list_value));
					System.out.println(lst);
					System.out.println(list_value[0] + list_value[1]);
					
					for(int i=0; i<lst.size();i++){
						System.out.println(lst.get(i));
						if(Integer.toString(input_value))
					}
					
					
						System.out.println("Line------");
				}
				if(scanner.hasNextLine()){
					System.out.println(scanner.nextLine());
				}
				if(scanner.hasNextLine()){
					System.out.println(scanner.nextLine());
				}
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
