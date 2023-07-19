//checking whether Linked List is palindrome or not
public class LLpalindrome {
    static class ListNode {
        int val;
        ListNode next;

        ListNode(int val) {
            this.val = val;
        }
    }
    public static ListNode reverseLinkedList(ListNode head) {
        ListNode prevNode = null;
        ListNode currNode = head;

        while (currNode != null) {
            ListNode nextNode = currNode.next;
            currNode.next = prevNode;
            prevNode = currNode;
            currNode = nextNode;
        }

        return prevNode;
    }
    public static void printLinkedList(ListNode head) {
        ListNode currNode = head;

        while (currNode != null) {
            System.out.print(currNode.val + " -> ");
            currNode = currNode.next;
        }

        System.out.println("null");
    }
    public static boolean palindrome(ListNode head1,ListNode head2){
        ListNode currentNode1 = head1;
        ListNode currentNode2 = head2;
        while ( currentNode1 != null && currentNode2 != null)
        {
            if(currentNode1.val != currentNode2.val)
            {
                return false;
            }
            currentNode1 = currentNode1.next;
            currentNode2 = currentNode2.next;
        }
    return true;
    }
    public static void main(String[] args) {
        // Create a sample linked list: 1 -> 2 -> 3 -> 4 -> 5
    	// Create a sample linked list: 1 -> 2 -> 3 ->3->2->1
    	ListNode head = new ListNode(1);
        head.next = new ListNode(2);
        head.next.next = new ListNode(3);
        head.next.next.next = new ListNode(3);
        head.next.next.next.next = new ListNode(2);
        head.next.next.next.next.next = new ListNode(1);
        System.out.println("Original Linked List:");
        printLinkedList(head);

        ListNode reversedHead = reverseLinkedList(head);

        System.out.println("Reversed Linked List:");
        printLinkedList(reversedHead);
        boolean checkpalindrome = palindrome(head,reversedHead);
        System.out.println("The given linked list is palindrame: " + checkpalindrome);
    }
}

//output
//Original Linked List:
//1 -> 2 -> 3 -> 2 -> 3 -> null
//Reversed Linked List:
//3 -> 2 -> 3 -> 2 -> 1 -> null
//The given linked list is palindrame: false

//output
//Original Linked List:
//1 -> 2 -> 3 -> 3 -> 2 -> 1 -> null
//Reversed Linked List:
//1 -> 2 -> 3 -> 3 -> 2 -> 1 -> null
//The given linked list is palindrame: true
