package br.com.totalsafety.service;

import br.com.totalsafety.dao.PortfolioDAO;
import br.com.totalsafety.entity.Portfolio;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PortfolioService {

    @Autowired
    private PortfolioDAO portfolioDAO;

    public Portfolio find(Integer id) {
        return portfolioDAO.find(id);
    }
    
    public void insert(Portfolio portfolio) {
        portfolioDAO.insert(portfolio);
    }
    
    public void update(Portfolio portfolio) {
        portfolioDAO.update(portfolio);
    }
    
    public void delete(Portfolio portfolio) {
        portfolioDAO.delete(portfolio);
    }
    
    public List<Portfolio> findAll() {
        return portfolioDAO.findAll();
    }
    
    public List<Portfolio> findByType(String type) {
        return portfolioDAO.findByType(type);
    }
}