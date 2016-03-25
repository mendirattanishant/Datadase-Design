<body>
    <h1>PIZZA PRICE</h1>
    
    <p>
        <?php
            $sum = 0;
            try {
                // Connect to the database.
                $con = new PDO("mysql:host=localhost;dbname=floatingPoints",                               
                               "floatingPoints", "root");
                $con->setAttribute(PDO::ATTR_ERRMODE,
                                   PDO::ERRMODE_EXCEPTION);
                if(!empty($_POST['toppings'])) {
                    foreach($_POST['toppings'] as $check) {
                        $price = "Select price from pizza where Ingredient = '$check'";
                        $result = $con->query($price);
                        $row = $result->fetch(PDO::FETCH_ASSOC);
                        foreach ($row as $key => $value) {
                            $sum = $sum + $value;
                        }
                    }
                }
                if (isset($_POST['size'])) {

                    $selected_radio = $_POST['size'];
                    if($selected_radio == 'small') {
                        $sum = $sum + 7;
                    } elseif($selected_radio == 'medium') {
                        $sum = $sum + 10;
                    } elseif($selected_radio == 'large') {
                        $sum = $sum + 11;
                    }

                }

                if (isset($_POST['cheese'])) {

                    $cheeze = $_POST['cheese'];
                    if($cheeze == 'yes') {
                        $sum = $sum + 3;
                    } elseif($cheeze == 'no') {
                        $sum = $sum;
                    } 

                }

                echo $sum;

            }
            catch(PDOException $ex) {
                echo 'ERROR: '.$ex->getMessage();
            }  

        ?>
    </p>
</body>
