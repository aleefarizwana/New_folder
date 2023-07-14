BinarySearchTree:
==============
  to make search process easy..
  left side child withh lesser value than root.
  right side child withh greater value than root.
traversal
---------
inorder 
preorder and
post order

  
class Node27{
	Node27 left,right;
    int data;
	public Node27(int data) {
		this.data=data;
		left=right=null;
	}
}
public class BinarySearchTree {
	static Node27 root;
	public BinarySearchTree() {
		root=null;
	}
	void insert(int data) {
		root=insertRecursive(root,data); //so use recursive fun we are not shore which is correct place for particular node
	}


	private Node27 insertRecursive(Node27 root, int data) {
		// TODO Auto-generated method stub
		if(root==null) {				//if BST is null,then new node is roo
			root=new Node27(data);
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
	public void preorder(Node27 root) {
		if(root!=null) {
			System.out.print(root.data+ " ");
			preorder(root.left);
			preorder(root.right);
		}
	}
	
	public void inorder(Node27 root) {
		if(root != null) {
			inorder(root.left);
			System.out.print(root.data+" ");
			inorder(root.right);
		}
	}
	
	
	public void postorder(Node27 root) {
		if(root != null) {
			postorder(root.left);
			postorder(root.right);
			System.out.print(root.data+" ");
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BinarySearchTree bst=new BinarySearchTree();
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
	}

}


//output

//5 3 2 4 8 7 9     ----preorder
//2 3 4 5 7 8 9     ---inorder
//2 4 3 7 9 8 5     ----postorder
