<?php 
/*01*/    require_once("bd/conexao.php");
?>
<?php 
/*01*/    session_start();

/*01*/    if(!isset($_SESSION["usuario"]))
/*02*/        header("location:login.php");

/*03*/    $produto="SELECT * FROM documento";
/*03*/    $result=mysqli_query($conexao,$produto);

/*03*/    $pagina = (isset($_GET['pagina']))? $_GET['pagina'] : 1; 
/*03*/    $total = mysqli_num_rows($result); 
/*03*/    $registros = 10;
/*03*/    $numPaginas = ceil($total/$registros); 
/*03*/    $inicio = ($registros*$pagina)-$registros; 
/*03*/    $produto = "SELECT * FROM documento ";

/*05*/    function pesqNome(&$produto,$aux){
/*05*/        $produto .= " WHERE Nome LIKE '%{$aux}%' ";
/*05*/    }

/*07*/    function pesqID (&$produto,$aux){
/*07*/        if (is_numeric($aux))
/*07*/            $produto .= " and ID = {$aux}";
/*07*/    }

/*13*/    function pesqConcl(&$produto,$aux){
/*13*/        $produto .= " WHERE Concluido IN ({$aux}) ";
/*13*/    }

/*15*/    function pesqEspera(&$produto,$aux){
/*15*/        $produto .= " WHERE Concluido IN ({$aux}) ";
/*15*/    }

/*04*/    if(isset($_GET["pesquisa"]))
/*05*/        pesqNome($produto,$_GET["pesquisa"]);

/*06*/    if(isset($_GET["pesquisaID"]))
/*07*/        pesqID($produto,$_GET["pesquisaID"]);

/*08*/    if (isset($_GET["estadoAuxilio"]) && $_GET["estadoAuxilio"] == "Em espera")
/*09*/        $produto .= " and Concluido = 0 ";

/*10*/    if (isset($_GET["estadoAuxilio"]) && $_GET["estadoAuxilio"] == "Concluido")
/*11*/        $produto .= " and Concluido = 1 ";
    
/*12*/    if(isset($_GET["concl"]))
/*13*/        pesqConcl($produto,1);  
    
/*14*/    if(isset($_GET["espera"]))
/*15*/        pesqEspera($produto,0);

/*15*/    if (isset($_GET["dataAuxilio"]) && $_GET["dataAuxilio"] != '')
/*15*/        $produto .= " and DataInicio = '{$_GET["dataAuxilio"]}' ";

/*16*/    $produto .= " limit $inicio,$registros";

/*16*/    $result = mysqli_query($conexao,$produto);
/*16*/    $total = mysqli_num_rows($result); 

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
                    <li><a href="AlterarSenha.php">Alterar senha</a></li>
                    <li><a href="sair.php">Sair</a></li>
                </ul>  

            </nav>
        </div>
    </header>
    
    
    <main>
        <div class="pesquisar">
            <form action="inicial.php" method="get"> 
                <input type="text" name="pesquisa" id="pesquisa" placeholder="Digite o Nome">
                <input type="image" name="nome" id="nome" src="img/l.png" >
                <input type="number" name="pesquisaID" id="pesquisaID" placeholder="Digite o ID">

                <br>
                <label for="estAuxilio">Estado do auxílio:</label>
                <select name="estadoAuxilio" id="estAuxilio">
                    <option value="Todos">Todos</option>
                    <option value="Em espera">Em espera</option>
                    <option value="Concluido">Concluido</option>
                </select>
                <br>
                <label for="dataAuxilio">Data do auxilio:</label>
                <input type="date" id="dataAuxilio" name="dataAuxilio">
            </form>
             <?php echo $produto; ?>
             <br>
            <?php 
                if (isset($_GET["pesquisaID"]))
                    echo "Pesquisando ID: ", $_GET["pesquisaID"]; 
            ?>
            <br>
            <?php 
                if (isset($_GET["estadoAuxilio"]))
                    echo "Estado selecionado: ", $_GET["estadoAuxilio"]; 
            ?>
            <br>
            <?php 
                if (isset($_GET["dataAuxilio"]))
                    echo "Data selecionada: ", $_GET["dataAuxilio"]; 
            ?>
        </div>
        <div class="principal">
            <div id="lista">
                <?php while ($prod = mysqli_fetch_array($result)) { ?>
                <ul>
                    <li> <?php echo   $prod["Nome"]; ?> </li>
                    <?php 
                        if($prod["Concluido"] == "1"){
                        ?>
                        <li> Concluido </li>
                        <?php
                        }
                        else{
                        ?>
                        <li>   Em Espera </li>
                        <?php
                        }
                    ?>
                    
                    <li> <a href="detalhar.php?codigo=<?php echo $prod['ID']; ?>"> Expandir</a> </li>
                </ul>
                <?php 
                    }
                ?>
                
                <?php 
                    for($i = 1; $i < $numPaginas + 1; $i++) { 
                        echo "<a href='inicial.php?pagina=$i'>" .$i. "</a>"; 
                    } 
                ?>
            </div>
            <div id="men">
                <form action="inicial.php" method="get"> 
                    <button for="con" type="submit" name="concl"><h3>Concluídos</h3> 
                    </button><br>
                </form>
                <form action="inicial.php" method="get">
                    <button type="submit" name="espera"><h3>Em Espera</h3>
                    </button><br>
                </form>
               
               
            </div>
        </div>
    </main>
    <footer>
        <div class="nemo">
            <a href="http://www.nemo.ufc.br" target="_blank"> <img src="img/nemopreta.png"> </a>
        </div>
    </footer>
    <script src="js/jquery-3.5.min.js"></script>
    
    
    
    
</body>

</html>
