package br.com.totalsafety.service;

import br.com.totalsafety.dao.AboutDAO;
import br.com.totalsafety.entity.About;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class AboutService {

    @Autowired
    private AboutDAO aboutDAO;

    public About find(Integer id) {
        return aboutDAO.find(id);
    }

    public void insert(About contact) {
        aboutDAO.insert(contact);
    }

    public void update(About contact) {
        aboutDAO.update(contact);
    }

    public void delete(About contact) {
        aboutDAO.delete(contact);
    }
}
