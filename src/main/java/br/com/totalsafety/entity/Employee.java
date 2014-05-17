package br.com.totalsafety.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "tb_Employee")
public class Employee implements Serializable {

    @GeneratedValue
    @Id
    private Integer id;

    @NotNull
    @Size(min = 1, message = "O nome deve ser preenchido")
    private String name;

    @NotNull
    @Size(min = 1, message = "O cargo deve ser preenchido")
    private String job;

    @NotNull
    @Size(min = 10, message = "A descrição do cargo deve ter pelo menos 10 letras.")
    private String jobDescription;

    @NotNull
    private String image;

    @NotNull
    @Size(min = 1, message = "A area deve ser preenchida")
    private String area;

    private String linkFacebook;

    private String linkInstagram;

    private String linkTwitter;

    private String linkGooglePlus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public String getLinkInstagram() {
        return linkInstagram;
    }

    public void setLinkInstagram(String linkInstagram) {
        this.linkInstagram = linkInstagram;
    }

    public String getLinkTwitter() {
        return linkTwitter;
    }

    public void setLinkTwitter(String linkTwitter) {
        this.linkTwitter = linkTwitter;
    }

    public String getLinkGooglePlus() {
        return linkGooglePlus;
    }

    public void setLinkGooglePlus(String linkGooglePlus) {
        this.linkGooglePlus = linkGooglePlus;
    }

}
