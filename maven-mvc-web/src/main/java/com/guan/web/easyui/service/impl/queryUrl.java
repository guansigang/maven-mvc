package com.guan.web.easyui.service.impl;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

public class queryUrl {

	public static void main(String[] args) {
		String url = "http://www.avlang";
		String end = ".com";
		int i = 0;
		try {
			for(i=2;i<200;i++){
				int sw = getContentFormUrl(url,end,i);
				if(sw==1){
					break;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**  
     * 根据URL抓取网页内容  
     *   
     * @param url  
	 * @param date 
     * @return  
     */ 
    public static int getContentFormUrl(String start,String end,int i) 
    { if(i==200){
    	return 1;
    }
    	String url = start+String.valueOf(i)+end;
    	System.out.println("#############");
    	System.out.println(url);
//    	return 0;
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
  
  
            if (entity != null)  
            {  
                /* 转化为文本信息 */ 
                content = EntityUtils.toString(entity);
                content = new String(content.getBytes("ISO-8859-1"),"utf-8");
                System.out.println("***************");
                System.out.println(content);
            }  
  
        } catch (ClientProtocolException e)  
        { 
            e.printStackTrace(); 
            return 0;
        } catch (IOException e)  
        {  
        	e.printStackTrace();  
        	return 0;
        } finally 
        {  
            try {
				client.close();
			} catch (IOException e) {
				e.printStackTrace();
			}  
        } 
        
        return 1;
          
    }

}
