<?php 
/*01*/    require_once("bd/conexao.php");
?>

<?php 
/*01*/    $altera = " ";
/*05*/    function alterar($conexao,&$altera,$aux,$produtoID){
/*05*/        $altera = "UPDATE documento SET ";
/*05*/        $altera.= " Concluido = {$aux} ";
/*05*/        $altera .= " WHERE ID = '{$produtoID}' ";
/*05*/        return mysqli_query($conexao, $altera);
/*05*/    }

/*01*/    if(isset($_GET["codigo"]))
/*02*/        $produtoID=$_GET["codigo"];
/*03*/    else
/*03*/        Header("location:inicial.php");
    
/*04*/    if(isset($_POST["estadoAuxilio"])){
/*05*/        $estado = $_POST["estadoAuxilio"] == "Em espera" ? 0 : 1; 
/*05*/        $alterando = alterar($conexao,$altera,$estado,$produtoID); 
/*05*/    }
/*06*/    $consulta="SELECT * FROM documento WHERE ID = {$produtoID}";
    
/*06*/    $detalhe=mysqli_query($conexao, $consulta);

/*06*/    if(!$detalhe)
/*08*/        die("FALHA NO BANCO DE DADOS");
/*09*/    else
/*09*/        $dados_detalhe=mysqli_fetch_assoc($detalhe);

/*10*/    $produtoID=$dados_detalhe["ID"];
/*10*/    $nome=$dados_detalhe["Nome"];
/*10*/    $data = $dados_detalhe["DataInicio"];
/*10*/    $concluido=$dados_detalhe["Concluido"];
?>



<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/main.css" >
   
    
    <meta charset="UTF-8"/>
    <title>Defensoria Pública</title>
    
    <script src="js/main.js"></script>
</head>
<body>
    
    <input type="checkbox" nome="bt_menu" id="bt_menu"> 
    <label for="bt_menu" >&#9776;</label>
    
    <header >
        <div class="teste">
           
            <div class="logo">
                <a href="http://www.defensoria.ce.def.br" target="_blank"><img src="img/logo-dpge.png" /></a>

            </div>
            <nav >
                <ul>
                    <li><a href="inicial.php">Solicitações</a></li>
                    <li><a href="sair.php">Alterar Acesso</a></li>
                    <li><a href="sair.php">Sair</a></li>
                </ul>  

            </nav>
        </div>
    </header>
    
    
    <main>
        <div class="princi">
            
            
            
            
            <div id="a">
               <?php echo "ID da solicitação: ", $produtoID; ?>
            </div>
            <div id="b">
               <?php echo "Solicitante: ", $nome; ?>
            </div>
            <div id="c">
                <?php 
                    $estado = $concluido == 0 ? "Em espera" : "Concluido";
                    echo "Estado do auxilio: ", $estado; 
                    ?>
            <div id="d">
                <?php echo "Data do pedido: ", $data; ?>
            </div>
            </div>
            <button>Gerar PDF</button>
            <form action="detalhar.php?codigo=<?php echo $produtoID; ?>" method="post">
                <label> Alterar Estado</label>
                <br>
                <!-- <input type="text" name="est" id="est" > -->
                <!-- <label for="estAuxilio">Estado do auxílio:</label> -->
                <select name="estadoAuxilio" id="estAuxilio">
                    <option value="Em espera">Em espera</option>
                    <option value="Concluido">Concluido</option>
                </select> <br>
                <input type="submit" name="btn" id="btn" value="Salvar modificações"><br>
                <!-- <button>Salvar modificações</button> -->
                <?php 
                if (isset($_POST["estadoAuxilio"])) 
                    echo "Estado selecionado: ", $_POST["estadoAuxilio"]; 
                ?>
            </form>
        </div>
    </main>
    
    
    <footer>
        <div class="nemo">
            <a href="http://www.nemo.ufc.br" target="_blank"> <img src="img/nemobranca.png"> </a>
        </div>
    </footer>
    <script src="js/jquery-3.5.min.js"></script>
    
    
</body>
</html>