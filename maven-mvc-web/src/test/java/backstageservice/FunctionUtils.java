package backstageservice;  
 
import java.io.BufferedWriter;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStreamWriter;  
import java.util.regex.Matcher;  
import java.util.regex.Pattern;  

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeIterator;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;
import org.htmlparser.util.SimpleNodeIterator;
 
public class FunctionUtils  
{  
	private static String ENCODE = "utf-8"; 
    /**  
     * 匹配超链接的正则表达式  
     */ 
//    private static String pat = "http://www\\.oschina\\.net/code/explore/.*/\\w+\\.[a-zA-Z]+";  
    private static String pat = "http://chart.cp.360.cn/kaijiang/slt/";
//    private static String pat = "http://trend.baidu.lecai.com/dlt/";
    private static Pattern pattern = Pattern.compile(pat);  
 
    private static BufferedWriter writer = null;  
 
    /**  
     * 爬虫搜索深度  
     */ 
    public static int depth = 0;  
 
    /**  
     * 以"/"来分割URL,获得超链接的元素  
     *   
     * @param url  
     * @return  
     */ 
    public static String[] divUrl(String url)  
    {  
        return url.split("/");  
    }  
 
    /**  
     * 判断是否创建文件  
     *   
     * @param url  
     * @return  
     */ 
    public static boolean isCreateFile(String url)  
    {  
        Matcher matcher = pattern.matcher(url);  
 
//        return matcher.matches(); 
        return true; 
    }  
 
    /**  
     * 创建对应文件  
     *   
     * @param content  
     * @param urlPath  
     */ 
    public static void createFile(String content, String urlPath)  
    {  
        /* 分割url */ 
        String[] elems = divUrl(urlPath);  
        StringBuffer path = new StringBuffer();  
 
        File file = null;  
        for (int i = 1; i < elems.length; i++)  
        {  
            if (i != elems.length - 1)  
            {  
 
                path.append(elems[i]);  
                path.append(File.separator);  
                file = new File("D:" + File.separator + path.toString());  
 
            }  
 
            if (i == elems.length - 1)  
            {  
//                Pattern pattern = Pattern.compile("\\w+\\.[a-zA-Z]+");  
//                Matcher matcher = pattern.matcher(elems[i]);  
//                if ((matcher.matches()))  
//                {  
                    if (!file.exists())  
                    {  
                        file.mkdirs();  
                    }  
                    String[] fileName = elems[i].split("\\.");  
                    file = new File("D:" + File.separator + path.toString()  
                            + File.separator + "11111.txt");  
                    try 
                    {  
                        file.createNewFile();  
                        writer = new BufferedWriter(new OutputStreamWriter(  
                                new FileOutputStream(file)));  
                        writer.write(content);  
                        writer.flush();  
                        writer.close();  
                        System.out.println("创建文件成功");  
                    } catch (IOException e)  
                    {  
                        e.printStackTrace();  
                    }  
 
//                }  
            }  
 
        }  
    }  
 
    /**  
     * 获取页面的超链接并将其转换为正式的A标签  
     *   
     * @param href  
     * @return  
     */ 
    public static String getHrefOfInOut(String href)  
    {  
        /* 内外部链接最终转化为完整的链接格式 */ 
        String resultHref = null;  
 
        /* 判断是否为外部链接 */ 
        if (href.startsWith("http://"))  
        {  
            resultHref = href;  
        } else 
        {  
            /* 如果是内部链接,则补充完整的链接地址,其他的格式忽略不处理,如：a href="#" */ 
            if (href.startsWith("/"))  
            {  
                resultHref = "http://www.oschina.net" + href;  
            }  
        }  
 
        return resultHref;  
    }  
    
    private static void message( String szMsg ) {  
        try{ 
        	System.out.println(new String(szMsg.getBytes(ENCODE), System.getProperty("file.encoding"))); 
        	}
        catch(Exception e ){
        	
        }  
    }
 
