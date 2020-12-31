import java.time.LocalTime;
import java.util.Scanner;

public class Greeting {

	public static void main(String[] args) {
		 LocalTime t1=LocalTime.now();
		 int t2=t1.getHour();
		 System.out.println(t1);
		 if(t2<12)
			 System.out.println("Good Morning");
		 else
			 System.out.println("Good Afternoon");
		 
		 System.out.println("Enter Time");
		 Scanner sc=new Scanner(System.in);
		 int t3=sc.nextInt();
		 if(t3<12 && t3>-1)
			 System.out.println("Good Morning");
		 else if(t3==12 || (t3<24 && t3>12))
			 System.out.println("Good Afternoon");
		 else
			 System.out.println("Not valid time");
	}
	

}
