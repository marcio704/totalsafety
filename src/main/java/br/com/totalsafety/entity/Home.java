package br.com.totalsafety.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name = "tb_Home")
@Entity
public class Home implements Serializable {

    public static final Integer HOME_FIRST = 1;

    @GeneratedValue
    @Id
    @Column(name = "home_id")
    private Integer id;

    @OneToMany(mappedBy = "home")
    private List<HomeImage> images;

    private String warn;

    private String warnImage;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<HomeImage> getImages() {
        return images;
    }

    public void setImages(List<HomeImage> images) {
        this.images = images;
    }

    public String getWarn() {
        return warn;
    }

    public void setWarn(String warn) {
        this.warn = warn;
    }

    public String getWarnImage() {
        return warnImage;
    }

    public void setWarnImage(String warnImage) {
        this.warnImage = warnImage;
    }

}
