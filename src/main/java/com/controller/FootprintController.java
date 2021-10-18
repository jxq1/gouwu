package com.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;


import com.entity.FootprintEntity;
import com.entity.view.FootprintView;
import com.service.FootprintService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * 收藏表
 * 后端接口
 */
@RestController
@RequestMapping("/footprint")
public class FootprintController {
    @Autowired
    private FootprintService footprintService;
    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, FootprintEntity storeup, HttpServletRequest request){
        if(!request.getSession().getAttribute("role").toString().equals("管理员")) {
            storeup.setUserid((Long)request.getSession().getAttribute("userId"));
        }

        EntityWrapper<FootprintEntity> ew = new EntityWrapper<FootprintEntity>();
        PageUtils page = footprintService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, storeup), params), params));
        request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,FootprintEntity storeup, HttpServletRequest request){
        if(!request.getSession().getAttribute("role").toString().equals("管理员")) {
            storeup.setUserid((Long)request.getSession().getAttribute("userId"));
        }

        EntityWrapper<FootprintEntity> ew = new EntityWrapper<FootprintEntity>();
        PageUtils page = footprintService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, storeup), params), params));
        request.setAttribute("data", page);
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( FootprintEntity storeup){
        EntityWrapper<FootprintEntity> ew = new EntityWrapper<FootprintEntity>();
        ew.allEq(MPUtil.allEQMapPre( storeup, "storeup"));
        return R.ok().put("data", footprintService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(FootprintEntity storeup){
        EntityWrapper< FootprintEntity> ew = new EntityWrapper< FootprintEntity>();
        ew.allEq(MPUtil.allEQMapPre( storeup, "storeup"));
        FootprintView footprintView =  footprintService.selectView(ew);
        return R.ok("查询收藏表成功").put("data", footprintView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        FootprintEntity storeup =footprintService.selectById(id);
        return R.ok().put("data", storeup);
    }

    /**
     * 前端详情
     */
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        FootprintEntity storeup = footprintService.selectById(id);
        return R.ok().put("data", storeup);
    }




    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody FootprintEntity storeup, HttpServletRequest request){
        storeup.setId(new Double(Math.floor(Math.random()*1000)).longValue());
        storeup.setUserid((Long)request.getSession().getAttribute("userid"));
        System.out.println("123");
        footprintService.insert(storeup);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody FootprintEntity storeup, HttpServletRequest request){
        storeup.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        //ValidatorUtils.validateEntity(storeup);
        storeup.setUserid((Long)request.getSession().getAttribute("userId"));

        footprintService.insert(storeup);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody FootprintEntity storeup, HttpServletRequest request){
        //ValidatorUtils.validateEntity(storeup);
        footprintService.updateById(storeup);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        footprintService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 提醒接口
     */
    @RequestMapping("/remind/{columnName}/{type}")
    public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request,
                         @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
        map.put("column", columnName);
        map.put("type", type);

        if(type.equals("2")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar c = Calendar.getInstance();
            Date remindStartDate = null;
            Date remindEndDate = null;
            if(map.get("remindstart")!=null) {
                Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
                c.setTime(new Date());
                c.add(Calendar.DAY_OF_MONTH,remindStart);
                remindStartDate = c.getTime();
                map.put("remindstart", sdf.format(remindStartDate));
            }
            if(map.get("remindend")!=null) {
                Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
                c.setTime(new Date());
                c.add(Calendar.DAY_OF_MONTH,remindEnd);
                remindEndDate = c.getTime();
                map.put("remindend", sdf.format(remindEndDate));
            }
        }

        Wrapper<FootprintEntity> wrapper = new EntityWrapper<FootprintEntity>();
        if(map.get("remindstart")!=null) {
            wrapper.ge(columnName, map.get("remindstart"));
        }
        if(map.get("remindend")!=null) {
            wrapper.le(columnName, map.get("remindend"));
        }
        if(!request.getSession().getAttribute("role").toString().equals("管理员")) {
            wrapper.eq("userid", (Long)request.getSession().getAttribute("userId"));
        }


        int count = footprintService.selectCount(wrapper);
        return R.ok().put("count", count);
    }




}
