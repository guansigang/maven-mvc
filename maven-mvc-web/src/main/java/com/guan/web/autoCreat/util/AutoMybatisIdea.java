package com.guan.web.autoCreat.util;

import org.apache.log4j.PropertyConfigurator;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 自动生成Mybatis对应的Mapper.xml, Bean和dao
 * @author Canbell 2015-5-11 23:55:29
 * @version V2.0
 *
 */
public class AutoMybatisIdea {

	private static Logger log;
	
	public static void main(String[] args) {
		PropertyConfigurator.configure(MyPath.getRealPath() + "/com/chens/web/auto/cfg/log.txt");
		try {
			auto(MyPath.getRealPath() + "/com/chens/web/auto/cfg/generator-config-idea.xml");
		} catch (Exception e) {
			e.printStackTrace();
			log.info("AutoMybatis Create Failed!");
		}
	}

	private static void auto(String configUrl) throws Exception {
		log = LoggerFactory.getLogger(AutoMybatisIdea.class);
		List<String> warnings = new ArrayList<>();
		File configFile = new File(configUrl);
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(true);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
		log.info("AutoMybatis Create Success!");
	}
}