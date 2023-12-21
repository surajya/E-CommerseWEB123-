package mvc.ecom.helper;

public class Get10Word {
	public static String getWord(String str) {
		String[] split = str.split(" ");
		
		if(split.length>10) {
			String ans="";
			for(int i=0; i<10; i++) {
				ans +=split[i]+" ";
			}
			return ans+".......";
		}
		return str+".......";
	}
}
