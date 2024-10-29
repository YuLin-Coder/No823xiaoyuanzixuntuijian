<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>

<div id="app">
    <!-- 标题 -->
    <!--  <h2 class="index-title">NEWS / INFORMATION</h2> -->
    <h2 class="index-title">新闻</h2>
    <div class="line-container">
        <p class="line"> 新闻 </p>
    </div>
    <!-- 标题 -->

    <!-- banner -->
    <div class="banner"></div>
    <!-- banner -->

    <div class="news-container">
        <h1 class="title">{{detail.newsName}}</h1>
        <div class="auth-container" v-if="detail.insertTime">
            时间：{{detail.insertTime}}
        </div>

        <div class="content" v-html="detail.newsContent">
        </div>

        <div class="bottom-container">
            <div class="title">
                本篇文章：{{detail.newsName}}
            </div>
            <div onclick="back()" class="btn">
                返回列表
            </div>
        </div>
            <div class="message-container">
                <form class="layui-form message-form" style="padding-right: 20px;border-bottom: 0;">
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label">评论</label>
                        <div class="layui-input-block">
                            <textarea name="xinwenCommentbackContent" required lay-verify="required" placeholder="请输入内容"
                              class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn btn-submit" lay-submit lay-filter="*">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
                <div class="message-list">
                    <div class="message-item" v-for="(item,index) in dataList" v-bind:key="index">
                        <div class="username-container">
                            <img class="avator" :src="item.yonghuPhoto">
                            <span class="username">用户：{{item.yonghuName}}</span>

                            <el-button @click="huifu(item.id)" type="text" style="margin-left: 800px">回复</el-button>
                        </div>
                        <div class="content">
                                <span class="message">
                                    {{item.xinwenCommentbackContent}}
                                </span>
                        </div>
                        <el-collapse @change="handleChange(item.id)" v-model="activeName" accordion style="width: 950px">
                            <el-collapse-item title="▽查看回复▽" :name="item.id">
                                <div v-if="dataList2.length <= 0">
                                    <el-collapse>
                                        <div><h4>暂无回复</h4></div>
                                    </el-collapse>
                                </div>
                                <el-collapse  v-for="(item2,index) in dataList2" v-bind:key="index">
                                    <div><span style="color: #354687;font-size: 18px">{{ item2.yonghuName }}: </span>{{ item2.xinwenCommentbackContent}}</div>
                                </el-collapse>
                            </el-collapse-item>
                        </el-collapse>
                    </div>
                </div>
                <div class="pager" id="pager"></div>
            </div>

        <el-dialog title="回复" :visible.sync="dialogFormVisible">
            <el-input
                    type="textarea"
                    :rows="3"
                    placeholder="请输入回复内容"
                    v-model="textarea">
            </el-input>
            <input type="hidden" :value="huifuId">
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="add">确 定</el-button>
            </div>
        </el-dialog>


    </div>
</div>


<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 组件配置信息 -->
<script src="../../js/config.js"></script>
<!-- 扩展插件配置信息 -->
<script src="../../modules/config.js"></script>
<!-- 工具方法 -->
<script src="../../js/utils.js"></script>
<!-- 引入组件库 -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>

<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            huifuId:'',
            textarea:'',
            activeName: '',
            dataList:[],
            dataList2:[],
            dialogFormVisible:false,
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 当前详情页表
            detailTable: 'news',
        },
        //  清除定时器
        destroyed: function () {
            // 不知道具体作用
            // window.clearInterval(this.inter);
        },
        methods: {
            handleChange(id) {
                this.activeName = id
                // 获取评论
                layui.http.request(`${vue.detailTable}Commentback/page`, 'get', {
                    page: 1,
                    limit: 5,
                    newsId2: id,
                    commentbackTypes: 2
                }, function (res) {
                    vue.dataList2 = res.data.list
                })

            },
            huifu(id) {
                this.dialogFormVisible=true,
                    this.huifuId = id;
            },
            add(){
                var data = {}
                if(this.textarea == "" || this.textarea== null || this.textarea == 'null'){
                    this.$message({
                        message: '回复框内容不能为空',
                        type: 'warning'
                    });
                    return false;
                }
                data.newsId = this.huifuId;
                data.commentbackTypes = 2
                data.yonghuId = localStorage.getItem('userid'),
                    data.xinwenCommentbackContent = this.textarea,
                    layui.http.requestJson(`${vue.detailTable}Commentback/save`, 'post', data, function (res) {
                        layer.msg('回复成功', {
                            time: 2000,
                            icon: 6
                        }, function () {
                            this.huifuId = "",
                                this.dialogFormVisible=false,
                                window.location.reload();
                        });
                        this.huifuId = "",
                            this.dialogFormVisible=false;
                    });
            }
        }
    })

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        var laypage = layui.laypage;

        var limit = 10;

        // 设置数量
        jquery('#buynumber').val(vue.buynumber);

        // 数据ID
        var id = http.getParam('id');
        vue.detail.id = id;

        // 当前详情
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
           // 轮播图片
            vue.swiperList = vue.detail.newsPhoto ? vue.detail.newsPhoto.split(",") : [];
            var swiperItemHtml = '';
            for (let item of vue.swiperList) {
                swiperItemHtml +=
                        '<div>' +
                        '<img class="swiper-item" src="' + item + '">' +
                        '</div>';
            }
            jquery('#swiper-item').html(swiperItemHtml);
            // 轮播图
            carousel.render({
                elem: '#swiper',
                width: swiper.width, height: swiper.height,
                arrow: swiper.arrow,
                anim: swiper.anim,
                interval: swiper.interval,
                indicator: swiper.indicator
            });
        });

// 获取评论
        http.request(`${vue.detailTable}Commentback/page`, 'get', {
            page: 1,
            limit: 5,
            newsId: vue.detail.id,
            commentbackTypes: 1
        }, function (res) {
            vue.dataList = res.data.list
            // 分页
            laypage.render({
                elem: 'pager',
                count: res.data.total,
                limit: limit,
                jump: function (obj, first) {
                    //首次不执行
                    if (!first) {
                        http.request(`${vue.detailTable}Commentback/page`, 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                        }, function (res) {
                            vue.dataList = res.data.list
                        })
                    }
                }
            });
        })

        // 提交评论
        form.on('submit(*)', function (data) {
            data = data.field;
            data.newsId = vue.detail.id
            data.commentbackTypes = 1
            data.yonghuId = localStorage.getItem('userid'),
                http.requestJson(`${vue.detailTable}Commentback/save`, 'post', data, function (res) {
                    layer.msg('评价成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        window.location.reload();
                    });
                    return false
                });
            return false
        });


    });



        // 添加
        /*function addNewsqqqqqqqq()(){
            layui.http.requestJson(`${vue.detailTable}Cart/add`, 'post', {
                yonghuId : localStorage.getItem('userid'),
                newsId : vue.detail.id,
                aaaaaaaa : vue.aaaaaaaa
            }, function (res) {
                if(res.code==0){
                    layer.msg('添加成功', {
                        time: 2000,
                        icon: 6
                    });
                }else{
                    layer.msg(res.msg, {
                        time: 2000,
                        icon: 2
                    });
                }
            });
        }*/


</script>
</body>
</html>
