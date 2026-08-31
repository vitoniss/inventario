package br.com.inventory.servlet;

import br.com.inventory.dao.EquipamentoDAO;
import br.com.inventory.dao.JPAUtil;
import br.com.inventory.modelo.Equipamento;
import br.com.inventory.modelo.Laboratorio;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/equipamentos", "/novo-equipamento"})
public class EquipamentoServlet extends HttpServlet {

```
private final EquipamentoDAO equipamentoDAO = new EquipamentoDAO();

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String caminho = request.getServletPath();

    if ("/novo-equipamento".equals(caminho)) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            List<Laboratorio> laboratorios = em.createQuery(
                    "SELECT l FROM Laboratorio l ORDER BY l.nome",
                    Laboratorio.class
            ).getResultList();

            request.setAttribute("laboratorios", laboratorios);

            String laboratorioId = request.getParameter("laboratorio_id");

            if (laboratorioId != null && !laboratorioId.isEmpty()) {

                Laboratorio laboratorioSelecionado = em.find(
                        Laboratorio.class,
                        Long.valueOf(laboratorioId)
                );

                request.setAttribute(
                        "laboratorioSelecionado",
                        laboratorioSelecionado
                );
            }

            request.getRequestDispatcher("/novo-equipamento.jsp")
                    .forward(request, response);

        } finally {
            em.close();
        }

    } else {

        List<Equipamento> equipamentos = equipamentoDAO.listarTodos();

        request.setAttribute("equipamentos", equipamentos);

        request.getRequestDispatcher("/equipamentos.jsp")
                .forward(request, response);
    }
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");

    String numeroSerie = request.getParameter("numeroSerie");
    String tipo = request.getParameter("tipo");
    String laboratorioId = request.getParameter("laboratorio_id");

    EntityManager em = JPAUtil.getEntityManager();

    try {
        Laboratorio laboratorio = em.find(
                Laboratorio.class,
                Long.valueOf(laboratorioId)
        );

        Equipamento equipamento = new Equipamento();

        equipamento.setNumeroSerie(numeroSerie);
        equipamento.setTipo(tipo);
        equipamento.setLaboratorio(laboratorio);

        em.getTransaction().begin();
        em.persist(equipamento);
        em.getTransaction().commit();

    } finally {
        em.close();
    }

    response.sendRedirect(
            request.getContextPath() + "/equipamentos"
    );
}
```

}
