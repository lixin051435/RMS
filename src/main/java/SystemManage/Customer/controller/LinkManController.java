package SystemManage.Customer.controller;

import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.Customer.entity.Customer;
import SystemManage.Customer.entity.LinkMan;
import SystemManage.Customer.service.CustomerService;
import SystemManage.Customer.service.LinkManService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 联系人Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("linkMan")
public class LinkManController {

    @Resource
    private LinkManService linkManService;
    @Autowired
    private CustomerService customerService;

    /**
     * 查询联系人集合
     *
     * @param cusId
     * @param response
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:linkman")
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "cusId") String cusId, HttpServletResponse response) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cusId", cusId);
        List<LinkMan> linkManList = linkManService.findLinkMan(map);
        return linkManList.isEmpty() ? CommonResults.failure() : CommonResults.success(linkManList.size(), linkManList);
    }

    /**
     * 添加联系人
     *
     * @param linkMan
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults save(@RequestBody LinkMan linkMan) {
        Customer customer = new Customer();
        customer.setId(linkMan.getId());
        linkMan.setCustomer(customer);
        try {
            int addLinkMan = linkManService.addLinkMan(linkMan);
            return addLinkMan == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 删除联系人
     *
     * @param id
     * @param response
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") String id, HttpServletResponse response) throws Exception {
        try {
            int deleteLinkMan = linkManService.deleteLinkMan(Integer.parseInt(id));
            return deleteLinkMan == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }

    }


    @RequestMapping("/linkManPage")
    public String linkMan(ModelMap modelMap, @RequestParam("id") Integer id) {
        Customer customer = customerService.findById(id);
        modelMap.addAttribute("customer", customer);
        modelMap.addAttribute("linkMan", new LinkMan());
        return "client/linkman";
    }
}
