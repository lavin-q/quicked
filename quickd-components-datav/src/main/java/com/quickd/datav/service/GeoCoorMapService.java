package com.quickd.datav.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.quickd.datav.domain.GeoCoorMap;
import com.quickd.datav.utils.CommonResult;

public interface GeoCoorMapService {
	CommonResult saveGeoMap(GeoCoorMap entity);
	CommonResult batchSave(List<GeoCoorMap> items );
	CommonResult csvSave(MultipartFile file);
	CommonResult listAll();
	CommonResult listBy(Map<String, String> paras);
	List<GeoCoorMap> getBy(Map<String, String> paras);
	CommonResult delete(String id);
}
