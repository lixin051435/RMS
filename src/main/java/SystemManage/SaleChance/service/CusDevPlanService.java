package SystemManage.SaleChance.service;

import SystemManage.Common.dto.CusDevPlanDto;
import SystemManage.SaleChance.dao.CusDevPlanDao;
import SystemManage.SaleChance.dao.SaleChanceDao;
import SystemManage.SaleChance.entity.CusDevPlan;
import SystemManage.SaleChance.entity.SaleChance;
import cn.hutool.core.util.ObjectUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 客户开发计划Service实现类
 *
 * @author Administrator
 */
@Slf4j
@Service("cusDevPlanService")
public class CusDevPlanService  {

    @Resource
    private CusDevPlanDao cusDevPlanDao;
    @Autowired
    private SaleChanceDao saleChanceDao;

  
    public List<CusDevPlan> findCusDevPlan(Map<String, Object> map) {
        return cusDevPlanDao.findCusDevPlan(map);
    }

  
    public Long getTotalCusDevPlan(Map<String, Object> map) {
        return cusDevPlanDao.getTotalCusDevPlan(map);
    }

  
    public int addCusDevPlan(CusDevPlanDto devPlanDto) {
        log.debug("客户计划请求参数: {}", devPlanDto);
        if (ObjectUtil.isNull(devPlanDto)) {
            throw new RuntimeException("参数异常");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", devPlanDto.getSaleId());
        // 状态修改成“开发中”
        map.put("devResult", 1);
        //更新状态
        saleChanceDao.updateSaleChanceDevResult(map);
        //将ID转成对象
        SaleChance saleChance = new SaleChance();
        saleChance.setId(devPlanDto.getSaleId());
        devPlanDto.setSaleChance(saleChance);
        //保存计划
        return cusDevPlanDao.addCusDevPlan(devPlanDto);
    }

  
    public int updateCusDevPlan(CusDevPlan cusDevPlan) {
        return cusDevPlanDao.updateCusDevPlan(cusDevPlan);
    }

  
    public int deleteCusDevPlan(Integer id) {
        if (ObjectUtil.isNull(id) && id <= 0) {
            throw new RuntimeException("参数异常");
        }

        return cusDevPlanDao.deleteCusDevPlan(id);
    }

  
    public CusDevPlan findById(Integer id) {
        return cusDevPlanDao.findById(id);
    }

}
