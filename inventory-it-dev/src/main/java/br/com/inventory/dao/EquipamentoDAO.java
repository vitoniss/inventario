package br.com.inventory.dao;

import br.com.inventory.modelo.Equipamento;
import jakarta.persistence.EntityManager;
import java.util.List;

public class EquipamentoDAO {

    public void salvar(Equipamento equipamento) {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(equipamento);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Equipamento> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT e FROM Equipamento e JOIN FETCH e.laboratorio ORDER BY e.id",
                    Equipamento.class
            ).getResultList();
        } finally {
            em.close();
        }
    }
}