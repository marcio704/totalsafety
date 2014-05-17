package br.com.totalsafety.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "tb_Contact")
public class Contact implements Serializable {

    public static final Integer CONTACT_FIRST = 1;

    @GeneratedValue
    @Id
    private Integer id;

    @NotNull(message = "A Rua deve ser preenchida.")
    @Size(min = 3, message = "A Rua deve ser preenchida.")
    private String street;

    @NotNull(message = "Cidade/Estado/CEP/Pais devem ser preenchidos.")
    @Size(min = 3, message = "Cidade/Estado/CEP/Pais devem ser preenchidos.")
    private String district;

    @NotNull(message = "O telefone deve ser preenchido.")
    @Size(min = 3, message = "O telefone deve ser preenchido.")
    private String phone;

    @NotNull(message = "Email não pode estar vazio.")
    @Size(min = 3, message = "Email não pode estar vazio.")
    private String email;

    @NotNull(message = "O horário de funcionamento deve ser preenchido.")
    @Size(min = 3, message = "O horário de funcionamento deve ser preenchido.")
    private String businessTime;

    private String linkFacebook;

    private String linkLinkedin;

    private String linkTwitter;

    private String linkGooglePlus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBusinessTime() {
        return businessTime;
    }

    public void setBusinessTime(String businessTime) {
        this.businessTime = businessTime;
    }

    public String getLinkFacebook() {
        return linkFacebook;
    }

    public void setLinkFacebook(String linkFacebook) {
        this.linkFacebook = linkFacebook;
    }

    public String getLinkLinkedin() {
        return linkLinkedin;
    }

    public void setLinkLinkedin(String linkLinkedin) {
        this.linkLinkedin = linkLinkedin;
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
