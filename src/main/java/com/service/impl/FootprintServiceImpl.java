package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.FootprintDao;

import com.entity.FootprintEntity;

import com.entity.view.FootprintView;


import com.entity.vo.FootprintVO;
import com.entity.vo.StoreupVO;
import com.service.FootprintService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("FootprintService")
public class FootprintServiceImpl extends ServiceImpl<FootprintDao, FootprintEntity> implements FootprintService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<FootprintEntity> page = this.selectPage(
                new Query<FootprintEntity>(params).getPage(),
                new EntityWrapper<FootprintEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public List<FootprintVO> selectListVO(Wrapper<FootprintEntity> wrapper) {
        return baseMapper.selectListVO(wrapper);
    }

    @Override
    public FootprintVO selectVO(Wrapper<FootprintEntity> wrapper) {
        return baseMapper.selectVO(wrapper);
    }

    @Override
    public List<FootprintView> selectListView(Wrapper<FootprintEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public FootprintView selectView(Wrapper<FootprintEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<FootprintEntity> wrapper) {
        Page<FootprintView> page =new Query<FootprintView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page,wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }
}
