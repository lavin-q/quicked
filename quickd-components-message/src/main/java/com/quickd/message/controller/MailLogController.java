
package com.quickd.message.controller;

import com.quickd.core.controller.BaseController;
import com.quickd.message.entity.SysMailLogEntity;
import com.quickd.message.dto.SysMailLogDTO;
import com.quickd.message.service.SysMailLogService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.*;


/**
 * 邮件发送记录
 *
 * @author Mark sunlightcs@gmail.com
 */
@RestController
@RequestMapping("sys/maillog")
@Api(tags="邮件发送记录")
public class MailLogController extends BaseController<SysMailLogService, SysMailLogEntity, SysMailLogDTO> {

}