package com.quickd.sys.aspect;
import com.alibaba.fastjson.JSONObject;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.quickd.core.annotation.DictAno;
import com.quickd.core.common.JsonResult;
import com.quickd.core.common.PageUtils;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.quickd.sys.service.IDictService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @project: jeedcp
 * @description: 字典aop类
 * @author: caochaofeng
 * @create: 2019-08-16 19:20
 */
@Aspect
@Component
@Slf4j
public class DictAspect {
    @Autowired
    private IDictService dictService;
    // 定义切点Pointcut
    @Pointcut("execution(public * com.jeedcp.*.*.*Controller.*(..))")
    public void excudeService() {
    }

    @Around("excudeService()")
    public Object doAround(ProceedingJoinPoint pjp) throws Throwable {
        long time1=System.currentTimeMillis();
        Object result = pjp.proceed();
        long time2=System.currentTimeMillis();
        log.debug("获取JSON数据 耗时："+(time2-time1)+"ms");
        long start=System.currentTimeMillis();
        parseDictText(result);
        long end=System.currentTimeMillis();
        log.debug("解析注入JSON数据  耗时"+(end-start)+"ms");
        return result;
    }

    /**
     * 本方法针对返回对象为Result 的IPage的分页列表数据进行动态字典注入
     * 字典注入实现 通过对实体类添加注解@dict 来标识需要的字典内容,字典分为单字典code即可 ，table字典 code table text配合使用与原来jeecg的用法相同
     * 示例为SysUser   字段为sex 添加了注解@Dict(dicCode = "sex") 会在字典服务立马查出来对应的text 然后在请求list的时候将这个字典text，已字段名称加_dictText形式返回到前端
     * 例输入当前返回值的就会多出一个sex_dictText字段
     * {
     *      sex:1,
     *      sex_dictText:"男"
     * }
     * 前端直接取值sext_dictText在table里面无需再进行前端的字典转换了
     *  customRender:function (text) {
     *               if(text==1){
     *                 return "男";
     *               }else if(text==2){
     *                 return "女";
     *               }else{
     *                 return text;
     *               }
     *             }
     *             目前vue是这么进行字典渲染到table上的多了就很麻烦了 这个直接在服务端渲染完成前端可以直接用
     * @param result
     */
    private void parseDictText(Object result) {
        if (result instanceof JsonResult) {
            if (((JsonResult) result).getData() instanceof PageUtils) {
                List<JSONObject> items = new ArrayList<>();
                for (Object record : ((PageUtils) ((JsonResult) result).getData()).getList()) {
                    ObjectMapper mapper = new ObjectMapper();
                    String json="{}";
                    try {
                        //解决@JsonFormat注解解析不了的问题详见SysAnnouncement类的@JsonFormat
                        json = mapper.writeValueAsString(record);
                    } catch (JsonProcessingException e) {
                        log.error("json解析失败"+e.getMessage());
                        e.printStackTrace();
                    }
                    JSONObject item = JSONObject.parseObject(json);
                    for (Field field : record.getClass().getDeclaredFields()) {
                        if (field.getAnnotation(DictAno.class) != null) {
                            String code = field.getAnnotation(DictAno.class).dicCode();
                            String text = field.getAnnotation(DictAno.class).dicText();
                            String table = field.getAnnotation(DictAno.class).dictTable();
                            String key = String.valueOf(item.get(field.getName()));
                            String textValue=null;
                            if (!StringUtils.isEmpty(table)){
                                textValue= dictService.queryTableDictTextByKey(table,text,code,key);
                            }else {
                                System.out.println(code);
                                textValue = dictService.queryDictTextByKey(code, key);
                            }
                            item.put(field.getName() + "_dictText", textValue);
                        }
                        //date类型默认转换string格式化日期
                        if (field.getType().getName().equals("java.util.Date")&&field.getAnnotation(JsonFormat.class)==null&&item.get(field.getName())!=null){
                            SimpleDateFormat aDate=new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
                            item.put(field.getName(), aDate.format(new Date((Long) item.get(field.getName()))));
                        }
                    }
                    items.add(item);
                }
                ((PageUtils) ((JsonResult) result).getData()).setList(items);
            }

        }
    }

}