package br.com.totalsafety.dao;

import br.com.totalsafety.entity.Home;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public Home find(Integer id) {
        return entityManager.find(Home.class, id);
    }

    public void insert(Home home) {
        entityManager.persist(home);
    }

    public void update(Home home) {
        entityManager.persist(home);
    }

    public void delete(Home home) {
        entityManager.remove(home);
    }

}
