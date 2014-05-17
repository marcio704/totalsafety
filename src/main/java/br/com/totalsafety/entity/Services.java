package br.com.totalsafety.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "tb_Service")
@NamedQueries({
    @NamedQuery(name = "Services.findByType", query = "SELECT s FROM Services s WHERE s.type = :type ORDER BY s.title")
})
public class Services implements Serializable {

    public static final int MANUTENTION = 1;
    public static final int CALIBRATION = 2;
    public static final int MAX_SIZE = 150;

    @GeneratedValue
    @Id
    private Integer id;

    @NotNull(message = "O title deve ser preenchido")
    @Size(min = 5, message = "O title deve ter pelo menos 5 letras")
    private String title;

    private String subTitle;

    @NotNull(message = "O text deve ser preenchido")
    @Size(min = 10, message = "O text deve ter pelo menos 10 letras"
    )
    private String text;

    private String image;

    @NotNull(message = "O type deve ser preenchido")
    private String type;
    private String link;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
