package mvc.ecom.helper;

public class AfterDiscount {
	public static int disPrice(int p,int dis) {
		return (int)(p*(100-dis)/100);
	}
}
