package SystemManage.SaleChance.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.SaleChance.entity.SaleChance;
import SystemManage.SaleChance.service.SaleChanceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 销售机会Controller类
 *
 * @author Administrator
 */
@Slf4j
@Controller
@RequestMapping("saleChances")
public class SaleChanceController {

    @Resource
    private SaleChanceService saleChanceService;


    @SysLog(value = "销售机会信息查看")
    @RequiresPermissions("saleChances:list")
    @RequestMapping("/manager")
    public String manage() {
        return "Sale/saleChanceList";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));   //true:允许输入空值，false:不能为空值
    }

    /**
     * 查询销售机会集合
     *
     * @param page
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions(value = "saleChances:list")
    @RequestMapping("/listPage")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              @RequestParam(value = "state", required = false) Integer state) {
        SaleChance saleChance = new SaleChance();
        saleChance.setState(state);
        //查询所有
        List<SaleChance> datas = saleChanceService.findSaleChance(saleChance, page, limit);
        //统一分页
        CommonPage<SaleChance> saleChanceCommonPage = CommonPage.restPage(datas);
        return CommonResults.success(saleChanceCommonPage.getTotal().intValue(), saleChanceCommonPage.getList());
    }

    /**
     * 添加销售机会
     *
     * @return
     * @throws Exception
     */
    @SysLog("添加销售机会")
    @RequiresPermissions("saleChances:add")
    @RequestMapping("/add")
    public String save(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("saleChance", new SaleChance());
        return "Sale/sale-edit-add";
    }

    @ResponseBody
    @RequiresPermissions("saleChances:add")
    @RequestMapping("/addSaleChance")
    public CommonResults add(@RequestBody SaleChance saleChance) {
        try {
            int index = saleChanceService.addSaleChance(saleChance);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("保存销售机会异常：{}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @ResponseBody
    @RequiresPermissions("saleChances:edit")
    @RequestMapping("/edit")
    public CommonResults edit(@RequestBody SaleChance saleChance) {
        try {

            int index = saleChanceService.updateSaleChance(saleChance);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("保存销售机会异常：{}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @SysLog("编辑销售")
    @RequiresPermissions("saleChances:edit")
    @RequestMapping("/addOrEdit")
    public String edit(ModelMap modelMap, @RequestParam("id") Integer id) {
        modelMap.addAttribute("saleChance", saleChanceService.findById(id));
        return "Sale/sale-edit-add";
    }

    @ResponseBody
    @RequestMapping("/findUserByFuzzyUserName")
    public CommonResults findUserByFuzzyUserName(SaleChance saleChance) {
        List<SaleChance> data = saleChanceService.findSaleChance(saleChance, 1, 10);
        //统一分页
        CommonPage<SaleChance> saleChanceCommonPage = CommonPage.restPage(data);
        return CommonResults.success(saleChanceCommonPage.getTotal().intValue(), saleChanceCommonPage.getList());
    }


    /**
     * 删除销售机会
     *
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions("saleChances:delete")
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") Integer id) {
        try {
            int deleteSaleChance = saleChanceService.deleteSaleChance(id);
            return deleteSaleChance == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("删除销售机会出现异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 修改客户开发状态
     *
     * @param id
     * @param devResult
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateSaleChanceDevResult")
    public String updateSaleChanceDevResult(@RequestParam(value = "id") String id, @RequestParam(value = "devResult") String devResult) throws Exception {

        return null;
    }

    /**
     * 通过id查找实体
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping("/findById")
    public String findById(@RequestParam(value = "id") String id) throws Exception {

        return null;
    }
}
