package br.com.inventory.dao;

import br.com.inventory.modelo.Laboratorio;
import jakarta.persistence.EntityManager;
import java.util.List;

public class LaboratorioDAO {

    public void salvar(Laboratorio laboratorio) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(laboratorio);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Laboratorio> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT l FROM Laboratorio l ORDER BY l.nome",
                    Laboratorio.class
            ).getResultList();
        } finally {
            em.close();
        }
    }
}