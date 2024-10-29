package com.entity.view;

import com.entity.NewsCommentbackEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;

/**
 * 新闻评论
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email
 * @date 2021-04-07
 */
@TableName("news_commentback")
public class NewsCommentbackView extends NewsCommentbackEntity implements Serializable {
    private static final long serialVersionUID = 1L;
		/**
		* 类型的值
		*/
		private String commentbackValue;



		//级联表 news
			/**
			* 新闻名称
			*/
			private String newsName;
			/**
			* 新闻类型
			*/
			private Integer newsTypes;
				/**
				* 新闻类型的值
				*/
				private String newsValue;
			/**
			* 新闻图片
			*/
			private String newsPhoto;
			/**
			* 新闻时间
			*/
			private Date insertTime;
			/**
			* 新闻内容
			*/
			private String newsContent;

		//级联表 yonghu
			/**
			* 姓名
			*/
			private String yonghuName;
			/**
			* 性别
			*/
			private Integer sexTypes;
				/**
				* 性别的值
				*/
				private String sexValue;
			/**
			* 身份证号
			*/
			private String yonghuIdNumber;
			/**
			* 手机号
			*/
			private String yonghuPhone;
			/**
			* 照片
			*/
			private String yonghuPhoto;

	public NewsCommentbackView() {

	}

	public NewsCommentbackView(NewsCommentbackEntity newsCommentbackEntity) {
		try {
			BeanUtils.copyProperties(this, newsCommentbackEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



			/**
			* 获取： 类型的值
			*/
			public String getCommentbackValue() {
				return commentbackValue;
			}
			/**
			* 设置： 类型的值
			*/
			public void setCommentbackValue(String commentbackValue) {
				this.commentbackValue = commentbackValue;
			}













				//级联表的get和set news
					/**
					* 获取： 新闻名称
					*/
					public String getNewsName() {
						return newsName;
					}
					/**
					* 设置： 新闻名称
					*/
					public void setNewsName(String newsName) {
						this.newsName = newsName;
					}
					/**
					* 获取： 新闻类型
					*/
					public Integer getNewsTypes() {
						return newsTypes;
					}
					/**
					* 设置： 新闻类型
					*/
					public void setNewsTypes(Integer newsTypes) {
						this.newsTypes = newsTypes;
					}


						/**
						* 获取： 新闻类型的值
						*/
						public String getNewsValue() {
							return newsValue;
						}
						/**
						* 设置： 新闻类型的值
						*/
						public void setNewsValue(String newsValue) {
							this.newsValue = newsValue;
						}
					/**
					* 获取： 新闻图片
					*/
					public String getNewsPhoto() {
						return newsPhoto;
					}
					/**
					* 设置： 新闻图片
					*/
					public void setNewsPhoto(String newsPhoto) {
						this.newsPhoto = newsPhoto;
					}
					/**
					* 获取： 新闻时间
					*/
					public Date getInsertTime() {
						return insertTime;
					}
					/**
					* 设置： 新闻时间
					*/
					public void setInsertTime(Date insertTime) {
						this.insertTime = insertTime;
					}
					/**
					* 获取： 新闻内容
					*/
					public String getNewsContent() {
						return newsContent;
					}
					/**
					* 设置： 新闻内容
					*/
					public void setNewsContent(String newsContent) {
						this.newsContent = newsContent;
					}







				//级联表的get和set yonghu
					/**
					* 获取： 姓名
					*/
					public String getYonghuName() {
						return yonghuName;
					}
					/**
					* 设置： 姓名
					*/
					public void setYonghuName(String yonghuName) {
						this.yonghuName = yonghuName;
					}
					/**
					* 获取： 性别
					*/
					public Integer getSexTypes() {
						return sexTypes;
					}
					/**
					* 设置： 性别
					*/
					public void setSexTypes(Integer sexTypes) {
						this.sexTypes = sexTypes;
					}


						/**
						* 获取： 性别的值
						*/
						public String getSexValue() {
							return sexValue;
						}
						/**
						* 设置： 性别的值
						*/
						public void setSexValue(String sexValue) {
							this.sexValue = sexValue;
						}
					/**
					* 获取： 身份证号
					*/
					public String getYonghuIdNumber() {
						return yonghuIdNumber;
					}
					/**
					* 设置： 身份证号
					*/
					public void setYonghuIdNumber(String yonghuIdNumber) {
						this.yonghuIdNumber = yonghuIdNumber;
					}
					/**
					* 获取： 手机号
					*/
					public String getYonghuPhone() {
						return yonghuPhone;
					}
					/**
					* 设置： 手机号
					*/
					public void setYonghuPhone(String yonghuPhone) {
						this.yonghuPhone = yonghuPhone;
					}
					/**
					* 获取： 照片
					*/
					public String getYonghuPhoto() {
						return yonghuPhoto;
					}
					/**
					* 设置： 照片
					*/
					public void setYonghuPhoto(String yonghuPhoto) {
						this.yonghuPhoto = yonghuPhoto;
					}



}
