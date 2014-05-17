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
@Table(name="tb_Information")
@NamedQueries({
    @NamedQuery(name = "Information.findByType", query="SELECT i FROM Information i WHERE i.type = :type order by i.title")
})
public class Information implements Serializable {
    
    public static final int ARTICLE = 1;
    public static final int TECHNICAL = 2;
    public static final int MAX_SIZE = 1000;
    
    @GeneratedValue
    @Id
    private Integer id;
    @NotNull
    @Size(min=1, message="O titulo deve ser preenchido")
    private String title;
    @NotNull
    @Size(min=1, message="O texto deve ser preenchido")
    private String text;
    @NotNull
    private String link;
    @NotNull
    @Size(min=1, message="O tipo deve ser preenchido")
    private String type;

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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
}
