package br.com.totalsafety.service;

import br.com.totalsafety.dao.UserDAO;
import br.com.totalsafety.entity.User;
import br.com.totalsafety.util.GenerateRandomPasswordUtil;
import br.com.totalsafety.util.SendEmailUtil;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {

    @Autowired
    private UserDAO userDAO;

    public User find(Integer id) {
        return userDAO.find(id);
    }

    public void insert(User user) {
        user.setPassword(GenerateRandomPasswordUtil.generatePassword());

        String subject = "Total Safety Web: Senha provisória para ".concat(user.getName());
        String text = "Olá,".concat("\n\n")
                .concat("O seu cadastro no sistema da Total Safety foi criado com sucesso, "
                        + "seguem seus dados de acesso: ".concat("\n\n"))
                .concat("Login: ".concat(user.getName()).concat("\n"))
                .concat("Senha provisória: ".concat(user.getPassword()).concat("\n\n"))
                .concat("Agora você pode efetuar login no sistema e alterar a sua senha caso ache necessário".concat("\n\n\n"))
                .concat("E-mail enviado automaticamente pelo sistema web da Total Safety. Favor, não responder.");
        SendEmailUtil.sendEmail(subject, text, user.getEmail());

        userDAO.insert(user);
    }

    public void update(User user) {
        userDAO.update(user);
    }

    public void delete(User user) {
        userDAO.delete(user);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findByNameAndPassword(User user) {
        return userDAO.findByNameAndPassword(user);
    }
    
    public List<User> findByEmail(User user) {
        return userDAO.findByEmail(user);
    }

    public List<User> findList(User user) {
        if (user.getId().equals(User.ADMIN)) {
            return this.findAll();
        } else {
            List list = new ArrayList<>();
            list.add(this.find(user.getId()));
            return list;
        }
    }
    
    public void sendForgotPwdEmail(User emailUser) {
        String subject = "Lembrete de Senha";
        String text = "Conforme solicitado, seguem dados de acesso para o sistema gerenciador de conteúdo da Total Safety: ".concat("\n\n")
                .concat("Login: ".concat(emailUser.getName()).concat("\n"))
                .concat("Senha: ".concat(emailUser.getPassword()).concat("\n\n\n"))
                .concat("E-mail enviado automaticamente pelo sistema web da Total Safety. Favor, não responder.");
        SendEmailUtil.sendEmail(subject, text, emailUser.getEmail());
    }
}
