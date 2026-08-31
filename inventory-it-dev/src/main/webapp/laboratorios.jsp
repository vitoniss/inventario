<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

```
<title>Laboratórios - Inventory IT</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">
```

</head>

<body class="bg-light">

<div class="container py-5">

```
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h1 class="fw-bold">Laboratórios</h1>
        <p class="text-muted mb-0">
            Cadastre e visualize os laboratórios da instituição.
        </p>
    </div>
</div>

<div class="card shadow-sm mb-4">
    <div class="card-body">

        <h5 class="card-title mb-3">Cadastrar laboratório</h5>

        <form action="${pageContext.request.contextPath}/laboratorios"
              method="post">

            <div class="row g-3">

                <div class="col-md-8">
                    <label for="nome" class="form-label">
                        Nome do laboratório
                    </label>

                    <input type="text"
                           class="form-control"
                           id="nome"
                           name="nome"
                           required>
                </div>

                <div class="col-md-4">
                    <label for="bloco" class="form-label">
                        Bloco
                    </label>

                    <input type="text"
                           class="form-control"
                           id="bloco"
                           name="bloco"
                           required>
                </div>

            </div>

            <div class="mt-3">
                <button type="submit" class="btn btn-primary">
                    Salvar laboratório
                </button>
            </div>

        </form>

    </div>
</div>

<div class="card shadow-sm">
    <div class="card-body">

        <h5 class="card-title mb-3">Laboratórios cadastrados</h5>

        <div class="table-responsive">

            <table class="table table-striped table-hover align-middle">

                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Bloco</th>
                    <th>Ações</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach var="laboratorio" items="${laboratorios}">

                    <tr>
                        <td>${laboratorio.id}</td>
                        <td>${laboratorio.nome}</td>
                        <td>${laboratorio.bloco}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/novo-equipamento?laboratorio_id=${laboratorio.id}"
                               class="btn btn-success btn-sm">
                                Cadastrar equipamento
                            </a>
                        </td>
                    </tr>

                </c:forEach>

                <c:if test="${empty laboratorios}">
                    <tr>
                        <td colspan="4" class="text-center text-muted py-4">
                            Nenhum laboratório cadastrado.
                        </td>
                    </tr>
                </c:if>

                </tbody>

            </table>

        </div>

    </div>
</div>
```

</div>

</body>
</html>
