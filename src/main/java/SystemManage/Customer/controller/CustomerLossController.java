package SystemManage.Customer.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.Customer.entity.CustomerLoss;
import SystemManage.Customer.service.CustomerLossService;
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
 * 客户流失Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("customerLoss")
public class CustomerLossController {

    @Resource
    private CustomerLossService customerLossService;


    @SysLog("客户流失管理")
    @RequiresPermissions("customerLoss:list")
    @RequestMapping("/manager")
    public String lossManger() {
        return "loss/client-loss-list";
    }


    @SysLog("客户流失添加")
    @RequiresPermissions("customerLoss:save")
    @RequestMapping("/add")
    public String lossAdd(ModelMap modelMap) {
        modelMap.addAttribute("customerLoss", new CustomerLoss());
        return "loss/loss-add";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
    }

    @RequiresPermissions("customerLoss:save")
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults lossClientAdd(@RequestBody CustomerLoss customerLoss) {
        try {
            int index = customerLossService.addCustomerLoss(customerLoss);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 查询客户流失集合
     *
     * @param page
     * @return
     * @throws Exception
     */
    @RequiresPermissions(value = {"customerLoss:list", "customer:clientLoss"})
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "limit", required = false) Integer limit,
                              @RequestParam(value = "state", required = false) Integer state) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (state != null) {
            map.put("state", state);
        }
        List<CustomerLoss> customerLoss = customerLossService.findCustomerLoss(map, page, limit);
        CommonPage<CustomerLoss> customerLossCommonPage = CommonPage.restPage(customerLoss);
        return CommonResults.success(customerLossCommonPage.getTotal().intValue(), customerLossCommonPage.getList());
    }


    @ResponseBody
    @RequestMapping("/findUserByFuzzyUserName")
    public CommonResults findUserByFuzzyUserName(@RequestParam(value = "page", required = false) Integer page,
                                                 @RequestParam(value = "limit", required = false) Integer limit,
                                                 CustomerLoss customerLoss) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cusName", customerLoss.getCusName());
        map.put("cusManager", customerLoss.getCusManager());
        map.put("state", customerLoss.getState());
        List<CustomerLoss> data = customerLossService.findCustomerLoss(map, page, limit);
        CommonPage<CustomerLoss> customerLossCommonPage = CommonPage.restPage(data);
        return CommonResults.success(customerLossCommonPage.getTotal().intValue(), customerLossCommonPage.getList());
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
        CustomerLoss customerLoss = customerLossService.findById(Integer.parseInt(id));

        return null;
    }

    /**
     * 确认客户流失
     *
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/confirmLoss")
    public String confirmLoss(int id, HttpServletResponse response) throws Exception {
        CustomerLoss customerLoss = new CustomerLoss();
        customerLoss.setId(id);
        customerLoss.setState(1); // 设置标识
        customerLossService.updateCustomerLoss(customerLoss);

        return null;
    }
}
