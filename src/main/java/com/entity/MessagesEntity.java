package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 留言板
 *
 * @author 
 * @email
 * @date 2021-04-08
 */
@TableName("messages")
public class MessagesEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public MessagesEntity() {

	}

	public MessagesEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Long id;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "addtime")

    private Date addtime;


    /**
     * 留言人id
     */
    @TableField(value = "userid")

    private Long userid;


    /**
     * 用户名
     */
    @TableField(value = "username")

    private String username;


    /**
     * 留言内容
     */
    @TableField(value = "content")

    private String content;


    /**
     * 回复内容
     */
    @TableField(value = "reply")

    private String reply;


    /**
	 * 设置：主键
	 */
    public Long getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Long id) {
        this.id = id;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getAddtime() {
        return addtime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
    /**
	 * 设置：留言人id
	 */
    public Long getUserid() {
        return userid;
    }


    /**
	 * 获取：留言人id
	 */

    public void setUserid(Long userid) {
        this.userid = userid;
    }
    /**
	 * 设置：用户名
	 */
    public String getUsername() {
        return username;
    }


    /**
	 * 获取：用户名
	 */

    public void setUsername(String username) {
        this.username = username;
    }
    /**
	 * 设置：留言内容
	 */
    public String getContent() {
        return content;
    }


    /**
	 * 获取：留言内容
	 */

    public void setContent(String content) {
        this.content = content;
    }
    /**
	 * 设置：回复内容
	 */
    public String getReply() {
        return reply;
    }


    /**
	 * 获取：回复内容
	 */

    public void setReply(String reply) {
        this.reply = reply;
    }

    @Override
    public String toString() {
        return "Messages{" +
            "id=" + id +
            ", addtime=" + addtime +
            ", userid=" + userid +
            ", username=" + username +
            ", content=" + content +
            ", reply=" + reply +
        "}";
    }
}
