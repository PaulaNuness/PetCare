<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon" href="/icon.ico" type="image/x-icon">
</head>
<body>

    <script>
    
    //funcao para criar uma tabela
    function criarTabela(container, colunas) {
        // Verifica se o container existe
        var containerElement = document.getElementById(container);
        if (!containerElement) {
            console.error("O container especificado não foi encontrado.");
            return;
        }

        // Cria a tabela
        var tabela = document.createElement('table');
        tabela.classList.add('table', 'table-bordered'); // Adiciona classes do Bootstrap para estilizar a tabela
        var cabecalho = document.createElement('thead');
        var corpo = document.createElement('tbody');
        var cabecalhoRow = document.createElement('tr');

        // Adiciona as colunas fornecidas ao cabeçalho
        colunas.forEach(function(coluna) {
            var th = document.createElement('th');
            th.textContent = coluna.name;
            cabecalhoRow.appendChild(th);
        });

        // Adiciona uma coluna vazia ao início se desejado
        var thEmpty = document.createElement('th');
        cabecalhoRow.insertBefore(thEmpty, cabecalhoRow.firstChild);

        cabecalho.appendChild(cabecalhoRow);
        tabela.appendChild(cabecalho);
        tabela.appendChild(corpo);
        containerElement.appendChild(tabela);

        // Retorna a tabela criada para manipulá-la posteriormente, se necessário
        return tabela;
    }

///////////////////////////////////////////////////////////////////////////////////////////////////////   

var idCheckbox; // Variável para armazenar o ID do checkbox clicado

//funcao para preencher a atbela con datos
function preencherTabelaComDados(tabela, dados) {
    // Encontra o corpo da tabela
    var corpo = tabela.querySelector('tbody');

    // Limpa o conteúdo existente do corpo da tabela
    corpo.innerHTML = '';

    // Preenche a tabela com os dados
    dados.forEach(function(item) {
        // Verifica se o item está ativo(quando o adm quer eliminar um dato de la tabla ele coloca o atributo estaActivo como false, quer dizer, foi eliminado)
        if (item.estaActivo === false) {
            return; // Se não estiver ativo, pula para a próxima iteração do loop
        }

        var row = document.createElement('tr');

        // Adiciona um checkbox a cada linha
        var checkboxCell = document.createElement('td');
        var checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.addEventListener('click', function(event) {
            // Desmarca todos os outros checkboxes na tabela
            var checkboxes = tabela.querySelectorAll('input[type="checkbox"]');
            checkboxes.forEach(function(cb) {
                if (cb !== checkbox) {
                    cb.checked = false;
                }
            });
            // Define a ação que deseja executar quando o checkbox é clicado
            idCheckbox = item[colunas[0].field]; // Armazena o ID do item
            console.log("ID do último checkbox clicado:", idCheckbox);
            //alert(item[colunas[0].field]); // Exemplo: exibe o valor do primeiro campo da linha
            // Impede a propagação do evento de clique para evitar que a linha seja selecionada ao clicar no checkbox
            event.stopPropagation();
        });

        checkboxCell.appendChild(checkbox);
        row.appendChild(checkboxCell);

        // Adiciona os dados restantes às colunas
        colunas.forEach(function(coluna) {
            var cell = document.createElement('td');
            cell.textContent = item[coluna.field]; // Acessa o valor do campo do objeto de dados usando a propriedade field
            row.appendChild(cell);
        });

        corpo.appendChild(row);
    });
}


///////////////////////////////////////////////////////////////////////////////////////////////////////  

    </script> 
</body>
</html>