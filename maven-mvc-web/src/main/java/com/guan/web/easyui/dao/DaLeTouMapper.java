package com.guan.web.easyui.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.guan.web.easyui.model.DaletouHisList;
@Repository("daLeTouMapper")
public interface DaLeTouMapper {
	int insertDaLeTouBatch(List<DaletouHisList> reddemCodeList);
}
