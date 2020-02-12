package com.quickd.datav.service;

import java.util.Map;

import org.springframework.data.domain.Page;

import com.quickd.datav.domain.Published;
import com.quickd.datav.domain.Template;
import com.quickd.datav.domain.Translation;
import com.quickd.datav.utils.CommonResult;

public interface TemplateService {
	CommonResult createNewTemplate(Translation translation);

	CommonResult getAllTemplates(Map<String,Object> map);

	CommonResult getTemplateById(String id);

	CommonResult deleteTemplateById(String id);

	CommonResult updateTemplateById(String id, String tp) throws Exception;
}
