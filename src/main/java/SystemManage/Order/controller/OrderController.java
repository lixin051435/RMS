package SystemManage.Order.controller;

import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Customer.service.CustomerService;
import SystemManage.Order.entity.Order;
import SystemManage.Order.service.OrderDetailsService;
import SystemManage.Order.service.OrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private OrderService orderService;

    @Autowired
    private CustomerService customerService;

    @Resource
    private OrderDetailsService orderDetailsService;
    /**
     * 查询订单集合
     *
     * @param page
     * @return
     * @throws Exception
     */
    @RequiresPermissions("customer:order")
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              @RequestParam(value = "cusId", required = false) Integer cusId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("cusId", cusId);
        List<Order> orderList = orderService.findOrder(map, page, limit);
        CommonPage<Order> commonPage = CommonPage.restPage(orderList);
        return CommonResults.success(commonPage.getTotal().intValue(), commonPage.getList());
    }


    /**
     * 通过id查找实体
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public String findById(@RequestParam(value = "id") Integer id) throws Exception {
        Order order = orderService.findById(id);

        return null;
    }

    @RequestMapping("/orderDetails")
    public String orderDetails(@RequestParam("id") Integer id, ModelMap modelMap, HttpSession session) {
        Order order = orderService.findById(id);
        float totalPriceByOrderId = orderDetailsService.getTotalPriceByOrderId(id);
        modelMap.addAttribute("order",order);
        modelMap.addAttribute("totalPriceByOrderId",totalPriceByOrderId);
        return "order/order-details-show";
    }
}
