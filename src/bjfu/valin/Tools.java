package bjfu.valin;

public class Tools {
	//�ṩһ�������������ݿ���������תΪgb2312��
	
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
