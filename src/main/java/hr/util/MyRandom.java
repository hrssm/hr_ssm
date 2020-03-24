package hr.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class MyRandom {
	public static List<Integer> getRandomIndex(int count,int n) {
		Set<Integer> set = new TreeSet<Integer>();
		
		while(set.size()<n) {
			set.add((int)(Math.random()*count));
		}
		List<Integer> list = new ArrayList<Integer>(set);
		return list;
		
	}
/*public static void main(String[] args) {
	for (int i = 0; i < 5; i++) {
		List<Integer> list = getRandomIndex(5,3);
		System.out.println(list.toString());
	}
}*/
}
