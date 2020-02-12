package com.quickd.datav.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quickd.datav.domain.Translation;
import com.quickd.datav.service.TemplateService;
import com.quickd.datav.utils.CommonResult;

@RestController
public class TemplateController {
	
	@Autowired
	private TemplateService templateService;
	
	@RequestMapping(path = "/templates", method = RequestMethod.GET)
	public CommonResult getAllTemplates(@RequestParam Map<String,Object> map){
		return templateService.getAllTemplates(map);
	}
	
	@RequestMapping(path = "/templates/{id}", method = RequestMethod.GET)
	public CommonResult getTemplateById(@PathVariable String id) {
		return templateService.getTemplateById(id);
	}
	
	@RequestMapping(path = "/templates", method = RequestMethod.POST)
	public CommonResult  createNewTemplate(@RequestBody Translation translation) {
		return templateService.createNewTemplate(translation);
	}
	
	@RequestMapping(path ="/templates/{id}", method = RequestMethod.PUT)
	public CommonResult updateTemplateById(@PathVariable String id, @RequestBody String template) throws Exception {
		return templateService.updateTemplateById(id, template);
	}
	
	@RequestMapping(path = "/templates/{id}", method = RequestMethod.DELETE)
	public CommonResult deleteTemplateById(@PathVariable String id) {
		return templateService.deleteTemplateById(id);
	}
}
