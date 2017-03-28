package com.sreach.spider;

import java.sql.SQLException;  
 






import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.sreach.spider.UrlDataHanding;  
import com.sreach.spider.UrlQueue; 
 
public class Test  
{  
  public static void main(String[] args) throws SQLException  
  {  
      String url = "http://trend.baidu.lecai.com/dlt/redBaseTrend.action?recentPhase=100&onlyBody=false&phaseOrder=up&coldHotOrder=number";  
//      String url = "http://www.oschina.net/code/explore/achartengine/client/AndroidManifest.xml";  
//      String url1 = "http://www.oschina.net/code/explore";  
//      String url2 = "http://www.oschina.net/code/explore/achartengine";  
//      String url3 = "http://www.oschina.net/code/explore/achartengine/client";  
        
        
      UrlQueue.addElem(url);  
//      UrlQueue.addElem(url1);  
//      UrlQueue.addElem(url2);  
//      UrlQueue.addElem(url3);  
        
      UrlDataHanding[] url_Handings = new UrlDataHanding[10];  
        
          for(int i = 0 ; i < 10 ; i++)  
          {  
              url_Handings[i] = new UrlDataHanding();  
              new Thread(url_Handings[i]).start();  
          }  
      
      
      Parser parser = new Parser();
	try {
		parser = new Parser (url);
	} catch (ParserException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	NodeFilter filter = new TagNameFilter ("table");  
    NodeList nodes = new NodeList();
	try {
		nodes = parser.extractAllNodesThatMatch(filter);
	} catch (ParserException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    if(nodes!=null) {  
        for (int i = 0; i < nodes.size(); i++) {  
        	NodeList trnode = ((Node) nodes.elementAt(i)).getChildren();
            for (int j = 0; j < nodes.size(); j++) {  
                Node textnode = (Node) trnode.elementAt(j);  
                  
                System.out.println("getText:"+textnode.getText());  
            }
        }  
    }
  }
} 