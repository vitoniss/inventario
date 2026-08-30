package br.com.inventory.servlet;

import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.modelo.Laboratorio;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/laboratorios")
public class LaboratorioServlet extends HttpServlet {

    private final LaboratorioDAO laboratorioDAO = new LaboratorioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Laboratorio> laboratorios = laboratorioDAO.listarTodos();

        request.setAttribute("laboratorios", laboratorios);

        request.getRequestDispatcher("/laboratorios.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nome = request.getParameter("nome");
        String bloco = request.getParameter("bloco");

        Laboratorio laboratorio = new Laboratorio();
        laboratorio.setNome(nome);
        laboratorio.setBloco(bloco);

        laboratorioDAO.salvar(laboratorio);

        response.sendRedirect(request.getContextPath() + "/laboratorios");
    }
}