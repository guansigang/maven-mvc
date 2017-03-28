package com.guan.base.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

/**
 * @类名名称	PageResult 								<br/>
 * @功能说明	分页信息实体泛型类							<br/>
 * @创建原因	在statement对象发出之前拦截,				<br/>
 * 			用于在组装分页SQL过程保存和提供相应的信息,	<br/>
 * 			也可以当做普通分页封装模型适用				<br/>
 * @author 	Canbell
 * @version V1.0.0
 * @date 2015-1-13 10:28:47
 * @since JDK 1.6
 */
public class PageResult<T> {
	private int pageNow;			//	页码
	private int pageSize = 10;		//	每页显示记录数, 默认10条
	private int totalRecord;		//	总记录数
	private int totalPage;			//	总页数
	private String startDate;		//	开始时间
	private String endDate;			//	结束时间
	private List<T> resultList;		//	当前页模型记录
	private Map<String, String> parameters = new HashMap<String, String>();	//	传递参数信息

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNo) {
		this.pageNow = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		int totalPage = 0;
		if (pageSize != 0) {
			totalPage = totalRecord % pageSize == 0 ? totalRecord / pageSize : totalRecord / pageSize + 1;
		}
		this.setTotalPage(totalPage);
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate + " 00:00:00";
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate + " 23:59:59";
	}

	public List<T> getResultList() {
		return resultList;
	}

	public void setResultList(List<T> results) {
		this.resultList = results;
	}

	public Map<String, String> getParameters() {
		return parameters;
	}

	public void setParameters(Map<String, String> parameters) {
		this.parameters = parameters;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder	.append("PageInfo [\n pageNow = ")
				.append(pageNow)
				.append(",\n pageSize = ")
				.append(pageSize)
				.append(",\n totalPage = ")
				.append(totalPage)
				.append(",\n totalRecord = ")
				.append(totalRecord)
				.append(",\n resultList = [\n");
		if (resultList != null && !resultList.isEmpty()) {
			for (T t : resultList) {
				builder .append("(t")
				.append(t)
				.append("), \n");
			}
		}
		builder	.append("] \n");
		builder	.append("parameters = [\n");
		if (parameters != null && !parameters.isEmpty()) {
			for (Map.Entry<String, String> entry : parameters.entrySet()) {
				builder	.append("(paramkey= ")
				.append(entry.getKey())
				.append(", paramvalue= ")
				.append(entry.getValue())
				.append("), \n");
			}
		}
		builder	.append("]");
		return builder.toString();
	}
	
	public String toEasyUiJson() {
		String result = "{\"pages\":\"";
		result += totalPage;
		result += "\",\"from\":\"";
		result += (pageNow - 1) * pageSize + 1;
		result += "\",\"to\":\"";
		result += (pageNow == totalPage ? totalRecord : pageNow * pageSize);
		result += "\",\"total\":\"";
		result += totalRecord;
		result += "\",\"rows\":";
		result += JSON.toJSONString(resultList);
		result += "}";
		return result;
	}
}
