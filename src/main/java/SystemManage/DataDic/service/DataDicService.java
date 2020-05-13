package SystemManage.DataDic.service;

import SystemManage.DataDic.dao.DataDicDao;
import SystemManage.DataDic.entity.DataDic;
import com.github.pagehelper.PageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 数据字典Service实现类
 *
 * @author Administrator
 */
@Service("dataDicService")
public class DataDicService {

    @Resource
    private DataDicDao dataDicDao;

   
    public List<DataDic> findDataDic(Map<String, Object> map, Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        return dataDicDao.findDataDic(map);
    }

   
    public Long getTotalDataDic(Map<String, Object> map) {
        return dataDicDao.getTotalDataDic(map);
    }

   
    public int addDataDic(DataDic dataDic) {
        return dataDicDao.addDataDic(dataDic);
    }

   
    public int updateDataDic(DataDic dataDic) {
        return dataDicDao.updateDataDic(dataDic);
    }

   
    public DataDic findDataDicByid(Integer id) {
        return dataDicDao.findDataDicByid(id);
    }

   
    public int deleteDataDic(Integer id) {
        return dataDicDao.deleteDataDic(id);
    }

   
    public List<DataDic> findAllDataDicName() {
        return dataDicDao.findAllDataDicName();
    }

}
