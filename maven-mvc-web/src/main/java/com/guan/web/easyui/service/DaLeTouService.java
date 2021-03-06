package com.guan.web.easyui.service;

import com.guan.base.base.PageResult;
import com.guan.web.easyui.model.DaletouHisList;


public interface DaLeTouService{

	String batchAddDaLeTou() throws Exception;

	PageResult<DaletouHisList> queryDaletouData(PageResult<DaletouHisList> pageResult);

	PageResult<DaletouHisList> createDaletouData(PageResult<DaletouHisList> pageResult);

}
