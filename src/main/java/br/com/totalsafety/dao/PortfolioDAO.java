package br.com.totalsafety.dao;

import br.com.totalsafety.entity.Portfolio;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class PortfolioDAO{

    @PersistenceContext
    private EntityManager entityManager;

    public Portfolio find(Integer id) {
        return entityManager.find(Portfolio.class, id);
    }

    public void insert(Portfolio portfolio) {
        entityManager.persist(portfolio);
        entityManager.flush();
    }

    public void update(Portfolio portfolio) {
        entityManager.merge(portfolio);
        entityManager.flush();

    }

    public void delete(Portfolio portfolio) {
        entityManager.remove(portfolio);
        entityManager.flush();

    }

    @SuppressWarnings("unchecked")
    public List<Portfolio> findAll() {
        return entityManager.createQuery("SELECT p FROM Portfolio p ORDER BY p.type, p.title").getResultList();
    }

    public List<Portfolio> findByType(String type) {
        return (List<Portfolio>) entityManager.createNamedQuery("Portfolio.findByType")
                .setParameter("type", type).getResultList();
    }
}