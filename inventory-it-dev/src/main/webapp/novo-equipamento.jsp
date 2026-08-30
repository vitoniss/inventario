<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Novo Equipamento</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <div class="bg-white p-4 rounded shadow">

        <h2>Cadastrar Equipamento</h2>

        <hr>

        <form action="${pageContext.request.contextPath}/equipamentos"
              method="post">

            <div class="mb-3">

                <label for="numeroSerie" class="form-label">
                    Número de Série
                </label>

                <input type="text"
                       id="numeroSerie"
                       name="numeroSerie"
                       class="form-control"
                       required>

            </div>

            <div class="mb-3">

                <label for="tipo" class="form-label">
                    Tipo
                </label>

                <input type="text"
                       id="tipo"
                       name="tipo"
                       class="form-control"
                       placeholder="Ex: PC, Projetor"
                       required>

            </div>

            <div class="mb-3">

                <label for="laboratorio_id" class="form-label">
                    Laboratório Alocado
                </label>

                <select id="laboratorio_id"
                        name="laboratorio_id"
                        class="form-select"
                        required>

                    <option value="">Selecione...</option>

                    <c:forEach var="lab" items="${laboratorios}">

                        <option value="${lab.id}">
                            ${lab.nome} - Bloco ${lab.bloco}
                        </option>

                    </c:forEach>

                </select>

            </div>

            <button type="submit" class="btn btn-primary">
                Salvar Equipamento
            </button>

            <a href="${pageContext.request.contextPath}/equipamentos"
               class="btn btn-secondary">
                Voltar
            </a>

        </form>

    </div>

</div>

</body>
</html>