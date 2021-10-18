package com.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class FootprintVO  implements Serializable {
    private static final long serialVersionUID = 1L;


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
}
