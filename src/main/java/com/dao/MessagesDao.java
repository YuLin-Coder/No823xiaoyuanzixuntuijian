package com.dao;

import com.entity.MessagesEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.MessagesView;

/**
 * 留言板 Dao 接口
 *
 * @author 
 * @since 2021-04-08
 */
public interface MessagesDao extends BaseMapper<MessagesEntity> {

   List<MessagesView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
