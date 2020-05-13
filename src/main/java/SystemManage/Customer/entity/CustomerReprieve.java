package SystemManage.Customer.entity;

import SystemManage.Common.entity.BaseEntity;
import lombok.Data;

/**
 * 客户流失暂缓措施实体类
 */
@Data
public class CustomerReprieve extends BaseEntity<Integer> {

    private CustomerLoss customerLoss; // 客户流失
    private String measure; // 暂缓措施


}
