package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.MessagesEntity;
import java.util.Map;

/**
 * 留言板 服务类
 * @author 
 * @since 2021-04-08
 */
public interface MessagesService extends IService<MessagesEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}