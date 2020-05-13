package SystemManage.SaleChance.service;

import SystemManage.SaleChance.dao.SaleChanceDao;
import SystemManage.SaleChance.entity.SaleChance;
import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 销售机会Service实现类
 *
 * @author Administrator
 */
@Service("saleChanceService")
public class SaleChanceService {

    @Resource
    private SaleChanceDao saleChanceDao;

    public List<SaleChance> findSaleChance(SaleChance saleChance, Integer page, Integer limit) {
        //进行分页
        PageHelper.startPage(page, limit);
        return saleChanceDao.findSaleChance(saleChance);
    }

    public Long getTotalSaleChance(Map<String, Object> map) {
        return saleChanceDao.getTotalSaleChance(map);
    }

    public int addSaleChance(SaleChance saleChance) {
        if (ObjectUtil.isNull(saleChance)) {
            throw new RuntimeException("参数异常");
        }
        if (StringUtil.isNotEmpty(saleChance.getAssignMan())) {
            saleChance.setState(1);
        } else {
            // 默认未分配状态
            saleChance.setState(0);
        }
        // 添加的时候 默认未开发成功
        saleChance.setDevResult(0);
        return saleChanceDao.addSaleChance(saleChance);

    }

    public int updateSaleChance(SaleChance saleChance) {
        if (ObjectUtil.isNull(saleChance)) {
            throw new RuntimeException("参数异常");
        }
        if (StringUtil.isNotEmpty(saleChance.getAssignMan())) {
            saleChance.setState(1);
        } else {
            // 默认未分配状态
            saleChance.setState(0);
        }
        return saleChanceDao.updateSaleChance(saleChance);
    }

    public int deleteSaleChance(Integer id) {
        if (ObjectUtil.isNull(id) && id <= 0) {
            throw new RuntimeException("参数异常");
        }
        return saleChanceDao.deleteSaleChance(id);
    }

    public int updateSaleChanceDevResult(Map<String, Object> map) {
        return saleChanceDao.updateSaleChanceDevResult(map);
    }

    public SaleChance findById(Integer id) {
        return saleChanceDao.findById(id);
    }

}
