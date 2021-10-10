package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.FootprintEntity;
import com.entity.view.FootprintView;

import com.entity.vo.FootprintVO;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FootprintDao extends BaseMapper<FootprintEntity> {
    List<FootprintVO> selectListVO(@Param("ew") Wrapper<FootprintEntity> wrapper);

    FootprintVO selectVO(@Param("ew") Wrapper<FootprintEntity> wrapper);

    List<FootprintView> selectListView(@Param("ew") Wrapper<FootprintEntity> wrapper);

    List<FootprintView> selectListView(Pagination page, @Param("ew") Wrapper<FootprintEntity> wrapper);

    FootprintView selectView(@Param("ew") Wrapper<FootprintEntity> wrapper);

}
