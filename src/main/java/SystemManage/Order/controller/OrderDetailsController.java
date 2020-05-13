package SystemManage.Order.controller;

import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Order.entity.OrderDetails;
import SystemManage.Order.service.OrderDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 订单详情Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("/orderDetails")
public class OrderDetailsController {

    @Resource
    private OrderDetailsService orderDetailsService;

    /**
     * 查询订单详情
     *
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "0") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              @RequestParam(value = "orderId") Integer orderId) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("orderId", orderId);
        List<OrderDetails> orderDetailsList = orderDetailsService.findOrderDetails(map, page, limit);
        CommonPage<OrderDetails> orderDetailsCommonPage = CommonPage.restPage(orderDetailsList);
        return CommonResults.success(orderDetailsCommonPage.getTotal().intValue(), orderDetailsCommonPage.getList());
    }

    /**
     * 通过订单id获取订单总金额
     *
     * @param orderId
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/getTotalPrice")
    public String getTotalPrice(String orderId, HttpServletResponse response) throws Exception {
        float totalMoney = orderDetailsService.getTotalPriceByOrderId(Integer.parseInt(orderId));

        return null;
    }
}
