package com.dao;

import com.entity.NewsCommentbackEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.NewsCommentbackView;

/**
 * 新闻评论 Dao 接口
 *
 * @author 
 * @since 2021-04-07
 */
public interface NewsCommentbackDao extends BaseMapper<NewsCommentbackEntity> {

   List<NewsCommentbackView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
