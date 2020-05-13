package SystemManage.Customer.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.Customer.entity.CustomerService;
import SystemManage.Customer.service.CustomerServiceService;
import cn.hutool.core.util.StrUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户服务Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("customerService")
public class CustomerServiceController {

    @Resource
    private CustomerServiceService customerServiceService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        //true:允许输入空值，false:不能为空值
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


    @SysLog("服务创建")
    @RequiresPermissions("customerService:serviceCreate")
    @RequestMapping("/serviceCreate")
    public String serviceCreate() {
        return "service/service-add";
    }


    @SysLog("服务分配")
    @RequiresPermissions("customerService:serviceFenPei")
    @RequestMapping("/serviceFenPei")
    public String serviceFenPei() {
        return "service/service-fenpei";
    }

    @SysLog("服务反馈")
    @RequiresPermissions("customerService:serviceFeedback")
    @RequestMapping("/serviceFeedback")
    public String serviceFeedback() {
        return "service/service-feedback";
    }


    @SysLog("服务处理")
    @RequiresPermissions("customerService:serviceHandler")
    @RequestMapping("/serviceHandler")
    public String serviceHandler() {
        return "service/service-handler";
    }


    @SysLog("服务归档")
    @RequiresPermissions("customerService:serviceArchive")
    @RequestMapping("/serviceArchive")
    public String serviceArchive() {
        return "service/service-archive";
    }

    /**
     * 查询客户服务集合
     *
     * @param page
     * @return
     * @throws Exception
     */
    @RequiresPermissions(value = {"customerService:serviceFenPei",
            "customerService:serviceHandler",
            "customerService:serviceFeedback",
            "customerService:serviceArchive"})
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              CustomerService s_customerService,
                              @RequestParam(value = "createTimefrom", required = false) String createTimefrom,
                              @RequestParam(value = "createTimeto", required = false) String createTimeto) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("state", s_customerService.getState());
        if (StrUtil.isNotBlank(s_customerService.getCustomer())) {
            map.put("customer", s_customerService.getCustomer());
        }
        if (StrUtil.isNotBlank(s_customerService.getOverview())) {
            map.put("overview", s_customerService.getOverview());
        }
        if (StrUtil.isNotBlank(s_customerService.getServeType())) {
            map.put("serveType", s_customerService.getServeType());
        }
        if (StrUtil.isNotBlank(createTimefrom)) {
            map.put("createTimefrom", createTimefrom);
        } else if (StrUtil.isNotBlank(createTimeto)) {
            map.put("createTimeto", createTimeto);
        }
        List<CustomerService> datas = customerServiceService.findCustomerService(map, page, limit);
        CommonPage<CustomerService> customerServiceCommonPage = CommonPage.restPage(datas);
        return CommonResults.success(customerServiceCommonPage.getTotal().intValue(), customerServiceCommonPage.getList());
    }

    /**
     * 保存客户服务信息
     *
     * @param customerService
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customerService:serviceCreate")
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults save(@RequestBody CustomerService customerService) throws Exception {
        try {

            int addCustomerService = customerServiceService.addCustomerService(customerService);
            return addCustomerService == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @RequiresPermissions(value = {"customerService:fenpei",
            "customerService:feedbackUpdate", "customerService:archive"})
    @ResponseBody
    @RequestMapping("/update")
    public CommonResults update(@RequestBody CustomerService customerService) {
        try {
            customerService.setState("已分配");
            if (StrUtil.isNotBlank(customerService.getServiceProcePeople())) {
                customerService.setState("已处理");
            }
            if (StrUtil.isNotBlank(customerService.getServiceProceResult())) {
                customerService.setState("已归档");
            }
            int index = customerServiceService.updateCustomerService(customerService);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 删除客户服务
     *
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customerService:delete")
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") Integer id) throws Exception {
        try {
            int index = customerServiceService.deleteCustomerService(id);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @SysLog("服务分配")
    @RequiresPermissions("customerService:fenpei")
    @RequestMapping("/fenpei")
    public String fenpei(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("service", customerServiceService.findById(id));
        return "service/fenpei";
    }

    @SysLog("服务处理更新")
    @RequiresPermissions("customerService:fenpeiHandler")
    @RequestMapping("/handle")
    public String handelr(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("service", customerServiceService.findById(id));
        return "service/handle";
    }


    @SysLog("服务反馈更新")
    @RequiresPermissions("customerService:feedback")
    @RequestMapping("/feedback")
    public String feedback(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("service", customerServiceService.findById(id));
        return "service/feedback";
    }

    @SysLog("服务归档更新")
    @RequiresPermissions("customerService:archive")
    @RequestMapping("/archive")
    public String archive(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("service", customerServiceService.findById(id));
        return "service/archive";
    }

    /**
     * 通过id查找实体
     *
     * @param id
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public String findById(@RequestParam(value = "id") String id, HttpServletResponse response) throws Exception {
        CustomerService customerService = customerServiceService.findById(Integer.parseInt(id));

        return null;
    }
}
