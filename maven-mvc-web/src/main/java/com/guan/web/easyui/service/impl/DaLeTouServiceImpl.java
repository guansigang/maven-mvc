package com.guan.web.easyui.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.guan.base.base.PageResult;
import com.guan.base.utils.TimeUtil;
import com.guan.web.easyui.dao.DaLeTouMapper;
import com.guan.web.easyui.model.DaletouHisList;
import com.guan.web.easyui.service.DaLeTouService;
import com.guan.web.easyui.util.FunctionUtils;

@Service("daLeTouService")
public class DaLeTouServiceImpl implements DaLeTouService {
	
	private static Logger logger = Logger.getLogger(DaLeTouServiceImpl.class);

	
	@Autowired
	private DaLeTouMapper daLeTouMapper;
	
	
	@Override
	public String batchAddDaLeTou() throws Exception {
		PageResult<DaletouHisList> pageResult = new PageResult<DaletouHisList>();
		List<DaletouHisList> daletous = this.daLeTouMapper.queryDaletouHisListByCondition(pageResult);
		DaletouHisList daletou = daletous.get(0);
		String url="http://chart.cp.360.cn/kaijiang/slt?lotId=120029&chartType=undefined&spanType=0&span=2000&r=0.3688061712477555#roll_132";  
		insertDaLeTouData(url,TimeUtil.strToDate(daletou.getOpen_date()));
		return null;
	}
	
	@Override
	public PageResult<DaletouHisList> queryDaletouData(PageResult<DaletouHisList> pageResult) {
		pageResult.setResultList(this.daLeTouMapper.queryDaletouHisListByCondition(pageResult));
		pageResult.setTotalRecord(this.daLeTouMapper.queryDaletouHisListCount(pageResult));
		return pageResult;
	}  
	
	public String insertDaLeTouData(String url, Date date) throws Exception{
		        
		      List<DaletouHisList> resultList = getContentFormUrl(url,date);
		      daLeTouMapper.insertDaLeTouBatch(resultList);
		
		return null;
	}
	
	
	 /**  
     * 根据URL抓取网页内容  
     *   
     * @param url  
	 * @param date 
     * @return  
     */ 
    public static List<DaletouHisList> getContentFormUrl(String url, Date date) throws Exception 
    { 
        /* 实例化一个HttpClient客户端 */ 
   	 CloseableHttpClient client = HttpClients.createDefault();
        HttpGet getHttp = new HttpGet(url);
        List<DaletouHisList> resultList = new ArrayList<DaletouHisList>();
  
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
                resultList = FunctionUtils.getGoalContent(content,date);
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
				logger.error(e.getMessage());
				e.printStackTrace();
			}  
        }  
          
        return resultList;  
    }
}
