<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Equipamentos - Inventory IT</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2>Equipamentos</h2>
            <p class="text-muted mb-0">
                Equipamentos cadastrados e seus respectivos laboratórios.
            </p>
        </div>

        <div>
            <a href="${pageContext.request.contextPath}/"
               class="btn btn-secondary">
                Início
            </a>

            <a href="${pageContext.request.contextPath}/novo-equipamento"
               class="btn btn-primary">
                Novo Equipamento
            </a>
        </div>

    </div>

    <div class="card shadow-sm">

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-striped table-hover align-middle">

                    <thead class="table-dark">

                    <tr>
                        <th>ID</th>
                        <th>Número de Série</th>
                        <th>Tipo</th>
                        <th>Laboratório</th>
                        <th>Bloco</th>
                    </tr>

                    </thead>

                    <tbody>

                    <c:forEach var="equipamento" items="${equipamentos}">

                        <tr>

                            <td>${equipamento.id}</td>

                            <td>${equipamento.numeroSerie}</td>

                            <td>${equipamento.tipo}</td>

                            <td>${equipamento.laboratorio.nome}</td>

                            <td>${equipamento.laboratorio.bloco}</td>

                        </tr>

                    </c:forEach>

                    <c:if test="${empty equipamentos}">

                        <tr>

                            <td colspan="5"
                                class="text-center text-muted py-4">

                                Nenhum equipamento cadastrado.

                            </td>

                        </tr>

                    </c:if>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>

</body>
</html>