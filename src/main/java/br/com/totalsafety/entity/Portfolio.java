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
@Table(name="tb_Portfolio")
@NamedQueries({
    @NamedQuery(name="Portfolio.findByType", query="SELECT p FROM Portfolio p WHERE p.type = :type order by p.title")
}) 
public class Portfolio implements Serializable {
    
    public static final int RBC = 1;
    public static final int RBLE = 2;
    public static final int MAX_SIZE = 150;
    
    @GeneratedValue
    @Id
    private Integer id;
    
    @NotNull(message = "{portfolio.title.empty}") @Size(min=5, message = "{portfolio.title.small}")
    private String title;
    private String subTitle;
    @NotNull(message = "{portfolio.text.empty}") @Size(min=25, message = "{portfolio.text.small}")
    private String text;
    private String image;
    @NotNull
    private String type;
    private String link;
    private String aditionalInformation;

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

    public String getAditionalInformation() {
        return aditionalInformation;
    }

    public void setAditionalInformation(String aditionalInformation) {
        this.aditionalInformation = aditionalInformation;
    }

}
