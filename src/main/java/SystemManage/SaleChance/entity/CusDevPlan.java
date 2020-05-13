package SystemManage.SaleChance.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Date;


/**
 * 客户开发计划实体
 *
 * @author linSir
 */
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
@Data
public class CusDevPlan extends BaseEntity<Integer> {

    private SaleChance saleChance; // 销售机会
    private String planItem; // 计划项
    private Date planDate; // 计划日期
    private String exeAffect; // 执行效果


}
