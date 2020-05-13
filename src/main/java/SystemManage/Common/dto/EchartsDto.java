package SystemManage.Common.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author linSir
 * @version V1.0
 * @Description: (饼图数据模型)
 * @Date 2020/1/10 21:12
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class EchartsDto {
    private Integer value;
    private String name;


}
