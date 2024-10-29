package com.entity.model;

import com.entity.MessagesEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 留言板
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 * @author 
 * @email
 * @date 2021-04-08
 */
public class MessagesModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Long id;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date addtime;


    /**
     * 留言人id
     */
    private Long userid;


    /**
     * 用户名
     */
    private String username;


    /**
     * 留言内容
     */
    private String content;


    /**
     * 回复内容
     */
    private String reply;


    /**
	 * 获取：主键
	 */
    public Long getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Long id) {
        this.id = id;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getAddtime() {
        return addtime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
    /**
	 * 获取：留言人id
	 */
    public Long getUserid() {
        return userid;
    }


    /**
	 * 设置：留言人id
	 */
    public void setUserid(Long userid) {
        this.userid = userid;
    }
    /**
	 * 获取：用户名
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 设置：用户名
	 */
    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 获取：留言内容
	 */
    public String getContent() {
        return content;
    }


    /**
	 * 设置：留言内容
	 */
    public void setContent(String content) {
        this.content = content;
    }
    /**
	 * 获取：回复内容
	 */
    public String getReply() {
        return reply;
    }


    /**
	 * 设置：回复内容
	 */
    public void setReply(String reply) {
        this.reply = reply;
    }

    }
