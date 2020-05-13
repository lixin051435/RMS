package SystemManage.SaleChance.entity;

import SystemManage.Common.entity.BaseEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;


/**
 * 销售机会实体
 *
 * @author linSir
 */
@Data
public class SaleChance extends BaseEntity<Integer> {

    private String chanceSource; // 机会来源
    private String customerName; // 客户名称
    private int cgjl; // 成功几率
    private String overView; // 概要
    private String linkMan; // 联系人
    private String linkPhone; // 联系电话
    private String description; // 机会描述
    private String createMan; // 创建人
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date createTime; // 创建时间
    private String assignMan; // 指派人
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    private Date assignTime; // 指派时间

    private Integer state; // 分配状态 0 未分配 1 已分配
    private Integer devResult; // 客户开发状态 0 未开发 1 开发中 2 开发成功 3 开发失败


}
