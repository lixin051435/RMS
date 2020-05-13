package SystemManage.DataDic.entity;

import SystemManage.Common.entity.BaseEntity;
import lombok.Data;

/**
 * 数据字典实体类
 */
@Data
public class DataDic extends BaseEntity<Integer> {

    private String dataDicName; // 数据字典名
    private String dataDicValue; // 数据字典值


}