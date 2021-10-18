package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.FootprintEntity;
import com.entity.StoreupEntity;
import com.entity.view.FootprintView;
import com.entity.view.StoreupView;
import com.entity.vo.FootprintVO;
import com.entity.vo.StoreupVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface FootprintService extends IService<FootprintEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<FootprintVO> selectListVO(Wrapper<FootprintEntity> wrapper);

    FootprintVO selectVO(@Param("ew") Wrapper<FootprintEntity> wrapper);

    List<FootprintView> selectListView(Wrapper<FootprintEntity> wrapper);

    FootprintView selectView(@Param("ew") Wrapper<FootprintEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params,Wrapper<FootprintEntity> wrapper);

}
