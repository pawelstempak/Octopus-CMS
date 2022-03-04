<!DOCTYPE html>
<html lang="pl">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Octopus Installation</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="../common/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
    <nav class="grey darken-2" role="navigation">
        <div class="nav-wrapper container center"><a id="logo-container" href="{$PATH}" class="logo">Octopus Install Process</a></div>
    </nav>
<?php
if(
    !empty($_POST['save']) &&
    !empty($_POST['database_url']) &&
    !empty($_POST['database_name']) &&
    !empty($_POST['database_user']) &&
    !empty($_POST['database_user_password']) &&
    !empty($_POST['user_name']) &&
    !empty($_POST['user_lastname']) &&
    !empty($_POST['user_email']) &&
    !empty($_POST['user_password'])
  )
{
$db_file_content  = "<?php
\$cfg[\'database_url\'] = \'".$_POST['database_url']."\';
\$cfg[\'database_name\'] = \'".$_POST['database_name']."\';
\$cfg[\'database_login\'] = \'".$_POST['database_user']."\';
\$cfg[\'database_password\'] = \'".$_POST['database_user_password']."';";

$fileopen = fopen("../db.php", "w");
fputs($fileopen, stripslashes($db_file_content));
fclose($fileopen);

require_once '../db.php';
require_once '../common/db_con.php';
require_once 'import_db.php';

?>
    <section class="greetings">
        <div class="container center">
            <h1>That's all!</h1>
            <p class="greetings">
                You can start <a href="../backend.php">here</a> or read more about on <a href="https://github.com/pawelstempak/Octopus" target="_blank">GitHub</a>.<br ><br >
            </p>
            <div class="card-panel grey lighten-1">
                <span class="white-text">
                    AND SOMETHING IMPORTANT TO THE END<br>
                    Delete the 'INSTALL' folder from root folder, for security reason.
                </span>
            </div>
        </div>
    </section>
<?php
}
else
{
?>
    <section class="greetings">
        <div class="container center">
            <h1>Greetings!</h1>
            <p>
            Thank you for choosing Octopus CMS. Read bottom instruction and if you have any nstallation problem you can read FAQ on <a href="https://github.com/pawelstempak/Octopus" target="_blank">GitHub</a>.
            </p>
            <div class="card-panel grey lighten-1 left-align">
                <span class="white-text">
                    IMPORTANT<br />
                    1. Create Database and Database User on your hosting<br />
                    2. Make sure your script has permissions to read and write root folder<br />
                    3. Fill gaps bellow - all of them are required<br />
                    4. Click Install button
                </span>
            </div>
        </div>
    </section>
    <section>
        <div class="container center">
        <form class="col s12" action="install.php" method="post">
            <div class="section">
                <div class="row">
                    <div class="col s12 m6 l6">
                        <h1>
                            Database Connection Settings
                        </h1>
                        <p>
                            <div class="input-field">
                                <input placeholder="ex. 127.0.0.1 or localhost" id="database_url" type="text" class="validate" name="database_url" required>
                                <label for="database_url">Database address</label>
                            </div>
                            <div class="input-field">
                                <input id="database_name" type="text" class="validate" name="database_name" required>
                                <label for="database_name">Database name</label>
                            </div>
                            <div class="input-field">
                                <input id="database_user" type="text" class="validate" name="database_user" required>
                                <label for="database_user">Database user name</label>
                            </div>
                            <div class="input-field">
                                <input id="database_user_password" type="password" class="validate" name="database_user_password" required>
                                <label for="database_user_password">Database user password</label>
                            </div>
                        </p>
                    </div>
                    <div class="col s12 m6 l6">
                        <h1>
                            Administrator Settings
                        </h1>
                        <p>
                        <div class="input-field">
                                <input id="user_name" type="text" class="validate" name="user_name" required>
                                <label for="user_name">Firstname</label>
                            </div>
                            <div class="input-field">
                                <input id="user_lastname" type="text" class="validate" name="user_lastname" required>
                                <label for="user_lastname">Lastname</label>
                            </div>
                            <div class="input-field">
                                <input placeholder="Use for sign in process" id="user_email" type="text" class="validate" name="user_email" required>
                                <label for="user_email">E-mail</label>
                            </div>
                            <div class="input-field">
                                <input id="user_password" type="password" class="validate" name="user_password" required>
                                <label for="user_password">User password</label>
                            </div>
                        </p>
                    </div>
                </div>
            </div>
            <button class="btn waves-effect waves-light grey darken-3" type="submit" name="save" value="submit_value">Install</button>
        </form>
        </div>
    </section>
<?php
}
?>
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../common/materialize/js/materialize.min.js"></script>
</body>
</html>