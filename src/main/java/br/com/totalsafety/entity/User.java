package br.com.totalsafety.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.hibernate.annotations.NamedQueries;
import org.hibernate.annotations.NamedQuery;

@Entity
@Table(name = "tb_User")
@NamedQueries({
    @NamedQuery(name = "User.findByNameAndPassword", query = "SELECT u FROM User u WHERE u.name = :name AND u.password = :password"),
    @NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
})
public class User implements Serializable {
    
    public static final int ADMIN = 1;

    @GeneratedValue
    @Id
    private Integer id;

    @NotNull(message = "{usuario.nome.empty}")
    @Size(min = 5, message = "{usuario.nome.small}")
    private String name;
    @NotNull(message = "O email deve ser preenchido.")
    @Size(min = 5, message = "O email deve ser preenchido.")
    private String email;
    @NotNull(message = "A senha deve ser preenchida.")
    @Size(min = 1, message = "A senha deve ser preenchida.")
    private String password;
    
    @Transient
    private boolean changePassword;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isChangePassword() {
        return changePassword;
    }

    public void setChangePassword(boolean changePassword) {
        this.changePassword = changePassword;
    }
    
}
