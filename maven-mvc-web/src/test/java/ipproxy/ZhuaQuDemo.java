package ipproxy;

import java.net.InetAddress;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

public class ZhuaQuDemo {
	 public static void main(String[] args)throws Exception {
		 
//		 	String url = "https://s.1688.com/";
//		 	String url = "http://www.ip100.com.cn/";
		 	String url = "https://s.1688.com/selloffer/offer_search.htm?keywords=%C7%A2%C7%A2&button_click=top&n=y";
//		 	String url = "https://www.taobao.com/";
//		 	String url = "https://s.1688.com/selloffer/rpc_async_render.jsonp?templateConfigName=marketOfferresult&startIndex=0&keywords=ǢǢ&asyncCount=60&pageSize=60&n=y&_pageName_=market&offset=0&rpcflag=new&async=true&beginPage=2";
//		 	String url = "http://www.baidu.com";
	        CloseableHttpClient httpClient=HttpClients.createDefault(); // 创建httpClient实例
	        HttpGet httpGet=new HttpGet(url); // 创建httpget实例
	        
//	        https://s.1688.com/selloffer/rpc_async_render.jsonp?keywords=%C7%A2%C7%A2&asyncCount=0&beginPage=2&offset=0#beginPage=1
	        
	        ProxyCralwerUnusedVPN proxyCrawler = new ProxyCralwerUnusedVPN();
	        /**
	         * 想要获取的代理IP个数，由需求方自行指定。（如果个数太多，将导致返回变慢）
	         */
	        String de = proxyCrawler.startCrawler(1);
	        
	        Map<String, String> Parameters =  JSON.parseObject(de,new TypeReference<Map<String, String>>(){} );
	        
	        Map<String, String> dataStr =  JSON.parseObject(Parameters.get("data"),new TypeReference<Map<String, String>>(){} );
	        
	        List<String> Param = JSON.parseArray(dataStr.get("proxy"),String.class);
	        if(!Param.isEmpty()){
	        	Map<String, String> proxyData =  JSON.parseObject(Param.get(0),new TypeReference<Map<String, String>>(){} );
	        	String ip = proxyData.get("ip");
	        	String port = proxyData.get("port");
	        	System.out.println("IP 地址是："+ip+",端口号是："+port);
		        HttpHost proxy=new HttpHost(ip, Integer.parseInt(port), "https");
		        
//		        RequestConfig requestConfig=RequestConfig.custom().setProxy(proxy).build();
		        RequestConfig requestConfig=RequestConfig.custom().build();
		        
		        httpGet.setConfig(requestConfig);
		        httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:50.0) Gecko/20100101 Firefox/50.0");
		        CloseableHttpResponse response=httpClient.execute(httpGet); // 执行http get请求
		        HttpEntity entity=response.getEntity(); // 获取返回实体
		        System.out.println("网页内容："+EntityUtils.toString(entity, "utf-8")); // 获取网页内容
		        response.close(); // response关闭
		    }
	        httpClient.close(); // httpClient关闭
		 }
}
