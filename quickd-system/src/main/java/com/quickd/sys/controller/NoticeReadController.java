package com.quickd.sys.controller;


import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.quickd.core.common.Const;
import com.quickd.core.common.JsonResult;
import com.quickd.sys.dto.UserDto;
import com.quickd.sys.entity.NoticeRead;
import com.quickd.sys.jwt.JwtUtil;
import com.quickd.sys.service.INoticeReadService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import java.util.Date;

/**
 * <p>
 * 用户通告阅读标记表 前端控制器
 * </p>
 *
 * @author quickd
 * @since 2019-09-26
 */
@Controller
@RequestMapping("/sys/noticeRead")
public class NoticeReadController {
    @Autowired
    protected INoticeReadService noticeReadService;
    /**
     * @功能：更新用户系统消息阅读状态
     * @param anntId
     * @return
     */
    @PutMapping(value = "/setRead")
    @ApiOperation("更新用户系统消息阅读状态")
    public JsonResult<NoticeRead> setRead(String anntId) {
        JsonResult<NoticeRead> result = new JsonResult<NoticeRead>();
        UserDto sysUser = JwtUtil.getCurrentUser();
        String userId = sysUser.getId();
        LambdaUpdateWrapper<NoticeRead> updateWrapper = new UpdateWrapper().lambda();
        updateWrapper.set(NoticeRead::getReadFlag, Const.HAS_READ_FLAG);
        updateWrapper.set(NoticeRead::getReadTime, new Date());
        updateWrapper.last("where annt_id ='"+anntId+"' and user_id ='"+userId+"'");
        NoticeRead announcementSend = new NoticeRead();
        noticeReadService.update(announcementSend, updateWrapper);
        result.success();
        return result;
    }
}
