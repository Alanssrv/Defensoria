<?php 
    require_once("bd/conexao.php");
?>
<?php 
    session_start();

    function validar(&$conexao){
        if(isset($_POST["user"])){
            $user= $_POST["user"];
            $pass = $_POST["pass"];

            $login="SELECT * FROM acesso WHERE user = '{$user}' and pass = '{$pass}'";

            $acesso = mysqli_query($conexao,$login);
            if(!$acesso){
                die("Falha na consulta ao banco");
            }

            $informacao = mysqli_fetch_assoc($acesso);

            if(empty($informacao)){
                $mensagem = "Usuario ou Senha invalidos.";
            }else{
                $_SESSION["usuario"]=$informacao["user"];
                $_SESSION["senha"]=$informacao["pass"];
                header("location:inicial.php");
            }
        } 
    }
    
    validar($conexao);
?>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/log.css" >
    
    <meta charset="UTF-8"/>
    <title>Defensoria Pública</title>
    <script src="js/login.js"></script>
    
</head>
<body>
    
    <div class="logo" >
        <a href="http://www.defensoria.ce.def.br" target="_blank"><img src="img/logo-dpge.png" /></a>
    </div>

    <main>
        <div class="titulo"><h3>Faça Login</h3></div>
         
        <form action="login.php" method="post">
            <div class="user">
                <label for="nome"><h3>Usuário:</h3></label>
                <input type="text" id="nome" name="user" autofocus required />
            </div>
            <div class="pass">
                <label for="senha"><h3>Senha:</h3></label>
                <input type="password" id="senha" name="pass" required />
            </div>
            <div class="but">
                <button type="submit"><h3>Acessar</h3></button>
            </div>
             
            
            
        </form>
       
    </main>
    <div class="nemo">
        <a href="http://www.nemo.ufc.br" target="_blank"> 
            <img src="img/nemopreta.png" />
        </a>
    </div>
    
   
    <script src="js/jquery-3.5.min.js"></script>

</body>