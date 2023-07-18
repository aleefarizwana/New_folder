//Set:
//	In computer science, a set is an abstract data type that can store certain values.
//	without any particular order, and no repeated values.  
//	{1,2,3}is an example of a set, {1,2,2} but  is not a set.

import java.io.*;
import java.util.*;
public class HashSet_hacherr {
	public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
//        System.out.println("enter no of pairs you want to enter");
        int t = s.nextInt();
        String [] pair_left = new String[t];
        String [] pair_right = new String[t];
        
        for (int i = 0; i < t; i++) {
            pair_left[i] = s.next();
            pair_right[i] = s.next();
        }
        HashSet <String>se=new HashSet<>();
        for (int i = 0; i < t; i++) {
            se.add(pair_left[i]+" "+pair_right[i]);
            System.out.println(se.size());
        }
        //int count=1;
//Write your code here
        // for (int i = 2; i < t; i++) {
        //     for (int j = 2; j <= i; j++) {
        //         if(pair_left[i]!=pair_left[j] && pair_right[i]!= pair_right[j])
        //             count++;
}
}

//output
//5
//john tom
//john mary
//john tom
//mary anna
//mary anna
//1
//2
//2
//3
//3

