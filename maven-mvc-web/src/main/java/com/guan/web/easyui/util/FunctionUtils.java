package com.guan.web.easyui.util;  
 
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.guan.base.utils.TimeUtil;
import com.guan.web.easyui.model.DaletouHisList;
 
public class FunctionUtils  
{  
    /**  
     * 爬虫搜索深度  
     */ 
    public static int depth = 0;
    
 
    /**  
     * 截取网页网页源文件的目标内容  
     *   
     * @param content  
     * @return  
     */ 
    public static List<DaletouHisList> getGoalContent(String content)  
    {  
    	System.out.println("开始");
    	System.out.println(content);
    	System.out.println("结束");
    	List<DaletouHisList> resultList = new ArrayList<DaletouHisList>();
    	
    	try {
			Parser parser = new Parser(content);
			NodeFilter filter = new NodeClassFilter(TableTag.class);
	    	NodeList list = parser.extractAllNodesThatMatch(filter);
	    	for (int i = 0; i < list.size(); i++) {
		    	TableTag table = (TableTag) list.elementAt(i);
		    	for(int j = 0 ; j < table.getRowCount(); j++) {
			    	TableRow row = table.getRow(j);
			    	TableColumn[] columns = row.getColumns();
			    	DaletouHisList daLeTou = new DaletouHisList();
			    	for (int k = 0; k < columns.length; k++) {
			    		String str = columns[k].toPlainTextString();
			    		if(k==0){
			    			daLeTou.setDaletou_no(str);
//			    			System.out.println("111111111111@"+str);
			    		}
		    			if(k==1){
		    				String date = str.substring(0, 10);
		    				daLeTou.setOpen_date(TimeUtil.strToDate(date));
//		    				System.out.println("22222222222@"+date);
		    				
		    				String weekdate = str.substring(11, 12);
		    				daLeTou.setWeek_date(weekdate);
//		    				System.out.println("333333333333@"+weekdate);
			    		}
		    			if(k==2){
		    				String[] fontNum = str.split("&nbsp;");
		    				for (int m = 0; m < fontNum.length; m++) {
		    					
		    					int result = Integer.parseInt(fontNum[m]);
		    					
		    					
		    					if(m==0){
		    						daLeTou.setFront_one(result);
		    					}else if(m==1){
		    						daLeTou.setFront_sec(result);
		    					}else if(m==2){
		    						daLeTou.setFront_third(result);
		    					}else if(m==3){
		    						daLeTou.setFront_four(result);
		    					}else if(m==4){
		    						daLeTou.setFront_five(result);
		    					}
//		    					System.out.print("4444444444@"+fontNum[m]+"   ");
		    				}
			    		}
		    			if(k==3){
		    				String[] backNum = str.split("&nbsp;");
		    				for (int m = 0; m < backNum.length; m++) {
		    					int result = Integer.parseInt(backNum[m]);
		    					if(m==0){
		    						daLeTou.setBack_one(result);
		    					}else if(m==1){
		    						daLeTou.setBack_sec(result);
		    					}
		    					
		    					
//		    					System.out.print("5555555555@"+backNum[m]+"   ");
		    				}
			    		}
		    			if(k==4){
		    				String allInMoney = str.replaceAll(",", "");
		    				if(allInMoney.contains("-")){
		    					daLeTou.setIn_all_money(new BigDecimal(0));
		    				}else{
		    					daLeTou.setIn_all_money(new BigDecimal(allInMoney));
		    				}
		    				
//		    				System.out.println("66666666666@"+allInMoney);
			    		}
		    			if(k==5){
		    				if(str.contains("-")){
		    					daLeTou.setFirst_num(0);
		    				}else{
		    					daLeTou.setFirst_num(Integer.parseInt(str));
		    				}
//		    				System.out.println("777777777777@"+str);
			    		}
		    			if(k==6){
		    				String firstMoney = str.replaceAll(",", "");
		    				if(firstMoney.contains("-")){
		    					daLeTou.setFirst_money(new BigDecimal(0));
		    				}else{
		    					daLeTou.setFirst_money(new BigDecimal(firstMoney));
		    				}
//		    				System.out.println("88888888888@"+firstMoney);
			    		}
		    			if(k==7){
		    				if(str.contains("-")){
		    					daLeTou.setSec_num(0);
		    				}else{
		    					daLeTou.setSec_num(Integer.parseInt(str));
		    				}
//		    				System.out.println("99999999999@"+str);
			    		}
		    			if(k==8){
		    				String secMoney = str.replaceAll(",", "");
		    				if(secMoney.contains("-")){
		    					daLeTou.setSec_money(new BigDecimal(0));
		    				}else{
		    					daLeTou.setSec_money(new BigDecimal(secMoney));
		    				}
//		    				System.out.println("1010101010@"+secMoney);
			    		}
		    			if(k==9){
		    				String allMoney = str.replaceAll("亿", "").replaceAll("万", "").replaceAll("元", "");
		    				if(str.contains("-")){
		    					daLeTou.setAll_money(new BigDecimal(0));
		    				}else{
		    					daLeTou.setAll_money(new BigDecimal(allMoney));
		    				}
//		    				System.out.println("@@@@@@@@@@"+allMoney);
			    		}
			    	}
			    	UUID uuid = UUID.randomUUID();
			    	String daletou_id = uuid.toString().replaceAll("-", "");
			    	daLeTou.setDaletou_id(daletou_id);
			    	
			    	resultList.add(daLeTou);
		    	}
	    	}
		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	return resultList;
    } 
 
} 