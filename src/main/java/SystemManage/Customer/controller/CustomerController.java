package SystemManage.Customer.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.dto.EchartsDto;
import SystemManage.Common.dto.FindCustomerFwDto;
import SystemManage.Common.dto.FindCustomerGcDto;
import SystemManage.Common.entity.DateUtil;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.Customer.entity.Customer;
import SystemManage.Customer.entity.CustomerFw;
import SystemManage.Customer.entity.CustomerGc;
import SystemManage.Customer.entity.CustomerGx;
import SystemManage.Customer.service.CustomerService;
import cn.hutool.core.util.StrUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("customer")
public class CustomerController {

    @Resource
    private CustomerService customerService;


    @SysLog("客户信息列表")
    @RequiresPermissions("customer:list")
    @RequestMapping("/manager")
    public String custmoer() {

        return "client/client-manager-list";
    }

    /**
     * 查询客户集合
     *
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions("customer:list")
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", required = false) Integer page,
                              @RequestParam(value = "limit", required = false) Integer limit) {
        List<Customer> customer = customerService.findCustomer(null, page, limit);
        CommonPage<Customer> customerCommonPage = CommonPage.restPage(customer);
        return CommonResults.success(customerCommonPage.getTotal().intValue(), customerCommonPage.getList());
    }


    @RequiresPermissions("customer:linkman")
    @RequestMapping("/linkman")
    public String linkman(@RequestParam("id") Integer id, HttpSession session, ModelMap modelMap) {
        Customer customer = customerService.findById(id);
        session.setAttribute("id", customer.getId());
        modelMap.addAttribute("customer", customer);
        return "client/client-link-show";
    }

    @SysLog("查看交往记录")
    @RequiresPermissions("customer:contact")
    @RequestMapping("/contact")
    public String contact(@RequestParam("id") Integer id, HttpSession session, ModelMap modelMap) {
        Customer customer = customerService.findById(id);
        session.setAttribute("id", customer.getId());
        modelMap.addAttribute("customer", customer);
        return "client/client-contact-show";
    }

    @SysLog("查看历史订单")
    @RequiresPermissions("customer:order")
    @RequestMapping("/order")
    public String order(@RequestParam("id") Integer id, HttpSession session, ModelMap modelMap) {
        Customer customer = customerService.findById(id);
        session.setAttribute("id", customer.getId());
        modelMap.addAttribute("customer", customer);
        return "order/client-order-show";
    }

    @SysLog("客户更新")
    @RequiresPermissions("customer:editDo")
    @RequestMapping("/edit")
    public String edit(@RequestParam("id") Integer id, ModelMap modelMap) {
        modelMap.addAttribute("customer", customerService.findById(id));
        return "client/client-edit-add";
    }

    @RequiresPermissions("customer:editDo")
    @ResponseBody
    @RequestMapping("/editDo")
    public CommonResults edit(@RequestBody Customer customer) {
        try {
            int addCustomer = customerService.updateCustomer(customer);
            return addCustomer == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }


    @ResponseBody
    @RequestMapping("/findUserByFuzzyUserName")
    public CommonResults findUserByFuzzyUserName(@RequestParam(value = "page", required = false) Integer page,
                                                 @RequestParam(value = "limit", required = false) Integer limit,
                                                 Customer customer) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("khno", customer.getKhno());
        map.put("name", customer.getName());
        List<Customer> datas = customerService.findCustomer(map, page, limit);
        CommonPage<Customer> customerCommonPage = CommonPage.restPage(datas);
        return CommonResults.success(customerCommonPage.getTotal().intValue(), customerCommonPage.getList());
    }


    @RequestMapping("/add")
    @RequiresPermissions("customer:save")
    public String add(ModelMap modelMap) {
        modelMap.addAttribute("customer", new Customer());
        return "client/client-edit-add";
    }

    /**
     * 添加客户
     *
     * @param customer
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:save")
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults save(@RequestBody Customer customer) throws Exception {
        try {
            customer.setKhno("KH" + DateUtil.getCurrentDateStr());
            int addCustomer = customerService.addCustomer(customer);
            return addCustomer == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 删除销售机会
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:delete")
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") Integer id) throws Exception {
        try {
            int deleteCustomer = customerService.deleteCustomer(id);
            return deleteCustomer == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
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

        return null;
    }


    @RequiresPermissions("customer:clientGX")
    @SysLog("客户贡献分析")
    @RequestMapping("/clientGX")
    public String clientGX() {
        return "statistics/devote-client";
    }

    @RequiresPermissions("customer:clientLoss")
    @SysLog("客户流失分析")
    @RequestMapping("/clientLoss")
    public String clientLoss() {
        return "statistics/client-liushi";
    }

    @RequiresPermissions("customer:clienGc")
    @SysLog("客户构成分析")
    @RequestMapping("/clienGc")
    public String clienGc() {
        return "statistics/gc-echarts";
    }


    @RequiresPermissions("customer:clienFw")
    @SysLog("客户服务分析")
    @RequestMapping("/clienFw")
    public String clienFw() {
        return "statistics/fw-echarts";
    }
    /**
     * 查询客户分析
     *
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:clientGX")
    @ResponseBody
    @RequestMapping("/findCutomerGx")
    public CommonResults findCutomerGx(@RequestParam(value = "name", required = false) String name,
                                       @RequestParam(value = "page", required = false) Integer page,
                                       @RequestParam(value = "limit", required = false) Integer limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StrUtil.isNotBlank(name)) {
            map.put("name", name);
        }
        List<CustomerGx> customerGxList = customerService.findCutomerGx(map, page, limit);
        CommonPage<CustomerGx> customerGxCommonPage = CommonPage.restPage(customerGxList);
        return CommonResults.success(customerGxCommonPage.getTotal().intValue(), customerGxCommonPage.getList());
    }

    /**
     * 查询客户构成
     *
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:clienGc")
    @ResponseBody
    @RequestMapping("/findCutomerGc")
    public CommonResults findCustomerGc() throws Exception {
        List<CustomerGc> customerGcList = customerService.findCustomerGc();
        FindCustomerGcDto dto = new FindCustomerGcDto();
        for (int i = 0; i < customerGcList.size(); i++) {
            dto.getCustomerLevel().add(customerGcList.get(i).getCustomerLevel());
            dto.getCustomerNum().add(customerGcList.get(i).getCustomerNum());
        }
        return CommonResults.success(dto);
    }

    /**
     * 查询客户服务
     *
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:clienFw")
    @ResponseBody
    @RequestMapping("/findCutomerFw")
    public CommonResults findCustomerFw() throws Exception {
        List<CustomerFw> customerFwList = customerService.findCustomerFw();
        FindCustomerFwDto fwDto = new FindCustomerFwDto();
        for (int i = 0; i < customerFwList.size(); i++) {
            //封装类型
            fwDto.getServeType().add(customerFwList.get(i).getServeType());
            fwDto.getCustomerFw().add(customerFwList.get(i));
        }
        for (int i = 0; i < fwDto.getCustomerFw().size(); i++) {
            fwDto.getEchartsDto().add(new EchartsDto(fwDto.getCustomerFw().get(i).getNum(), fwDto.getCustomerFw().get(i).getServeType()));
        }
        return CommonResults.success(fwDto);
    }


}
