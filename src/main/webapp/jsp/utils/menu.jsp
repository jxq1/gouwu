<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
var menus = [{
	"backMenu": [{
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "用户",
			"menuJump": "列表",
			"tableName": "yonghu"
		}],
		"menu": "用户管理"
	}, {
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "服装分类",
			"menuJump": "列表",
			"tableName": "shangpinfenlei"
		}],
		"menu": "服装分类管理"
	}, {
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "服装信息",
			"menuJump": "列表",
			"tableName": "shangpinxinxi"
		}],
		"menu": "服装信息管理"
	}, {
		"child": [{
			"buttons": ["查看", "修改", "删除"],
			"menu": "服装评价信息",
			"menuJump": "列表",
			"tableName": "discussshangpinxinxi"
		}],
		"menu": "服装评价管理"
	}, {
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "流行公告",
			"tableName": "news"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "轮播图管理",
			"tableName": "lunbotuguanli"
		}],
		"menu": "系统管理"
	}, {
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已完成订单",
			"tableName": "yiwanchengdingdan"
		}, {
			"buttons": ["新增", "查看", "删除", "确认收货"],
			"menu": "已发货订单",
			"tableName": "yifahuodingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "未支付订单",
			"tableName": "weizhifudingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已取消订单",
			"tableName": "yiquxiaodingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除", "发货"],
			"menu": "已支付订单",
			"tableName": "yizhifudingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已退款订单",
			"tableName": "yituikuandingdan"
		},{
            "buttons": ["新增", "查看", "修改", "删除"],
            "menu": "已评价订单",
             "tableName": "yipinjiadingdan"
}],
		"menu": "订单管理"
	}],
	"frontMenu": [{
		"child": [{
			"buttons": ["查看"],
			"menu": "服装信息列表",
			"menuJump": "列表",
			"tableName": "shangpinxinxi"
		}],
		"menu": "服装信息模块"
	}],
	"roleName": "管理员",
	"tableName": "users"
}, {
	"backMenu": [{
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "我的收藏管理",
			"tableName": "storeup"
		}],
		"menu": "我的收藏管理"
	}, {
		"child": [{
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已取消订单",
			"tableName": "yiquxiaodingdan"
		}, {
			"buttons": ["新增", "查看", "删除", "发货"],
			"menu": "已支付订单",
			"tableName": "yizhifudingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已退款订单",
			"tableName": "yituikuandingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "已完成订单",
			"tableName": "yiwanchengdingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除", "确认收货"],
			"menu": "已发货订单",
			"tableName": "yifahuodingdan"
		}, {
			"buttons": ["新增", "查看", "修改", "删除"],
			"menu": "未支付订单",
			"tableName": "weizhifudingdan"
		}],
		"menu": "订单管理"
	}],
	"frontMenu": [{
		"child": [{
			"buttons": ["查看"],
			"menu": "服装信息列表",
			"menuJump": "列表",
			"tableName": "shangpinxinxi"
		}],
		"menu": "服装信息模块"
	}],
	"roleName": "用户",
	"tableName": "yonghu"
}];

var hasMessage = '';
