Thread:represents separate path of execution of agroup of statements.

public class Current {
	public static void main(String[]args) {
		System.out.println("Let us find the current thread: ");
		Thread t=new Thread().currentThread();
		System.out.println(t);
		System.out.println(t.getName());
	}

}

//output
//Let us find the current thread: 
//Thread[main,5,main]
//main
