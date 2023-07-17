BINARY SEARCH TREE:

insert method here uses recursive way to enter elements.
Also includes preorder,inorder and postorder traversal.
The file includes search operation in binary tree for an element.



BST_search.java
==================
class Node28{
	Node28 left,right;
    int data;
	public Node28(int data) {
		this.data=data;
		left=right=null;
	}
}
public class BST_search {
	static Node28 root;
	BST_search leftchild,rightchild;
	public BST_search() {
		root=null;

	}
	void insert(int data) {
		root=insertRecursive(root,data); //so use recursive fun we are not shore which is correct place for particular node
	}


	private Node28 insertRecursive(Node28 root, int data) {
		// TODO Auto-generated method stub
		if(root==null) {				//if BST is null,then new node is roo
			root=new Node28(data);
			return root;
		}
		if(data<root.data) {
			root.left=insertRecursive(root.left,data);
		}
		else if(data>root.data) {
			root.right=insertRecursive(root.right,data);
		}
		return root;
	}
	public void preorder(Node28 root) {
		if(root!=null) {
			System.out.print(root.data+ " ");
			preorder(root.left);
			preorder(root.right);
		}
	}
	
	public void inorder(Node28 root) {
		if(root != null) {
			inorder(root.left);
			System.out.print(root.data+" ");
			inorder(root.right);
		}
	}
	
	
	public void postorder(Node28 root) {
		if(root != null) {
			postorder(root.left);
			postorder(root.right);
			System.out.print(root.data+" ");
		}
	}
	public static boolean search(int data,Node28 cur) {
		if(cur==null) {
			return false;
		}
		if(cur.data==data) {
			
			return true;
		}
		else {
			if(data<cur.data) {
				return search(data,cur.left);
			}
			else {
				return search(data,cur.right);
			}
		}
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BST_search  bst=new BST_search();
		bst.insert(5);
		bst.insert(3);
		bst.insert(8);
		bst.insert(2);
		bst.insert(4);
		bst.insert(7);
		bst.insert(9);
		bst.preorder(root);
		System.out.println();
		bst.inorder(root);
		System.out.println();
		bst.postorder(root);
		System.out.println();
		boolean state=search(7,root);
		System.out.println("element found "+state);
			
		
	}

}


//output

//5 3 2 4 8 7 9 
//2 3 4 5 7 8 9 
//2 4 3 7 9 8 5 


//when element = 10
//output
//5 3 2 4 8 7 9 
//2 3 4 5 7 8 9 
//2 4 3 7 9 8 5 
//element found :false

//when input element =7
//output
//5 3 2 4 8 7 9 
//2 3 4 5 7 8 9 
//2 4 3 7 9 8 5 
//element found true

