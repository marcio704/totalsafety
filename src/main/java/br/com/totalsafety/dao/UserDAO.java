package br.com.totalsafety.dao;

import br.com.totalsafety.entity.User;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {

    @PersistenceContext
    private EntityManager entityManager;

    public User find(Integer id) {
        return entityManager.find(User.class, id);
    }

    public void insert(User user) {
        entityManager.persist(user);
        entityManager.flush();
    }

    public void update(User user) {
        entityManager.merge(user);
        entityManager.flush();

    }

    public void delete(User user) {
        entityManager.remove(user);
        entityManager.flush();
    }

    @SuppressWarnings("unchecked")
    public List<User> findAll() {
        return entityManager.createQuery("SELECT u FROM User u").getResultList();
    }

    public User findByNameAndPassword(User user) {

        Query query = entityManager.createNamedQuery("User.findByNameAndPassword")
                .setParameter("name", user.getName()).setParameter("password", user.getPassword());
        try {
            return (User) query.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    public List<User> findByEmail(User user) {
        Query query = entityManager.createNamedQuery("User.findByEmail")
                .setParameter("email", user.getEmail());
        try {
            return  query.getResultList();
        } catch (Exception e) {
            return null;
        }
    }
}
