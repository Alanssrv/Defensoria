<?php 
/*01*/    require_once("bd/conexao.php");
?>

<?php 
/*01*/    session_start();
/*01*/    $consulta = " ";
/*02*/    function AltSenha ($conexao, &$consulta, $usu, $pass){
/*02*/        $consulta .= "UPDATE acesso SET";
/*02*/        $consulta .= " pass = '{$pass}'";
/*02*/        $consulta .= " WHERE user = '{$usu}' and pass = '{$_SESSION["senha"]}'";
/*02*/        $_SESSION["senha"] = $pass;
/*02*/        return mysqli_query($conexao, $consulta);
/*02*/    }

/*01*/    if (isset($_GET["btn"]) && $_SESSION["senha"] == $_GET["senhaAtual"]){
/*02*/        $resAltsenha = AltSenha($conexao, $consulta, $_SESSION["usuario"], $_GET["novaSenha"]);
/*01*/    }

/*03*/    $consulta="SELECT * FROM acesso WHERE user = '{$_SESSION["usuario"]}'";
    
/*03*/    $detalhe=mysqli_query($conexao, $consulta);
/*03*/    if(!$detalhe)
/*04*/        die("FALHA NO BANCO DE DADOS"); 
/*05*/    else    
/*05*/        $dados_detalhe=mysqli_fetch_assoc($detalhe);

/*05*/    $usuario=$dados_detalhe["user"];
/*05*/    $senha=$dados_detalhe["pass"];
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
        <div class="altSenha">   
            <form action="AlterarSenha.php" method="get"> 
                <input type="password" name="senhaAtual" id="senhaAtual" placeholder="Senha atual" pattern="([A-Za-z0-9]{1,15})+" title="A senha deve conter apenas letras e números"><br>
                <input type="password" name="novaSenha" id="novaSenha" placeholder="Nova senha" pattern="([A-Za-z0-9]{1,15})+" title="A senha deve conter apenas letras e números"><br>
                <input type="submit" name="btn" id="btn" value="Alterar"><br>
                <?php 
                    if (isset($resAltsenha))
                        echo $resAltsenha ? "Senha alterada com sucesso!" : "Falha ao alterar senha!" ?><br>
                <?php echo "User:", $_SESSION["usuario"]; ?><br>
                <?php echo "Senha:", $_SESSION["senha"]; ?><br>
            </form> 
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