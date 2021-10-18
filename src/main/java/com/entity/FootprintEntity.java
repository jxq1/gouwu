package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

/**
 * 收藏表
 * 数据库通用操作实体类（普通增删改查）
 */
@TableName("footprint")
public class FootprintEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


    public FootprintEntity() {

    }

    public FootprintEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /**
     * 主键id
     */
    @TableId
    private Long id;
    /**
     * 用户id
     */

    private Long userid;

    /**
     * 足迹id
     */

    private Long footid;
    /**
     * 最近浏览时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date foottime;

    /**
     * 表名
     */

    private String tablename;

    /**
     * 收藏名称
     */

    private String footname;

    /**
     * 收藏图片
     */

    private String footpicture;


    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Long getFootid() {
        return footid;
    }

    public void setFootid(Long footid) {
        this.footid = footid;
    }

    public Date getFoottime() {
        return foottime;
    }

    public void setFoottime(Date foottime) {
        this.foottime = foottime;
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public String getFootname() {
        return footname;
    }

    public void setFootname(String footname) {
        this.footname = footname;
    }

    public String getFootpicture() {
        return footpicture;
    }

    public void setFootpicture(String footpicture) {
        this.footpicture = footpicture;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
