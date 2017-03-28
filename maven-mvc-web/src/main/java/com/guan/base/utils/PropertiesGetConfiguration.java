package com.guan.base.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @author guansigang
 * @Email guansigang@163.com
 * @description 加载src/main/resources目录下面的properties资源文件
 * @version 1.0
 * @date
 */
public class PropertiesGetConfiguration {

	private static final Logger logger = LoggerFactory.getLogger(PropertiesGetConfiguration.class);

	private static Hashtable<String, Properties> env = new Hashtable<String, Properties>();

	private static class Hold {
		private final static PropertiesGetConfiguration INSTANCE = new PropertiesGetConfiguration();
	}

	public static PropertiesGetConfiguration getInstance() {
		return Hold.INSTANCE;
	}

	/**
	 * 私有化构造方法, 创建对象不对外
	 */
	private PropertiesGetConfiguration() {}

	/**
	 * @Description		获取资源文件中的某个key对应的值
	 * @param 			pro 资源文件名, 不包含后缀properties
	 * @param 			key 资源文件键值
	 * @return 			Object 键对应的值
	 */
	public Object getValueByKey(String pro, String key) {
		if (env.get(pro) == null) {
			InputStream is = null;
			try {
				is = this.getClass().getResourceAsStream("/" + pro + ".properties");
				Properties p = new Properties();
				p.load(is);
				is.close();
				env.put(pro, p);
			} catch (IOException localIOException) {
				logger.error(localIOException.getMessage());
			}
		}
		return env.get(pro).getProperty(key);
	}
	
	/**
	 * @Description		获取资源文件中的所有键值
	 * @param 			pro 资源文件名, 不包含后缀properties
	 * @return			Map<Object, Object> 返回获取的键值map
	 */
	public Map<Object, Object> getPropertiesMap(String pro) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		if (env.get(pro) == null) {
			InputStream is = null;
			try {
				is = this.getClass().getResourceAsStream("/" + pro + ".properties");
				Properties p = new Properties();
				p.load(is);
				is.close();
				env.put(pro, p);
			} catch (IOException localIOException) {
				logger.error(localIOException.getMessage());
			}
		}
		Enumeration<?> en = env.get(pro).propertyNames();
		while (en.hasMoreElements()) {
			String key = (String) en.nextElement();
			String Property = env.get(pro).getProperty(key);
			map.put(key, Property);
		}
		return map;
	}


	public static void main(String[] args) {

		String val = (String) PropertiesGetConfiguration.getInstance().getValueByKey("properties/jdbc", "jdbc.mySQLUrlWrite");
		System.out.println(val);
		
		Map<Object, Object> map = PropertiesGetConfiguration.getInstance().getPropertiesMap("properties/jdbc");
//		System.out.println(map);
		for (Object object : map.keySet()) {
			System.out.println(object);
		}

	}
	
}
