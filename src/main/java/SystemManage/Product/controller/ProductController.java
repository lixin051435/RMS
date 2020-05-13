package SystemManage.Product.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Product.entity.Product;
import SystemManage.Product.service.ProductService;
import cn.hutool.core.util.StrUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 产品Controller类
 *
 * @author Administrator
 */
@Controller
@RequestMapping("product")
public class ProductController {


    @Autowired
    private ProductService productService;

    @SysLog(value = "用户信息查看")
    @RequiresPermissions("product:list")
    @RequestMapping("/manager")
    public String manage() {
        return "data/data-product-list";
    }


    /**
     * 查询用户集合
     *
     * @param page
     * @param limit
     * @param s_product
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions("product:list")
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              Product s_product) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StrUtil.isNotBlank(s_product.getProductName())) {
            map.put("productName", s_product.getProductName());
        }
        List<Product> productList = productService.findProduct(map, page, limit);
        CommonPage<Product> productCommonPage = CommonPage.restPage(productList);
        return CommonResults.success(productCommonPage.getTotal().intValue(), productCommonPage.getList());
    }


}
