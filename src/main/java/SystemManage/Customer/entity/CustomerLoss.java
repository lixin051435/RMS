package SystemManage.Customer.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 客户流失实体
 */
@Data
public class CustomerLoss extends BaseEntity<Integer> {

    private String cusNo; // 客户编号
    private String cusName; // 客户名称
    private String cusManager; // 客户经理
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date lastOrderTime; // 上次下单日期
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date confirmLossTime; // 确认流失日期
    private Integer state = 1; // 状态 0 暂缓流失 1 确认流失
    private String lossReason; // 流失原因


}