package com.quickd.datav.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.quickd.datav.domain.RawCSV;
import com.quickd.datav.utils.CommonResult;

public interface FileCSVService {

	CommonResult uploadFileCSV(MultipartFile file) throws IOException;

	CommonResult getCSVList(Map<String, Object> map);

	CommonResult viewCSVByHash(String hash);
	
	CommonResult deleteCSVByHash(String hash);
	
	CommonResult saveCSVTitle(String hash, RawCSV rawCSV);
	
	CommonResult updateCSVData(String hash, MultipartFile file) throws IOException;

	CommonResult getTitleList();
	
	CommonResult cancelCSV(String hash);

        String getJsonApiData(String groups,String values,String type,String suuid,String source);
}
