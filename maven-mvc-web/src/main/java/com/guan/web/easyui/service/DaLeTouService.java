package com.guan.web.easyui.service;

import java.util.List;

import com.guan.web.easyui.model.DaletouHisList;


public interface DaLeTouService{

	String batchAddDaLeTou() throws Exception;

	List<DaletouHisList> queryDaletouData();

}
