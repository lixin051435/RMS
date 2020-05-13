package SystemManage.DataDic.controller;

import SystemManage.Common.aop.SysLog;
import SystemManage.Common.result.CommonPage;
import SystemManage.Common.result.CommonResults;
import SystemManage.Common.result.ResponseCode;
import SystemManage.DataDic.entity.DataDic;
import SystemManage.DataDic.service.DataDicService;
import cn.hutool.core.util.StrUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据字典Controller层
 *
 * @author Administrator
 */
@Controller
@RequestMapping("dataDic")
public class DataDicController {

    @Resource
    private DataDicService dataDicService;


    @SysLog("字典管理")
    @RequiresPermissions("dataDic:list")
    @RequestMapping("/manager")
    public String dicStr() {
        return "dictionary/data-list";
    }

    /**
     * 查找数据字典集合 用于下拉框
     *
     * @param dataDicName
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping("/findDataDic")
    public CommonResults dataDicComboList(@RequestParam(value = "dataDicName") String dataDicName) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StrUtil.isNotBlank(dataDicName)) {
            map.put("dataDicName", dataDicName);
        }
        List<DataDic> dataDicList = dataDicService.findDataDic(map, 0, 10);
        return CommonResults.success(dataDicList);
    }



    /**
     * 查询所有的数据字典名称
     *
     * @return
     * @throws Exception
     */
    @RequestMapping("/findDataDicName")
    public String dataDicNameComboList() throws Exception {
        List<DataDic> dataDicList = dataDicService.findAllDataDicName();

        return null;
    }

    /**
     * 查询数据字典集合
     *
     * @param page
     * @param s_dataDic
     * @return
     * @throws Exception
     */
    @RequiresPermissions("dataDic:list")
    @ResponseBody
    @RequestMapping("/list")
    public CommonResults list(@RequestParam(value = "page", defaultValue = "1") Integer page,
                              @RequestParam(value = "limit", defaultValue = "10") Integer limit,
                              DataDic s_dataDic) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (StrUtil.isNotBlank(s_dataDic.getDataDicName())) {
            map.put("dataDicName", s_dataDic.getDataDicName());
        }
        if (StrUtil.isNotBlank(s_dataDic.getDataDicValue())) {
            map.put("dataDicValue", s_dataDic.getDataDicValue());
        }
        List<DataDic> dataDic = dataDicService.findDataDic(map, page, limit);
        CommonPage<DataDic> dataDicCommonPage = CommonPage.restPage(dataDic);
        return CommonResults.success(dataDicCommonPage.getTotal().intValue(), dataDicCommonPage.getList());
    }

    @SysLog("字典增加")
    @RequiresPermissions("dataDic:save")
    @RequestMapping("/add")
    public String add(ModelMap modelMap) {
        modelMap.addAttribute("dataDic", new DataDic());
        return "dictionary/data-edit-add";
    }


    @SysLog("字典更新")
    @RequiresPermissions("dataDic:update")
    @RequestMapping("/edit")
    public String add(ModelMap modelMap, @RequestParam("id") Integer id) {
        modelMap.addAttribute("dataDic", dataDicService.findDataDicByid(id));
        return "dictionary/data-edit-add";
    }

    @ResponseBody
    @RequiresPermissions("dataDic:update")
    @RequestMapping("/update")
    public CommonResults update(@RequestBody DataDic dataDic) {
        try {
            int index = dataDicService.updateDataDic(dataDic);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 添加数据字典
     *
     * @param dataDic
     * @return
     * @throws Exception
     */
    @RequiresPermissions("dataDic:save")
    @ResponseBody
    @RequestMapping("/save")
    public CommonResults save(@RequestBody DataDic dataDic) throws Exception {
        try {
            int index = dataDicService.addDataDic(dataDic);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }

    /**
     * 删除数据字典
     *
     * @param id
     * @return
     * @throws Exception
     */
    @SysLog("字典删除")
    @RequiresPermissions("dataDic:delete")
    @ResponseBody
    @RequestMapping("/delete")
    public CommonResults delete(@RequestParam(value = "id") Integer id) throws Exception {
        try {
            int index = dataDicService.deleteDataDic(id);
            return index == 1 ? CommonResults.success() : CommonResults.failure();
        } catch (Exception e) {
            e.printStackTrace();
            return CommonResults.failure(ResponseCode.FAIL.getCode(), e.getMessage());
        }
    }
}
