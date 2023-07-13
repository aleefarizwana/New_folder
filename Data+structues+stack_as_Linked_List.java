Linked List working as Stack
================================
by writing required methods having functionality of insert at end,delete at end ,we made a Linked List working ass stack

class Node1{
	int item;
	Node1 next;

public Node1(int item){
	this.item=item;
}
}
public class StackasLL {
	int size=0;
	Node1 head=null;
	Node1 tail=null;
	public void push(int item) {
		Node1 node = new Node1(item);
        node.item = item;
        Node1 current = head;

        if (head == null) {
           head = node;
           head.next = null;
           size = 1;
           // System.out.println(head);
        } else {

            while (current.next != null) {
                current = current.next;
            }
            current.next = node;
            node.next = null;
            this.size += 1;
        }
		
	}
	public int pop() {
		Node1 cur=head;
		Node1 prev=cur;
	    while(cur.next!=null){
	        prev=cur;
	        cur=cur.next;
	    }
	        prev.next=null; 
	        size-=1;
	        return cur.item;//next part of last but one node = null
	    }	

	 public void display() {
	    	Node1 cur =head;
	    	if(head==null) {
	    		System.out.println("empty");
	    	}
	    	else {
	    	for(int i=0;i<size;i++){
	    		System.out.println("item : "+cur.item);
	    		cur=cur.next;
	    	}
	    	
	    	}
	 }
public static void main(String[]args) {
	StackasLL s=new StackasLL();
	s.push(10);
	s.push(20);
	s.push(30);
	System.out.println("stack before doing pop operation");
	s.display();
	s.pop();
	System.out.println("stack before after pop operation");
	s.display();
	
}
}

// output
//stack before doing pop operation
//item : 10
//item : 20
//item : 30
//stack before after pop operation
//item : 10
//item : 20




//class Node2 {
//    int item;
//    Node2 next;
//    public Node2(int item) {
//        this.item=item;
//    }
//}
//
//public class StackasLL {
//    int size=0;
//    Node2 head=null;
//    Node2 tail=null;
//    public void push(int item) {
//        Node2 n1=new  Node2(item);
//        if(size==0) {
//            head=n1;
//            tail=n1;
//        }
//        else {
//            tail.next=n1;
//            n1.next=null;
//            tail=n1;
//            size++;
//        }
//    }
//    public void deleteAtLast() {
//        if(this.head==null) {
//            System.out.println("The list is empty");
//            return;
//        }
//        size--;
//        if(head.next==null) {
//            head=null;
//            return;
//        }
////        Node node=new Node();
//        Node2 prevNode=this.head;
//        Node2 current=this.head.next;
//        while(current.next!=null) {
//            prevNode=prevNode.next;
//            current=current.next;
//        }
//        prevNode.next=null;
//    }
//    public void display() {
//        Node2 current=this.head;
//        for(int i=0;i<size;i++) {
//            System.out.println(current.item +"->");
//            current=current.next;
//        }
//    }
//
//    public static void main(String[] args) {
//        StackasLL S=new StackasLL();
//        S.push(10);
//        S.push(20);
//        S.push(30);
//        S.push(40);
//        S.push(50);
//        S.display();
//    }
//
//}
