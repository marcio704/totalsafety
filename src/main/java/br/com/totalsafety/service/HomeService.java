package br.com.totalsafety.service;

import br.com.totalsafety.dao.HomeDAO;
import br.com.totalsafety.entity.Home;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HomeService {

    @Autowired
    private HomeDAO homeDAO;

    public Home find(Integer id) {
        return homeDAO.find(id);
    }

    public void insert(Home home) {
        homeDAO.insert(home);
    }

    public void update(Home home) {
        homeDAO.update(home);
    }

    public void delete(Home home) {
        homeDAO.delete(home);
    }

}
