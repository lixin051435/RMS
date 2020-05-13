package SystemManage.Common.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author linSir
 * @version V1.0
 * @Description: (用一句话描述该文件做什么)
 * @Date 2020/1/7 16:17
 */
@Slf4j
@Controller
@RequestMapping("api")
public class PageController {

    @RequestMapping(value = "/getPage")
    public ModelAndView getPage(ModelAndView modelAndView, @RequestParam("pageName") String pageName) {
        //返回请求参数中的结果视图
        modelAndView.setViewName(pageName);
        return modelAndView;
    }

}
