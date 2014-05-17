package br.com.totalsafety.service;

import br.com.totalsafety.dao.ServicesDAO;
import br.com.totalsafety.entity.Services;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ServicesService {
    
    @Autowired
    private ServicesDAO serviceDAO;
    
    public Services find(Integer id) {
        return serviceDAO.find(id);
    }

    public void insert(Services service) {
        serviceDAO.insert(service);
    }

    public void update(Services service) {
        serviceDAO.update(service);
    }

    public void delete(Services service) {
        serviceDAO.delete(service);
    }

    @SuppressWarnings("unchecked")
    public List<Services> findAll() {
        return serviceDAO.findAll();
    }

    public List<Services> findByType(String type) {
        return serviceDAO.findByType(type);
    }
}
