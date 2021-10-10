<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!-- 论坛中心 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>论坛中心</title>
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

			<!-- 标题 -->
			<h2 class="index-title">SHOP / CART</h2>
			<div class="line-container">
				<p class="line"> 购物车 </p>
			</div>
			<!-- 标题 -->

			<div class="paper-container">
				<table class="layui-table" lay-skin="nob">
					<thead>
						<tr>
                            <th>
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" id="select-all" @click="chooseAll()">
                                    <label class="custom-control-label" for="select-all"></label>
                                </div>
                            </th>
							<th>购买服装</th>
							<th>价格</th>
							<th>积分</th>
							<th>数量</th>
							<th>总价</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<tr v-for="(item,index) in dataList" v-bind:key="index">
                            <td style="width: 100px;">
                                <div >
                                    <input @click="totolprice()" type="checkbox" id="number" name="chk" class="custom-control-input" :value="item.id">
                                    <label class="custom-control-label" for="number"></label>
                                </div>
                            </td>
							<td style="display: flex;text-align: left;width: 250px;">
								<img :src="item.picture" style="width: 100px;height: 100px;object-fit: cover;">
								<div style="margin-left: 10px;margin-top: 10px;">
									{{item.goodname}}
								</div>
							</td>
							<td style="width: 100px;">{{item.price}} RMB</td>
							<td style="width: 100px;">{{item.jifen}} 积分</td>
							<td style="width: 140px;">
								<div class="num-picker">
									<button type="button" @click="reduceCartNum(index)" class="layui-btn layui-btn-primary">-</button>
									<input style="height: 38px;" type="number" :value="item.buynumber" id="buynumber" name="buynumber" class="layui-input"
									 disabled="disabled"></input>
									<button type="button" @click="addCartNum(index)" class="layui-btn layui-btn-primary">+</button>
								</div>
							</td>
							<td style="width: 100px;">{{item.price*item.buynumber}} RMB</td>
							<td style="width: 100px;">
								<button @click="deleteCart(index)" type="button" class="layui-btn layui-btn-radius btn-theme">
									<i class="layui-icon">&#xe640;</i> 删除
								</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="btn-container">
					<span style="font-size: 18px;font-weight: bold;color: #ce0b07;margin-right: 20px;">
                       <%--总价:<input  type="input" :value="totolprices" id="totolp" name="totolp"/>RMB--%>
						总价:<i class="layui-icon">{{totolprices}}</i>RMB
                           <%--总价：{{totalPrice}}RMB--%>
					</span>
					<button @click="buyClick(1)" type="button" class="layui-btn layui-btn-lg btn-theme">
						<i class="layui-icon">&#xe657;</i> 余额购买
					</button>
					<button @click="buyClick(2)" type="button" class="layui-btn layui-btn-lg btn-theme">
						<i class="layui-icon">&#xe657;</i> 积分购买
					</button>
				</div>
			</div>
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
					dataList: [],
                    // ids : [],
                    checkAll : false,
                    datacar : [],
                    totolprices:0,
                    idValue:1
				},
				computed: {
					totalPrice: function() {
						var total = 0;
						for (var item of this.dataList) {
							total += item.price * item.buynumber
						}
						return total;
					}
				},
				methods: {
					jump:function(url) {
						jump(url)
					},
                    totolprice:function(){
                        var total = 0;
                        var boxs = document.getElementsByName("chk");
                        var i = 0;
                        for(var box1 of boxs){
                            if(box1.checked){
                                total +=this.dataList[i].price*this.dataList[i].buynumber;
                            }
                            console.log("totol:"+total);
                            i = i+1;
                        }
                        vue.totolprices = total;
                    },
                    // 全选/全不选
                    chooseAll:function(){
                        var checkAll = !this.checkAll;
                        var boxs = document.getElementsByName("chk");
                         for(var i=0;i<boxs.length;i++){
                            boxs[i].checked= checkAll;
                         }
                    },
                    // 添加数量
					addCartNum(index) {
						// 查询对应的商品的详情信息，判断是否有商品限次，库存的判断
						var item = this.dataList[index];
						layui.http.request(`shangpinxinxi/info/${item.goodid}`, 'get', {}, function(res) {
							// 单次购买限制
							if (res.data.onelimittimes && res.data.onelimittimes > 0 && res.data.onelimittimes <= item.buynumber) {
								layui.layer.msg(`每人单次只能购买${res.data.onelimittimes}次`, {
									time: 2000,
									icon: 5
								});
								return
							}
							// 库存限制
							if (res.data.alllimittimes && res.data.alllimittimes > 0 && res.data.alllimittimes <= item.buynumber) {
								layui.layer.msg(`商品已售罄`, {
									time: 2000,
									icon: 5
								});
								return
							}
							item.buynumber = item.buynumber + 1;
							layui.http.requestJson(`cart/update`, 'post', item, function(res) {});
						});
					},
					// 减少数量
					reduceCartNum(index) {
						var item = this.dataList[index];
						if (item.buynumber > 1) {
							item.buynumber = item.buynumber - 1;
							layui.http.requestJson(`cart/update`, 'post', item, function(res) {});
						}
					},
					// 删除
					deleteCart(index) {
						var item = this.dataList[index];
						layui.http.requestJson(`cart/delete`, 'post', [item.id], function(res) {
							window.location.reload();
						});
					},
					// 购买商品
					buyClick(type) {
                       var ids = [];
                       var datacar = [];
                       var boxs = document.getElementsByName("chk");
                        for(var box1 of boxs){
                            if(box1.checked){
                                console.log("value"+box1.value+";");
                                ids.push(box1.value);
                            }
                        }
                        console.log("datacar.length"+datacar.length);
                        console.log(datacar);
                        console.log(ids);
                        if(ids.length == 0){
                            alert('请勾选要购买的服装');
                        }else{
                            layui.http.requestJson(`cart/selectIds`, 'post', ids, function(res) {
                                datacar.push(res.data);
                                console.log(datacar);
                                console.log(vue.datacar);
                                // localStorage.setItem('orderGoods', JSON.stringify(this.dataList));
                                localStorage.setItem('orderGoods',JSON.stringify(res.data));
                                window.sessionStorage.setItem('type', type);
                                window.location.href = '../order/confirm.jsp';
                            });

                        }

					}
				}
			});

			layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery'], function() {
				var layer = layui.layer;
				var element = layui.element;
				var carousel = layui.carousel;
				var laypage = layui.laypage;
				var http = layui.http;
				var jquery = layui.jquery;

				var limit = 10;

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

				// 获取列表数据
				http.request('cart/list', 'get', {
					page: 1,
					limit: limit,
					userid: localStorage.getItem('userid')
				}, function(res) {
					vue.dataList = res.data.list;
					// 分页
					laypage.render({
						elem: 'pager',
						count: res.data.total,
						limit: limit,
						jump: function(obj, first) {
							//首次不执行
							if (!first) {
								http.request('news/list', 'get', {
									page: obj.curr,
									limit: obj.limit,
									userid: localStorage.getItem('userid')
								}, function(res) {
									vue.dataList = res.data.list
								})
							}
						}
					});
				})

			});
        </script>
	</body>
</html>
