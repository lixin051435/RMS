package SystemManage.Customer.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

/**
 * 联系人实体
 */
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Data
public class LinkMan extends BaseEntity<Integer> {

    private Customer customer; // 所属客户
    private String linkName; // 姓名
    private String sex; // 性别
    private String zhiwei; // 职位
    private String officePhone; // 办公电话
    private String phone; // 手机


}
