package br.com.totalsafety.service;

import br.com.totalsafety.dao.InformationDAO;
import br.com.totalsafety.entity.Information;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class InformationService {
    
    @Autowired
    private InformationDAO informationDAO;

    public Information find(Integer id) {
        return informationDAO.find(id);
    }

    public void insert(Information Information) {
        informationDAO.insert(Information);
    }

    public void update(Information Information) {
        informationDAO.update(Information);
    }

    public void delete(Information Information) {
        informationDAO.delete(Information);
    }
    
    public List<Information> findAll() {
        return informationDAO.findAll();
    }
    
    public List<Information> findByType(String type) {
        return informationDAO.findByType(type);
    }
    
}
