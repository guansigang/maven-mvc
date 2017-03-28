package com.guan.base.system;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 * 类名名称: BaseController <br/>
 * 功能说明: 获取页面参数, 自定义判断和封装数据<br/>
 * 创建原因: 用于在页面和后台控制层传递过程中保存和提供相应的信息<br/>
 * @author Canbell
 * @version V1.0
 * @date 2014-5-8 9:23:45
 * @since JDK 1.6
 */
public class BaseController {
	
	/**
	 *@Description: 获取页面所有参数
	 *@param model
	 *@return Map<String,Object>
	 */
	protected Map<String, String> getParams(Model model) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Map<String, String[]> params = request.getParameterMap();
		if (params != null && params.size() > 0) {
			Map<String, String> nativeMap = new LinkedHashMap<String, String>();
			for (String key : params.keySet()) {
				nativeMap.put(key, StringUtils.isBlank(request.getParameter(key)) ? "" : request.getParameter(key).trim());
				if (model != null)
					model.addAttribute(key,StringUtils.isBlank(request.getParameter(key)) ? "" : request.getParameter(key).trim());
			}
			return nativeMap.size() == 0 ? null : nativeMap;
		}
		return new HashMap<String, String>();
	}
	
 
}
