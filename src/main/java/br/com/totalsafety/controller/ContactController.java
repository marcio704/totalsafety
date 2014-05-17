package br.com.totalsafety.controller;

import br.com.totalsafety.dto.ContactEmail;
import br.com.totalsafety.entity.Contact;
import br.com.totalsafety.service.ContactService;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactController {

    @Autowired  
    private ContactService contactService;

    @RequestMapping(value = {"/contact", "/contact/email"}, method = RequestMethod.GET)
    public String contact(Model model) {
        model.addAttribute("contact", contactService.find(Contact.CONTACT_FIRST));
        model.addAttribute("contactEmail", new ContactEmail());
        model.addAttribute("successMsg", "");
        return "contact";
    }

    @RequestMapping(value = {"/cms/contact/edit"}, method = RequestMethod.GET)
    public String edit(Model model) {
        model.addAttribute("contact", contactService.find(Contact.CONTACT_FIRST));
        model.addAttribute("linkSelected", "contact");
        return "editContact";
    }

    @RequestMapping(value = {"/cms/contact/edit"}, method = RequestMethod.POST)
    public String edit(@Valid Contact contact, BindingResult result, HttpServletRequest request) {
        if (!result.hasErrors()) {
            try {
                contactService.update(contact);
                return "redirect:/contact";
            } catch (Exception e) {
                result.reject("general.error.unexpected");
                return "editContact";
            }
        }
        return "editContact";
    }

    @RequestMapping(value = {"/contact/email"}, method = RequestMethod.POST)
    public String sendContactEmail(@Valid ContactEmail contactEmail, BindingResult result, HttpServletRequest request, Model model) {
        if (!result.hasErrors()) {
            try {
                contactService.sendContactEmail(contactEmail);
                model.addAttribute("contact", contactService.find(Contact.CONTACT_FIRST));
                model.addAttribute("contactEmail", new ContactEmail());
                model.addAttribute("successMsg", "E-mail enviado com sucesso.");
                return "contact";
            } catch (Exception e) {
                model.addAttribute("successMsg", "");
                result.reject("general.email.error");
            }
        }
        model.addAttribute("contact", contactService.find(Contact.CONTACT_FIRST));
        model.addAttribute("contactEmail", contactEmail);
        return "contact";
    }
}
