package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.FootprintEntity;
import com.entity.StoreupEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

@TableName("footprint")
public class FootprintView  extends StoreupEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public FootprintView(){
    }

    public FootprintView(FootprintEntity footprintEntity){
        try {
            BeanUtils.copyProperties(this, footprintEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
