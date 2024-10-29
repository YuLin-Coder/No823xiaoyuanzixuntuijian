<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0'/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>首页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css"/>
    <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/common.js"></script>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/aos.css" />
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../xznstatic/css/idangerous.swiper.css" />
    <link rel="stylesheet" href="../../xznstatic/css/lightbox.css">
    <link rel="stylesheet" href="../../xznstatic/css/app.css" />
    <link rel="stylesheet" href="../../xznstatic/css/apmin.css" />
    <script type="text/javascript">
        var CATID = "0",
            BCID = "0",
            NAVCHILDER = "",
            ONCONTEXT = 0,
            ONCOPY = 0,
            ONSELECT = 0;
    </script>
    <style>
        .ng-djn-txt {
            text-align: justify;
            text-justify: inter-ideograph;
            word-wrap: break-word;
            word-break: break-all;
        }

        .ng-inpusbox {
            text-indent: 0px;
        }

        .jishuzichis a {
            font-size: 12px;
            color: #878787;
        }

        .ng-siotext {
            line-height: 50px;
        }

        @media screen and (max-width: 992px) {
            .ng-zein-iten-link li {
                width: 50%;
                text-align: center;
            }

            .ng-zein-iten-link li.li {
                width: 100%;
            }

            .bdshare-button-style2-16 a,
            .bdshare-button-style2-16 .bds_more {
                float: initial;
            }

            .ng-zein-code {
                width: 100%;
            }

            .ng-zein-code-tit {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>

<body>
<div id="app">
    <div class="layui-carousel" id="swiper">
        <div carousel-item id="swiper-item">
            <div v-for="(item,index) in swiperList" v-bind:key="index">
                <img class="swiper-item" :src="item.img" style="width: 100%;height:400px ">
            </div>
        </div>
    </div>

    <div class="ng-container ng-fault">

        <div class="ng-inmod ng-fault ng-paddor ng-bg-assist">
            <div class="ng-inmod-ini">
                <div class="ng-fault ng-container">
                    <div class="ng-inmod-the ng-container ng-bg-assist">
              <span class="ng-inmod-the-bg ng-inmod-the-bg-left" aos="fade-down-right">
                <img src="../../xznstatic/img/insie1.png" />
              </span>
                        <span class="ng-inmod-the-bg ng-inmod-the-bg-right" aos="fade-up-left">
                <img src="../../xznstatic/img/insie2.png" />
              </span>
                        <span class="ng-inmod-the-cn" aos="fade-down">新闻展示</span>
                        <span class="ng-inmod-the-en" aos="fade-up">DATA SHOW</span>
                    </div>
                    <span class="ng-inmod-thebor" aos="fade-up"></span>
                </div>

                <div class="ng-incontlst ng-fault ng-container ng-ai-drive1_map" aos="fade-up">
                    <div class="ng-incontlst-doc ng-incontlst-doc-show">
                        <div class="row">
                            <div class="ng-incontlst-col" v-for="(item,index) in  newsList" v-bind:key="index">
                                <div class="ng-incontlst-bor">
                                    <div class="ng-incontlst-img ng-oa ng-fault">
                                        <a href="javascript:void(0);" @click="jump('../news/detail.jsp?id='+item.id)">
                                            <img :src="item.newsPhoto?item.newsPhoto.split(',')[0]:''" width="300px" height="300px"/>
                                        </a>
                                    </div>
                                    <div class="ng-fault ng-container">
                                        <div class="ng-incontlst-tit">
                                            <p>{{item.newsName}}</p>
                                            <p style="color: red;" v-if="item.newsNewMoney">{{item.newsNewMoney}} RMB</p>
                                            <span></span>
                                        </div>
                                        <a href="javascript:void(0);" class="ng-incontlst-ikk" @click="jump('../news/detail.jsp?id='+item.id)">查看详情</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="am-end">
        <div class="ng-siobox ng-fault ng-paddor">
            <div class="am-end-ini">
                <div class="ng-siotext" aos="fade-up" aos-delay="400" aos-anchor-placement="top-bottom">
                    <p>欢迎访问<span v-text="projectName"></span>！</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            projectName: projectName,
            newsList: [],
            swiperList: [{
                img: '../../img/banner.jpg'
            }]
        },
        filters: {
            newsDesc: function (val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                    }

                    return val;
                }
                return '';
            }
        },
        methods: {
            jump(url) {
                jump(url);
            }
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;

        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function (res) {
            if (res.data.list.length > 0) {
                var swiperItemHtml = '';
                for (let item of res.data.list) {
                    if (item.value != "" && item.value != null) {
                        swiperItemHtml +=
                            '<div>' +
                            '<img class="swiper-item" src="' + item.value + '" width="100%" height="400px">' +
                            '</div>';
                    }
                }
                jquery('#swiper-item').html(swiperItemHtml);
                // 轮播图
                carousel.render({
                    elem: '#swiper',
                    width: '100%',
                    height: '400px',
                    arrow: 'always',
                    anim: 'fade',
                    interval: 1800,
                    indicator: 'inside'
                });
            }
        });


        http.request('news/list', 'get', {
            page: 1,
            limit: 6,
        }, function (res) {
            vue.newsList = res.data.list;
            vue.$nextTick(() => {
                $(".teamb-slide-38").slide({
                    mainCell: ".bd ul",
                    autoPage: true,
                    effect: "left",
                    autoPlay: true,
                    vis: 3,
                    trigger: "click",
                    interTime: 7000,
                    pnLoop: false
                });
                $(".click-more-team").on("click", function () {
                    var pars = $(this).parents("li");
                    $(".dask-team-ceng").removeClass("hide");
                    pars.find(".dask-team").removeClass("hide");
                });
                $(".team-colse").on("click", function () {
                    var pars = $(this).parents(".dask-team");
                    $(".dask-team-ceng").addClass("hide");
                    pars.addClass("hide");
                });
            });
        });
    });
