package br.com.totalsafety.dto;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ContactEmail {
    
    public static final String EMAIL_TO = "marcio704@yahoo.com.br";

    @NotNull(message = "O nome não pode estar vazio")
    @Size(min = 2, message = "O nome não pode estar vazio")
    private String name;

    @NotNull(message = "O e-mail não pode estar vazio")
    @Size(min = 5, message = "O e-mail não pode estar vazio")
    private String email;

    private String phone;

    @NotNull(message = "A empresa não pode estar vazia")
    @Size(min = 2, message = "O campo empresa deve conter pelo menos 2 caracteres")
    private String company;

    private String identNumber;

    @NotNull(message = "O assunto não pode estar vazio")
    @Size(min = 3, message = "O assunto deve conter pelo menos 3 caracteres")
    private String subject;

    @NotNull(message = "O text não pode estar vazio")
    @Size(min = 20, message = "A mensagem deve conter pelo menos 20 caracteres")
    private String text;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getIdentNumber() {
        return identNumber;
    }

    public void setIdentNumber(String identNumber) {
        this.identNumber = identNumber;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

}
