package com.quickd.sys.controller;


import com.quickd.core.common.Const;
import com.quickd.core.common.JsonResult;
import com.quickd.core.controller.BaseController;
import com.quickd.sys.dto.NoticeDto;
import com.quickd.sys.entity.Notice;
import com.quickd.sys.service.INoticeService;
import com.quickd.core.util.ConvertUtils;
import com.quickd.sys.jwt.JwtUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * <p>
 * 系统通告表 前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/notice")
@Api(tags="系统通告管理")
public class NoticeController extends BaseController<INoticeService, Notice,NoticeDto> {

    /**
     *	 更新发布操作
     * @param id
     * @return
     */
    @ApiOperation("更新发布通知操作")
    @RequestMapping(value = "/doReleaseData", method = RequestMethod.PUT)
    public JsonResult doReleaseData(@RequestParam(name="id",required=true) String id) {
        JsonResult result = new JsonResult();
        Notice notice =(Notice) baseService.getById(id);
        NoticeDto data = ConvertUtils.sourceToTarget(notice, getDClass());
        if(data==null) {
            result.error("未找到对应实体");
        }else {
            //发布中
            data.setSendStatus(Const.PUBLISHED_STATUS_1);
            data.setSendTime(new Date());
            data.setUpdateTime(new Date());
            String currentUserName = JwtUtil.getCurrentUser().getUsername();
            data.setSender(currentUserName);
            boolean ok = baseService.updateById(data);
            if(ok) {
                result.success();
            }
        }
        return result;
    }

    /**
     *	 更新撤销操作
     * @param id
     * @return
     */
    @ApiOperation("更新撤销通知操作")
    @RequestMapping(value = "/doReovkeData", method = RequestMethod.PUT)
    public JsonResult doReovkeData(@RequestParam(name="id",required=true) String id, HttpServletRequest request) {
        JsonResult result = new JsonResult();
        Notice notice =(Notice) baseService.getById(id);
        if(notice==null) {
            result.error("未找到对应实体");
        }else {
            //撤销发布
            notice.setSendStatus(Const.REVOKE_STATUS_2);
            notice.setCancelTime(new Date());
            boolean ok = baseService.updateById(notice);
            if(ok) {
                result.success();
            }
        }
        return result;
    }


}
