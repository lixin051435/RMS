package SystemManage.Common.entity;


import lombok.Data;

import java.io.Serializable;

/**
 * @author linSir
 * @version V1.0
 * @Description: (pojo共性抽取)
 * @Date 2019/12/31 13:47
 */
@Data
public abstract class BaseEntity<ID extends Serializable> implements Serializable {
    private static final long serialVersionUID = 8925514045582235838L;

    /**
     * 根据用户继承关系指定ID类型
     */
    private ID id;
    //@JsonFormat(pattern = "yyyy-MM-dd  HH:mm:ss")
    //private Date createTime = new Date();
    //@JsonFormat(pattern = "yyyy-MM-dd  HH:mm:ss")
    //private Date updateTime = new Date();
}
