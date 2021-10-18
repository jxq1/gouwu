<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/4/23
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>收藏</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css" />
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css" />
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css" />
</head>
<body>

<div id="app">
    <!-- 轮播图 -->
    <div class="layui-carousel" id="swiper">
        <div carousel-item id="swiper-item">
            <div v-for="(item,index) in swiperList" v-bind:key="index">
                <img class="swiper-item" :src="item.img">
            </div>
        </div>
    </div>
    <!-- 轮播图 -->

    <!-- 图文列表 -->
    <div class="data-container layui-row">
        <h2 class="index-title"> USER STOREUP </h2>
        <div class="line-container">
            <p class="line"> 我的足迹 </p>
        </div>
        <fieldset class="search-container">
            <form class="layui-form">
                <div class="layui-inline" style="margin-bottom: 10px;">
                    <label class="layui-form-label">名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="name" id="name" placeholder="名称" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                    <button id="btn-search" type="button" class="layui-btn">
                        <i class="layui-icon layui-icon-search"></i> 搜索
                    </button>
                </div>
            </form>
        </fieldset>
        <div class="data-list layui-col-md8 layui-col-md-offset2">
            <div class="data-item layui-col-md3" v-for="(item,index) in dataList" v-bind:key="index">
                <img class="cover" :src="item.picture" @click="jump('../'+item.tablename+'/detail.jsp?id='+item.refid)">
                <h3 class="title" @click="jump('../'+item.tablename+'/detail.jsp?id='+item.refid)">{{item.name}}</h3>
                <button @click="deleteClick(item.id)" type="button" class="layui-btn layui-btn-radius layui-btn-sm btn-theme">
                    <i class="layui-icon">&#xe640;</i> 删除
                </button>
            </div>
            <%--<div class="delete-item ">--%>
            <%----%>
            <%--</div>--%>
        </div>
        <div class="pager" id="pager"></div>
    </div>
    <!-- 图文列表 -->
</div>


<!-- layui -->
<script src="../../layui/layui.js"></script>
<!-- vue -->
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
            swiperList: [{
                img: '../../img/banner.jpg'
            }],
            dataList: []
        },
        filters: {
            newsDesc: function(val) {
                if (val) {
                    if (val.length > 200) {
                        return val.substring(0, 200).replace(/<[^>]*>/g).replace(/undefined/g, '');
                    } else {
                        return val.replace(/<[^>]*>/g).replace(/undefined/g, '');
                    }
                }
                return '';
            }
        },
        methods: {
            jump:function(url) {
                jump(url)
            },
            deleteClick(id) {
                layui.layer.confirm('是否确认删除？', {
                    btn: ['删除', '取消'] //按钮
                }, function() {
                    layui.http.requestJson(`footprint/delete`, 'post', [id], function(res) {
                        layer.msg('删除成功', {
                            time: 2000,
                            icon: 6
                        }, function(res) {
                            window.location.reload();
                        });
                    })
                });
            }
        }
    })

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var jquery = layui.jquery;

        var limit = 8;

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                var swiperItemHtml = '';
                for (let item of res.data.list) {
                    if (item.name.indexOf('picture') >= 0 && item.value && item.value != "" && item.value != null) {
                        swiperItemHtml +=
                            '<div>' +
                            '<img class="swiper-item" src="' + item.value + '">' +
                            '</div>';
                    }
                }
                jquery('#swiper-item').html(swiperItemHtml);
                // 轮播图
                carousel.render({
                    elem: '#swiper',
                    width: swiper.width,height:swiper.height,
                    arrow: swiper.arrow,
                    anim: swiper.anim,
                    interval: swiper.interval,
                    indicator: swiper.indicator
                });
            }
        });
        // 分页列表
        pageList();

        // 搜索按钮
        jquery('#btn-search').click(function(e) {
            pageList();
        });

        function pageList() {
            var param = {
                page: 1,
                limit: limit,
                userid: localStorage.getItem('userid')
            };
            if (jquery('#name').val()) {
                param['name'] = jquery('#name').val() ? '%' + jquery('#name').val() + '%' : '';
            }
            // 获取列表数据
            http.request('footprint/list', 'get', param, function(res) {
                vue.dataList = res.data.list;
                // 分页
                laypage.render({
                    elem: 'pager',
                    count: res.data.total,
                    limit: limit,
                    jump: function(obj, first) {
                        //首次不执行
                        if (!first) {
                            http.request('footprint/list', 'get', param, function(res) {
                                vue.dataList = res.data.list
                            })
                        }
                    }
                });
            })
        }
    });
</script>
</body>
</html>
