package com.entity.vo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 新闻评论
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email
 * @date 2021-04-07
 */
@TableName("dianying_commentback")
public class DianyingCommentbackVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 新闻评论
     */

    @TableField(value = "xinwen_id")
    private Integer xinwenId;


    /**
     * 评论人
     */

    @TableField(value = "yonghu_id")
    private Integer yonghuId;


    /**
     * 评论时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 评论内容
     */

    @TableField(value = "xinwen_commentback_content")
    private String xinwenCommentbackContent;


    /**
     * 类型
     */

    @TableField(value = "commentback_types")
    private Integer commentbackTypes;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：新闻评论
	 */
    public Integer getXinwenId() {
        return xinwenId;
    }


    /**
	 * 获取：新闻评论
	 */

    public void setXinwenId(Integer xinwenId) {
        this.xinwenId = xinwenId;
    }
    /**
	 * 设置：评论人
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：评论人
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：评论时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：评论时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：评论内容
	 */
    public String getXinwenCommentbackContent() {
        return xinwenCommentbackContent;
    }


    /**
	 * 获取：评论内容
	 */

    public void setXinwenCommentbackContent(String xinwenCommentbackContent) {
        this.xinwenCommentbackContent = xinwenCommentbackContent;
    }
    /**
	 * 设置：类型
	 */
    public Integer getCommentbackTypes() {
        return commentbackTypes;
    }


    /**
	 * 获取：类型
	 */

    public void setCommentbackTypes(Integer commentbackTypes) {
        this.commentbackTypes = commentbackTypes;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
