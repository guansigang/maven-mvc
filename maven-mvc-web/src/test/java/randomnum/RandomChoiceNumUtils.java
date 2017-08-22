package randomnum;

import java.util.Random;

public class RandomChoiceNumUtils {

	public static void main(String[] args) {
		
//		randomNum(5,1,32);
		int arg0 = 23;
		System.out.println(String.valueOf(arg0 & -arg0));
		
//		MathRandomNum(1,10,100);

	}
	/**
	 * 随机抽数方法
	 * @param choiseNum 选出的数量
	 * @param minNum 最小值
	 * @param maxNum 最大值
	 * @return
	 */
	public static int[] randomNum(int choiseNum, int minNum, int maxNum){
//		int[][] test = new int[2][choiseNum];
		int needle = 0;
		int[] choisedInt = new int[choiseNum];
        Random random = new Random();
        while(needle<choiseNum){
        	int s = random.nextInt(maxNum)%(maxNum-minNum+1) + minNum;
//        	int s = (int)(Math.random()*(maxNum-minNum+1)) + minNum;
        	boolean isHaved = true;
        	for(int j=0;j<choiseNum;j++){
        		if(choisedInt[j]==s){
        			isHaved=false;
        			break;
        		}
        	}
        	if(isHaved){
        		choisedInt[needle++] = s;
        	}
        }
        for(int j=0;j<choisedInt.length;j++){
        	System.out.print(choisedInt[j]);
        	System.out.print(" , ");
        	
        }
        System.out.println();
        bubbleSort(choisedInt);
        for(int j=0;j<choisedInt.length;j++){
        	System.out.print(choisedInt[j]);
        	System.out.print(" , ");
        	
        }
        return choisedInt;
        
	}
	
	public static int[] MathRandomNum(int choiseNum, int minNum, int maxNum){
		int[] choisedInt = {};
		int num = (int)(Math.random()*100);
		System.out.println(num);
		return choisedInt;
	}
	
	/**
	 * 冒泡排序
	 * @param numbers
	 */
	public static int[] bubbleSort(int[] numbers) {   
	    int temp; // 记录临时中间值   
	    int size = numbers.length; // 数组大小   
	    for (int i = 0; i < size - 1; i++) {   
	        for (int j = i + 1; j < size; j++) {   
	            if (numbers[i] > numbers[j]) { // 交换两数的位置   
	                temp = numbers[i];   
	                numbers[i] = numbers[j];   
	                numbers[j] = temp;   
	            }   
	        }   
	    } 
	    return numbers;
	}  
	
	
	
	
	/**
	 * 随机抽数方法
	 * @param choiseNum 选出的数量
	 * @param minNum 最小值
	 * @param maxNum 最大值
	 * @return
	 */
	public static int[] randomNumTest(int choiseNum, int minNum, int maxNum,int[][] test){
//		int[][] test = new int[2][choiseNum];
		int needle = 0;
		int[] choisedInt = new int[choiseNum];
        Random random = new Random();
        	int s = random.nextInt(maxNum)%(maxNum-minNum+1) + minNum;
//        	int s = (int)(Math.random()*(maxNum-minNum+1)) + minNum;80s
    		choisedInt[needle++] = s;
    		test[1][s-1]++;
        
        bubbleSort(choisedInt);
//        for(int j=0;j<choisedInt.length;j++){
//        	System.out.print(choisedInt[j]);
//        	System.out.print(" , ");
//        	
//        }
        return choisedInt;
        
	}
	
	

}