</script>

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

<script>
    window.xznResize = function() {
        var mySwiper2 = new Swiper('.ng-inzep',{
            calculateHeight : true,
            loop : true,
            paginationClickable :true,
            pagination: ".ng-inzep .swiper-pagination"
        });

        $(document).bind("scroll",function (){
            if($(".ng-swip-porlist").length > 0){
                if($(window).width() > 769){
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                }else if($(window).width() < 769){
                    if($(window).width() < 480){
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    }else{
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }
        });

        $(window).bind("resize", function () {
            // 强制关闭导航
            if ($(window).width() > 992) { $(".ipad-nav").slideUp(); };

            if ($(".ng-swip-porlist").length > 0) {
                if ($(window).width() > 769) {
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                } else if ($(window).width() < 769) {
                    if ($(window).width() < 480) {
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    } else {
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }

            Spirit_dynamicBG($(".ng-inswbg"), 1600, 616, $(".ng-inswbg"));
            Spirit_CallBack($(".ng-porlist-doc>a"), 280, 200);
            Spirit_CallBack($(".ng-incontlst-img"), 368, 240);
            Spirit_CallBack($(".ng-inzep-ims"), 400, 270);
            Spirit_CallBack($(".ng-isenst-img"), 368, 240);
            Spirit_CallBack($(".ng-prslist-img"), 100, 100);
            Spirit_CallBack($(".ng-vrslist-img"), 260, 170);
            Spirit_CallBack($(".ng-newbve-img-ikk"), 368, 240);

            $(".ng-subc-swiper").css({ "height": $(".ng-subc-swiper").width() });

            if ($(window).width() < 640) {
                $(".am-inside-swf").css({
                    "min-height": $(window).height() - 60
                });
            } else {
                $(".am-inside-swf").css({
                    "min-height": "auto"
                });
            }
        }).resize();
    }
</script>
</body>

</html>