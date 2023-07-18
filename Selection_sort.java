Selection sort:
===============
it is about "selecting" 
find the minimuim value and place it at starting.

public class Selection_sort {
	public static int[] print(int arr[]) {
		int n=arr.length;    //6
		//int temp=arr[0]; 
		int temp=0;//6 not in all cases soo     
		int a;
		for(int j=0;j<n;j++) {
			 temp=arr[j];                                       
		for(int i=j+1;i<n;i++) {
			if(temp>arr[i]) {
			    
				temp=arr[i];
				arr[i]=arr[j];
				arr[j]=temp;
				
			}
			
		}
		//System.out.println("min : "+temp);
		//int sm=arr[temp];
		//arr[temp]=arr[j];
		//arr[j]=sm;
		
		
	}
		

		return arr;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[]= {6,5,2,7,3,4};
		int res[]=print(arr);
		for(int i=0;i<arr.length;i++) {
			System.out.print(res[i]+"  ");
		}

	}

}

//output
//2  3  4  5  6  7  
