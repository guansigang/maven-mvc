package auto;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class GeneralXML {

	/**
	 * 
	 * @Author:HaoMing(����)
	 * @Project_name:weinet
	 * @Full_path:eg.GeneralXML.java
	 * @Date:@2014 2014-3-28 ����11:10:08
	 * @Return_type:String
	 * @Desc :��ȡָ����xmlģ��
	 */
	public static String readFileByer(String filePath) {
		StringBuffer sb = new StringBuffer();
		File file = new File(filePath);
		FileReader fr = null;
		try {
			fr = new FileReader(file);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		BufferedReader br = new BufferedReader(fr);

		String strLine = "";
		try {
			while ((strLine = br.readLine()) != null) {
				sb.append(strLine);
				sb.append("\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fr.close();
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	public static void main(String[] args) {
		
//		final String  head = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n";
//		final String root_start = "<root>";
//		final String root_end = "</root>";
//		
//		StringBuffer sb = new StringBuffer();
//		sb.append(head);
//		sb.append(root_start);
//		
//		MessageFormat mf = new MessageFormat(GetXmlContont.readFileByer("src/eg/template.xml"));
//		sb.append(mf.format(new Object[] { "list.jsp", "get", "list", "request_param1|request_param2"}));
//		sb.append(mf.format(new Object[] { "content.jsp", "post", "content", "title,publisher,published_calendar"}));
//		
//		sb.append(root_end);
//		
//		System.out.println(sb.toString());
//		System.out.print(sb.toString().replaceAll("\n", ""));
	}
}
