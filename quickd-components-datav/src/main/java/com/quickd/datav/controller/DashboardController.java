package com.quickd.datav.controller;

import java.io.IOException;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.quickd.datav.domain.Translation;
import com.quickd.datav.service.DashboardService;
import com.quickd.datav.utils.CommonResult;

@RestController
public class DashboardController {

	@Autowired
	private DashboardService dashboardService;

	@RequestMapping(path = "/user/{id}/dashboards", method = RequestMethod.GET)
	public CommonResult getAllDashboard(@PathVariable String id, @RequestParam Map<String,Object> map){
		return dashboardService.getAllDashboard(id,map);
	}
	@RequestMapping(path = "/user/{id}/dashboards", method = RequestMethod.POST)
	public CommonResult createNewDashboard(@PathVariable String id, @Valid @RequestBody Translation ts) {
		return dashboardService.createNewDashboard(id, ts);
	}

	@RequestMapping(path = "/dashboards/{id}", method = RequestMethod.GET)
	public CommonResult getDashboardById(@PathVariable String id){
		return dashboardService.getDashboardById(id);
	}
	
	@RequestMapping(path = "/dashboards/{id}", method = RequestMethod.DELETE)
	public CommonResult deleteDashboardByHash(@PathVariable String id) {
		return dashboardService.deleteDashboardByHash(id);
	}
	
	@RequestMapping(path = "/dashboards/{id}", method = RequestMethod.PUT)
	public CommonResult updateDashboardById(@PathVariable String id, @RequestBody String db) throws Exception {
		return dashboardService.updateDashboardById(id, db);
	}
	
	@RequestMapping(path = "/publish/{id}", method = RequestMethod.POST)
	public CommonResult publishDashboardById(@PathVariable String id, @RequestBody Object option){
		return dashboardService.publishDashboardById(id, option);
	}
	
	@RequestMapping(path= "/publish/{id}", method = RequestMethod.GET)
	public CommonResult getPublishedById(@PathVariable String id) {
		return dashboardService.getPublishedById(id);
	}
	
	@RequestMapping(path= "/upload/image/{id}", method = RequestMethod.POST)
	public CommonResult uploadImage(@PathVariable String id, @RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
		return dashboardService.uploadImage(id, file);
	}
	@RequestMapping(path = "/download/dashboards/{id}", method = RequestMethod.GET)
	public CommonResult downloadDashboardById(@PathVariable String id)throws IOException {
		return dashboardService.downloadDashboardById(id);
	}
	
	@RequestMapping(path = "/projects/{key}/dashboards/{id}", method = RequestMethod.PUT)
	public CommonResult moveDashboardById(@PathVariable String key ,@PathVariable String id){
		return dashboardService.moveDashboardById(key, id);
	}
}
