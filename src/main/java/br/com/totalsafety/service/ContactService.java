package br.com.totalsafety.service;

import br.com.totalsafety.dao.ContactDAO;
import br.com.totalsafety.dto.ContactEmail;
import br.com.totalsafety.entity.Contact;
import br.com.totalsafety.util.SendEmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ContactService {

    @Autowired
    private ContactDAO contactDAO;

    public Contact find(Integer id) {
        return contactDAO.find(id);
    }

    public void insert(Contact contact) {
        contactDAO.insert(contact);
    }

    public void update(Contact contact) {
        contactDAO.update(contact);
    }

    public void delete(Contact contact) {
        contactDAO.delete(contact);
    }
    
    public void sendContactEmail(ContactEmail contactEmail) {
        String subject = "CONTATO SITE: ".concat(contactEmail.getSubject());
        String text = "Empresa: ".concat(contactEmail.getCompany().concat("\n"))
                .concat("Nome: ".concat(contactEmail.getName()).concat("\n"))
                .concat("Email: ".concat(contactEmail.getEmail()).concat("\n"))
                .concat("CPF/CNPJ: ".concat(contactEmail.getIdentNumber()).concat("\n"))
                .concat("Tel: ".concat(contactEmail.getPhone()).concat("\n\n\n"))
                .concat("Mensagem: ".concat(contactEmail.getText()).concat("\n\n\n"))
                .concat("E-mail enviado automaticamente pelo sistema web da Total Safety. Favor, não responder.");
        SendEmailUtil.sendEmail(subject, text, ContactEmail.EMAIL_TO);
    }
}
