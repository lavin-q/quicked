package com.quickd.datav.service;

import com.quickd.datav.domain.Dashboard;
import com.quickd.datav.domain.Published;
import com.quickd.datav.domain.Translation;
import com.quickd.datav.utils.CommonResult;

import java.io.IOException;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

public interface DashboardService {

	/**
	 * @param id
	 * @param map
	 * @return
	 */
	CommonResult getAllDashboard(String id, Map<String, Object> map);
	/**
	 * @param id
	 * @return
	 */
	CommonResult getDashboardById(String id);

	/**
	 * @param id
	 * @param ts
	 * @return
	 */
	CommonResult createNewDashboard(String id, Translation ts);

	/**
	 * @param id
	 * @return
	 */
	CommonResult deleteDashboardByHash(String id);

	/**
	 * @param id
	 * @param option
	 * @return
	 */
	CommonResult publishDashboardById(String id, Object option);

	/**
	 * @param id
	 * @return
	 */
	CommonResult getPublishedById(String id);

	/**
	 * @param id
	 * @param db
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	CommonResult updateDashboardById(String id, String db) throws IOException, Exception;

	/**
	 * @param id
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	CommonResult uploadImage(String id, MultipartFile file) throws IllegalStateException, IOException;

	/**
	 * @param id
	 * @return
	 * @throws IOException
	 */
	CommonResult downloadDashboardById(String id) throws IOException;

	/**
	 * @param key
	 * @param id
	 * @return
	 */
	CommonResult moveDashboardById(String key, String id);
}
