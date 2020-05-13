package SystemManage.SaleChance.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.dto.CusDevPlanDto;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.SaleChance.entity.CusDevPlan;
import SystemManage.SaleChance.entity.SaleChance;
import SystemManage.SaleChance.service.CusDevPlanService;
import SystemManage.SaleChance.service.SaleChanceService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户开发计划Controller类
 *
 * @author Administrator
 */
@Slf4j
@Controller
@RequestMapping("cusDevPlan")
public class CusDevPlanController {

    @Resource
    private CusDevPlanService cusDevPlanService;

    @Resource
    private SaleChanceService saleChanceService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        //true:允许输入空值，false:不能为空值
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @SysLog("开发记录列表")
    @RequiresPermissions("cusDevPlan:devList")
    @RequestMapping("/cusDev")
    public String dev() {
        return "Sale/clientDevList";
    }

    @SysLog("开发详情")
    @RequiresPermissions("cusDevPlan:detailDev")
    @RequestMapping("/detailDev")
    public String detailDev(ModelMap modelMap, @RequestParam("id") Integer id) {
        SaleChance byId = saleChanceService.findById(id);
        modelMap.addAttribute("saleChance", byId);
        return "Sale/client-dev-show";
    }

    @SysLog("添加开发")
    @RequiresPermissions("cusDevPlan:detailAddDev")
    @RequestMapping("/detailAddDev")
    public String detailAddDev(ModelMap modelMap, HttpSession session, @RequestParam("id") Integer id) {
        SaleChance byId = saleChanceService.findById(id);
        session.setAttribute("id", byId.getId());
        modelMap.addAttribute("saleChance", byId);
        return "Sale/client-dev-add-show";
    }

    /**
     * 查询客户开发计划集合
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions("cusDevPlan:list")
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "id") Integer id) {
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("saleChanceId", id.toString());
            List<CusDevPlan> cusDevPlan = cusDevPlanService.findCusDevPlan(map);
            return cusDevPlan.size() == 0 ? CommonResults.failure(ResponseCode.FAIL_DATA) : CommonResults.success(cusDevPlan.size(), cusDevPlan);
        } catch (Exception e) {
            log.info("查询客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping("/findUserByFuzzyUserName")
    public CommonResults findUserByFuzzyUserName(@RequestParam(value = "id") Integer id,
                                                 @RequestParam(value = "customerName", required = false) String customerName,
                                                 @RequestParam(value = "overView", required = false) String overView,
                                                 @RequestParam(value = "devResult", required = false) Integer devResult) {
        try {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("saleChanceId", id.toString());
            map.put("customerName", customerName);
            map.put("overView", overView);
            map.put("devResult", devResult.toString());
            List<CusDevPlan> cusDevPlan = cusDevPlanService.findCusDevPlan(map);
            return cusDevPlan.size() == 0 ? CommonResults.failure(ResponseCode.FAIL_DATA) : CommonResults.success(cusDevPlan.size(), cusDevPlan);
        } catch (Exception e) {
            log.info("查询客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }


    @RequiresPermissions("cusDevPlan:devPlanAdd")
    @RequestMapping("/add")
    public String add(HttpSession session, ModelMap modelMap) {
        Integer id = (Integer) session.getAttribute("id");
        SaleChance byId = saleChanceService.findById(id);
        modelMap.addAttribute("byId", byId);
        modelMap.addAttribute("cusDevPlan", new CusDevPlan());
        return "Sale/client-dev-plan";
    }

    /**
     * 添加客户开发计划项
     *
     * @param dto
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequiresPermissions("cusDevPlan:devPlanAdd")
    @RequestMapping("/save")
    public CommonResults save(@RequestBody CusDevPlanDto dto) {
        try {
            int devPlan = cusDevPlanService.addCusDevPlan(dto);
            return devPlan == 1 ? CommonResults.success() : CommonResults.failure();

        } catch (Exception e) {
            log.info("添加客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 执行销售机会
     *
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/devSuccess")
    public CommonResults devSuccess(@RequestParam(value = "id") Integer id) throws Exception {
        try {
            CusDevPlan cusDevPlan = cusDevPlanService.findById(id);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", cusDevPlan.getSaleChance().getId());
            // 状态修改成“开发成功”
            map.put("devResult", 2);
            int index = saleChanceService.updateSaleChanceDevResult(map);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 停止销售机会
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/stopDev")
    public CommonResults devStop(@RequestParam(value = "id") Integer id) {
        try {
            CusDevPlan cusDevPlan = cusDevPlanService.findById(id);
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", cusDevPlan.getSaleChance().getId());
            // 状态修改成“开发失败”
            map.put("devResult", 3);
            int index = saleChanceService.updateSaleChanceDevResult(map);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 删除执行计划
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") Integer id) {
        try {
            int saleChance = cusDevPlanService.deleteCusDevPlan(id);
            return saleChance == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            log.info("客户开发计划异常: {}", e.getMessage());
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }
}
