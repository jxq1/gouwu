<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>

<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>商品评论</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
</head>
<body>

<div id="app">

    <div class="data-detail">
        <div class="data-detail-breadcrumb">
					<span class="layui-breadcrumb">
						<a href="../order/list.jsp">我的订单</a>
						<a><cite>{{title}}</cite></a>
					</span>


        </div>
        <div class="layui-row">
            <div class="layui-col-md5">
                <div class="layui-carousel" id="swiper">
                    <div carousel-item id="swiper-item">
                        <div v-for="(item,index) in swiperList" v-bind:key="index">
                            <img class="swiper-item" :src="item.img">
                        </div>
                    </div>
                </div>


            </div>
            <div class="layui-col-md7" style="padding-left: 20px;">
                <h1 class="title">{{title}}</h1>


                <div v-if="detail.price" class="detail-item">
                    <span>价格：</span>
                    <span class="price">
								{{detail.price}}RMB
							</span>
                </div>
                <div v-if="detail.jifen" class="detail-item">
                    <span>积分：</span>
                    <span class="price">
								{{detail.jifen}}
							</span>
                </div>
                <div v-if="detail.onelimittimes" class="detail-item">
                    <span>单次购买：</span>
                    <span class="desc">
								{{detail.onelimittimes}}
							</span>
                </div>
                <div v-if="detail.alllimittimes" class="detail-item">
                    <span>库存：</span>
                    <span class="desc">
								{{detail.alllimittimes}}
							</span>
                </div>


                <div class="detail-item">
                    <span>商品编号：</span>
                    <span class="desc">
                        {{detail.shangpinbianhao}}
                    </span>
                </div>
                <div class="detail-item">
                    <span>商品分类：</span>
                    <span class="desc">
                        {{detail.shangpinfenlei}}
                    </span>
                </div>
                <div class="detail-item">
                    <span>数量：</span>
                    <span class="desc">
                        {{detail.shuliang}}
                    </span>
                </div>
                <div class="detail-item">
                    <span>品牌：</span>
                    <span class="desc">
                        {{detail.pinpai}}
                    </span>
                </div>
                <div class="detail-item">
                    <span>规格：</span>
                    <span class="desc">
                        {{detail.guige}}
                    </span>
                </div>


                <div class="detail-item">


                </div>

                <div class="detail-item" style="text-align: right;">


                </div>
            </div>
        </div>



        <div class="layui-row">
            <div class="layui-tab layui-tab-card">

                <ul class="layui-tab-title">

                    <li class="layui-this">详情</li>


                    <li>评价</li>


                </ul>

                <div class="layui-tab-content">

                    <div class="layui-tab-item layui-show">
                        <div v-html="detail.xiangqing"></div>
                    </div>


                    <div class="layui-tab-item">
                        <div class="message-container">
                            <form class="layui-form message-form" style="padding-right: 20px;border-bottom: 0;">
                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">评价</label>
                                    <div class="layui-input-block">
                                        <textarea name="content" required lay-verify="required" placeholder="请输入内容"
                                                  class="layui-textarea"></textarea>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn btn-submit" @click="discusscg(orderdate)" lay-submit lay-filter="*">立即提交</button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </form>
                            <div class="pager" id="pager"></div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
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

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            // 轮播图
            swiperList: [],
            // 数据详情
            detail: {
                id: 0
            },
            // 订单详情
            orderdate:{
                id:0
            },
            // 商品标题
            title: '',
            // 倒计时
            count: 0,
            // 加入购物车数量
            buynumber: 1,
            // 当前详情页表
            detailTable: 'shangpinxinxi',
            // 评价列表
            dataList: [],
            // 选座座位列表
            numberList: []
        },
        methods: {
            jump:function(url) {
                jump(url)
            },
            isAuth:function(tablename, button) {
                return isFrontAuth(tablename, button)
            },
            discusscg:function(item){
                item.status = '已评价';
                layui.http.requestJson(`orders/update`, 'post', item, (res) => {
                    layui.layer.msg('评价成功', {
                        time: 2000,
                        icon: 6
                    }, function() {
                        window.location.reload();
                    });
            });
            },
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

        // 数据ID
        var id = window.sessionStorage.getItem("goodid");
        // var id =  http.getParam('goodid');
            // console.log("123"+goodid);
        vue.detail.id = id;
        // 商品信息
        http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
            // 详情信息
            vue.detail = res.data;
            vue.title = vue.detail.shangpinmingcheng;
            // footPrint();
            // 轮播图片
            vue.swiperList = vue.detail.fengmian ? vue.detail.fengmian.split(",") : [];
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
        // 订单信息
       var orderid = window.sessionStorage.getItem('orderid');
        http.request('orders/detail/' + orderid, 'get', {}, function (res) {
            // 详情信息
            vue.orderdate = res.data;

        });


        // 提交评论
        form.on('submit(*)', function (data) {
            data = data.field;
            data.userid = window.sessionStorage.getItem('userid');

            data.refid = vue.detail.id;
            http.requestJson(`discuss${vue.detailTable}/save`, 'post', data, function (res) {
                layer.msg('评价成功', {
                    time: 2000,
                    icon: 6,

                }, function () {
                    // discusscg(vue.orderdate);
                    // window.location.reload();
                    window.location.href="../order/list.jsp";
                });
                return false
            });
            return false
        });


    });

</script>
</body>
</html>
