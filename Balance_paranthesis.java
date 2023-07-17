Balance paranthesis : comes under java stack
Examples of some correctly balanced strings are: "{}()", "[{()}]", "({()})"
Examples of some unbalanced strings are: "{}(", "({)}", "[[", "}{" etc.

import java.util.Scanner;
import java.util.Stack;

public class Balance_paranthesis {
	public static void main(String []argh)
	{
		Scanner sc = new Scanner(System.in);

        while (sc.hasNext()) {
            Stack<Character> stack = new Stack<>();
            boolean res = true;
            
			String input=sc.next();
            
            for (int i = 0; i < input.length(); i++) {
                
                if (input.charAt(i) == '{' || input.charAt(i) == '[' || input.charAt(i) == '(') {
                    stack.push(input.charAt(i));
                } else {
                    // must not be empty
                    // top should be equal to new input = pop
                    if ( !stack.isEmpty() && stack.peek() == reverse(input.charAt(i))) {
                        stack.pop();
                    }
                    
                    else {
                        res = false;
                        break;
                    }
                }    
            }
            
             if(stack.isEmpty() && res){
                System.out.println("true");
            }
            else{
                System.out.println("false");
            }
            
		}

	}
    
    static Character reverse(Character s) {
        if (s == '}') {return '{';}
        if (s == ']') {return '[';}
        if (s == ')') {return '(';}
        
        return null;
    } 
}


//output
//{{]}}
//false

//output
//{[(())]}
//true
