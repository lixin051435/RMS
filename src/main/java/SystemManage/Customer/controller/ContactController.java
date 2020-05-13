package SystemManage.Customer.controller;

import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.Customer.entity.Contact;
import SystemManage.Customer.entity.Customer;
import SystemManage.Customer.service.ContactService;
import SystemManage.Customer.service.CustomerService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 交往记录Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/contact")
public class ContactController {

    @Resource
    private ContactService contactService;

    @Autowired
    private CustomerService customerService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
    }

    /**
     * 查询交往记录集合
     *
     * @param cusId
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:contact")
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "cusId") String cusId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cusId", cusId);
        List<Contact> contactList = contactService.findContact(map);
        return CommonResults.success(contactList.size(), contactList);
    }

    /**
     * 添加交往记录
     *
     * @param contact
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults save(@RequestBody Contact contact) throws Exception {
        try {
            Customer customer = new Customer();
            customer.setId(contact.getId());
            contact.setCustomer(customer);
            int addContact = contactService.addContact(contact);
            return addContact == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @RequestMapping("/contactPage")
    public String contactPage(ModelMap modelMap, @RequestParam("id") Integer id) {
        Customer customer = customerService.findById(id);
        modelMap.addAttribute("customer", customer);
        modelMap.addAttribute("contact", new Contact());
        return "client/contact";
    }

    /**
     * 删除交往记录
     *
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") String id) {
        try {
            int deleteContact = contactService.deleteContact(Integer.parseInt(id));
            return deleteContact == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }
}
