package backstageservice;  
   
 import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
   
public class DownloadPage  
 {  
	 private static final Logger log = Logger.getLogger(DownloadPage.class);
   
     /**  
      * 根据URL抓取网页内容  
      *   
      * @param url  
      * @return  
      */ 
     public static String getContentFormUrl(String url)  
     { 
         /* 实例化一个HttpClient客户端 */ 
    	 CloseableHttpClient client = HttpClients.createDefault();
         HttpGet getHttp = new HttpGet(url);  
   
         String content = null;  
   
         HttpResponse response;  
         try 
         {  
             /*获得信息载体*/ 
             response = client.execute(getHttp);  
             HttpEntity entity = response.getEntity();  
   
             VisitedUrlQueue.addElem(url);  
   
             if (entity != null)  
             {  
                 /* 转化为文本信息 */ 
                 content = EntityUtils.toString(entity);  
//                 System.out.println("测试开始");
//                 System.out.println(content);
//                 System.out.println("测试结束");
                 /* 判断是否符合下载网页源代码到本地的条件 */ 
//                 if (FunctionUtils.isCreateFile(url)  
//                         && FunctionUtils.isHasGoalContent(content) != -1)  
//                 {  
                     FunctionUtils.createFile(FunctionUtils.getGoalContent(content), url);  
//                 }  
             }  
   
         } catch (ClientProtocolException e)  
         {  
             e.printStackTrace();  
         } catch (IOException e)  
         {  
             e.printStackTrace();  
         } finally 
         {  
             try {
				client.close();
			} catch (IOException e) {
				log.error(e.getMessage());
				e.printStackTrace();
			}  
         }  
           
         return content;  
     }  
   
 } 