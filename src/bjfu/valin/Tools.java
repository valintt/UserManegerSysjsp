package bjfu.valin;

public class Tools {
	//提供一个方法，将数据库中文乱码转为gb2312等
	
	public static String getNewString(String input) {
		
		String result="";
		try{
			
			result=new String(input.getBytes("iso-8859-1"),"gb2312");
			
		}
		catch(Exception ex){																							
			ex.printStackTrace();
		}
		
		return result;
	}
	
	
}
