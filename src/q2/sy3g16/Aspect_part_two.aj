package q2.sy3g16;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.aspectj.lang.Signature;

public aspect Aspect_part_two {

	public String node;
	public String current_node;
	public String enclosing_node;
	public String nodefile = "./node.csv";
	public String edgefile = "./edge.csv";
	
	pointcut callnodes(): call(public int q2..*(int));
	pointcut calledge(): call(public int q2..*(int))
						&& withincode(public int q2..*(int));
	
	before() : callnodes(){
		
		Signature sig_node = thisJoinPointStaticPart.getSignature();
		
		node = sig_node.getDeclaringTypeName() + "." + sig_node.getName() + "(int)";
		
		System.out.println("Before---------");
		
		System.out.println("Node:" + node);

		System.out.println(
				"JoinPoint at:" + thisJoinPointStaticPart.getSourceLocation().getWithinType().getCanonicalName()
				+ "-->" + thisJoinPointStaticPart.getSourceLocation().getLine());
		
		try(FileWriter fw = new FileWriter(nodefile, true);
				BufferedWriter bw = new BufferedWriter(fw);
				PrintWriter out = new PrintWriter(bw))
			{
				out.println(node);
				
			}catch(IOException e){
				System.out.println("Error Message.");
			}
	}
	
	after() returning(Object o): calledge(){
		
		Signature sig_current = thisJoinPointStaticPart.getSignature();
		Signature sig_enclosing = thisEnclosingJoinPointStaticPart.getSignature();
		
		current_node = sig_current.getDeclaringTypeName() + "." + sig_current.getName() + "(int)";
		enclosing_node = sig_enclosing.getDeclaringTypeName() + "." + sig_enclosing.getName() + "(int)";
		
		System.out.println("After--------");
		
		System.out.println("Edge:"+ enclosing_node + "-->" + current_node);
		
		System.out.println("Return normally:" + o);
		
		try(FileWriter fw_edge = new FileWriter(edgefile, true);
				BufferedWriter bw_edge = new BufferedWriter(fw_edge);
				PrintWriter out_edge = new PrintWriter(bw_edge))
			{
				out_edge.println(enclosing_node + "-->" + current_node);
				
			}catch(IOException e){
				System.out.println("Error Message.");
			}
	}
}
