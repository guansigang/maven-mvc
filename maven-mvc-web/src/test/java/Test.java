
public class Test {

	public static void main(String[] args) {
		int arg0 = -1;
		System.out.println(String.valueOf(arg0 & -arg0));
	}

}



/*public int nextInt(int arg0) {
	if (arg0 <= 0) {
		throw new IllegalArgumentException("n must be positive");
	} else if ((arg0 & -arg0) == arg0) {
		return (int) ((long) arg0 * (long) this.next(31) >> 31);
	} else {
		int arg1;
		int arg2;
		do {
			arg1 = this.next(31);
			arg2 = arg1 % arg0;
		} while (arg1 - arg2 + (arg0 - 1) < 0);

		return arg2;
	}
}*/
