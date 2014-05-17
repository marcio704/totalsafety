package br.com.totalsafety.dao;

import br.com.totalsafety.entity.About;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class AboutDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public About find(Integer id) {
        return entityManager.find(About.class, id);
    }

    public void insert(About contact) {
        entityManager.persist(contact);
    }

    public void update(About contact) {
        entityManager.merge(contact);
    }

    public void delete(About contact) {
        entityManager.remove(contact);
    }

}
