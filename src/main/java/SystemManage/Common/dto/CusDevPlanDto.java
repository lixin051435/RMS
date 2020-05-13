package SystemManage.Common.dto;

import SystemManage.SaleChance.entity.CusDevPlan;
import lombok.Getter;
import lombok.Setter;

/**
 * @author linSir
 * @version V1.0
 * @Description: (用一句话描述该文件做什么)
 * @Date 2020/1/8 21:58
 */
@Getter
@Setter
public class CusDevPlanDto extends CusDevPlan {
    private Integer saleId;

    @Override
    public String toString() {
        return "CusDevPlanDto{" +
                "saleId=" + saleId +
                '}' + super.getExeAffect() + "-" + super.getPlanDate() + "-" + super.getPlanItem();
    }
}