    /**  
     * 截取网页网页源文件的目标内容  
     *   
     * @param content  
     * @return  
     */ 
    public static String getGoalContent(String content)  
    {  
    	System.out.println("开始");
    	System.out.println(content);
    	System.out.println("结束");
    	
    	
    	try {
			Parser parser = new Parser(content);
			
			NodeFilter filter = new NodeClassFilter(TableTag.class);
	    	NodeList list = parser.extractAllNodesThatMatch(filter);
	    	for (int i = 0; i < list.size(); i++) {
		    	TableTag table = (TableTag) list.elementAt(i);
		    	for(int j = 0 ; j < table.getRowCount(); j++) {
			    	TableRow row = table.getRow(j);
			    	TableColumn[] columns = row.getColumns();
			    	for (int k = 0; k < columns.length; k++) {
			    		String str = columns[k].toPlainTextString();
			    		if(k==0){
			    			System.out.println(str);
			    		}
		    			if(k==1){
		    				String date = str.substring(0, 10);
		    				System.out.println(date);
		    				
		    				String weekdate = str.substring(11, 12);
		    				System.out.println(weekdate);
			    		}
		    			if(k==2){
		    				String[] fontNum = str.split("&nbsp;");
		    				for (int m = 0; m < fontNum.length; m++) {
		    					System.out.print(fontNum[m]+"   ");
		    				}
			    		}
		    			if(k==3){
		    				String[] backNum = str.split("&nbsp;");
		    				System.out.println();
		    				for (int m = 0; m < backNum.length; m++) {
		    					System.out.print(backNum[m]+"   ");
		    				}
			    		}
		    			if(k==4){
		    				String allInMoney = str.replaceAll(",", "");
		    				System.out.println(allInMoney);
			    		}
		    			if(k==5){
		    				System.out.println(str);
			    		}
		    			if(k==6){
		    				String firstMoney = str.replaceAll(",", "");
		    				System.out.println(firstMoney);
			    		}
		    			if(k==7){
		    				System.out.println(str);
			    		}
		    			if(k==8){
		    				String secMoney = str.replaceAll(",", "");
		    				System.out.println(secMoney);
			    		}
		    			if(k==9){
		    				String allMoney = str.replaceAll("亿", "").replaceAll("万", "").replaceAll("元", "");
		    				System.out.println(allMoney);
			    		}
			    	}
		    	}
	    	}
			
			
			
			
			// 这里是控制测试的部分，后面的例子修改的就是这个地方。  
//            NodeFilter filter = new TagNameFilter ("table");  
//            NodeList nodes = parser.extractAllNodesThatMatch(filter);  
            
//            processNodeList(nodes,"data-tab");
              
           /* if(nodes!=null) {  
                for (int i = 0; i < nodes.size(); i++) {  
                    Node textnode = (Node) nodes.elementAt(i);  
//                    if(textnode.toHtml().indexOf("data-tab")==-1){
                    if(textnode.toHtml().indexOf("his-table")==-1){
                    	continue;
                    } 
                    
                    NodeList chnodes = textnode.getChildren();
                    
                    for (int j = 0; j < chnodes.size(); j++) {  
                        Node chtextnode = (Node) nodes.elementAt(j);  
                        if(chtextnode.getText().indexOf("tr")==-1){
                        	continue;
                        }  
                        message("getText*****:"+chtextnode.toHtml());  
                        message("=================================================");  
                    }  
                    message("getText:"+textnode.toHtml());  
                    message("=================================================");  
                }  
            } */ 
			
			
			
			/*for (NodeIterator i = parser.elements (); i.hasMoreNodes(); ) {  
                Node node = i.nextNode();  
                message("getText:"+node.getText());  
                message("getPlainText:"+node.toPlainTextString());  
                message("toHtml:"+node.toHtml());  
                message("toHtml(true):"+node.toHtml(true));  
                message("toHtml(false):"+node.toHtml(false));  
                message("toString:"+node.toString());  
                message("=================================================");  
            }*/
		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
        /*int sign = content.indexOf("<table");
        String signContent = content.substring(sign);  
        System.out.println(signContent);
        int start = signContent.indexOf("<table");  
        int end = signContent.indexOf("</table>");  
        System.out.println(signContent.substring(start, end));
        return signContent.substring(start, end);  */
    	return null;
    } 
    
    
    
    
    private static void processNodeList(NodeList list, String keyword) {
		//迭代开始
		SimpleNodeIterator iterator = list.elements();
		while (iterator.hasMoreNodes()) {
			Node node = iterator.nextNode();
			
			/*Parser parser = new Parser(src);
			NodeFilter filter = new TagNameFilter("IMG");
			NodeList list = parser.extractAllNodesThatMatch(filter);
			for (int i = 0; i < list.size(); i++) {
			ImageTag tag = (ImageTag) list.elementAt(i);
			System.out.println(tag.getImageURL());
			}*/
			
			
			
			//得到该节点的子节点列表
			NodeList childList = node.getChildren();
			//孩子节点为空，说明是值节点
			if (null == childList)
			{
				//得到值节点的值
				String result = node.toPlainTextString();
				//若包含关键字，则简单打印出来文本
				if (result.indexOf(keyword) != -1)
					System.out.println(result);
			} //end if
			//孩子节点不为空，继续迭代该孩子节点
			else 
			{
				processNodeList(childList, keyword);
			}//end else
		}//end wile
	}
    
    
    
    
    
    
 
    /**  
     * 检查网页源文件中是否有目标文件  
     *   
     * @param content  
     * @return  
     */ 
    public static int isHasGoalContent(String content)  
    {  
        return content.indexOf("data-tab");  
    }  
 
} 