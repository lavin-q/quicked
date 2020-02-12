package com.quickd.sys.controller;


import com.quickd.sys.dto.DictItemDto;
import com.quickd.sys.entity.DictItem;
import com.quickd.sys.service.IDictItemService;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import com.quickd.core.controller.BaseController;
/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author caochaofeng
 * @since 2019-08-16
 */
@Controller
@RequestMapping("/sys/dictItem")
@Api(tags="字典项管理")
public class DictItemController extends BaseController<IDictItemService,DictItem,DictItemDto> {

}
