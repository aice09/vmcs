<?php
include '../../environment.php';
include '../../config/database.php';

if (isset($_POST['submit_btn'])) {
	$petcat_name = $_POST["petcat_name"];
	$petcat_processdate = $currentdate;
	$petcat_processby = $_SESSION['system_userid'];
	$petcat_status = $_POST["petcat_status"];


    //Insert Data
    $query = "INSERT INTO pet_category (petcat_name, petcat_processdate, petcat_processby, petcat_status) VALUES ('$petcat_name', '$petcat_processdate', '$petcat_processby', '$petcat_status')";

		$response = array();
	if (!$result = mysqli_query($db,$query)) {
        $response=mysqli_error($db);
    } else {
        $response = 'ok';
    }
    echo json_encode($response);	
}

//Read Selected Job Ticket
if (isset($_POST['read_selected'])) {
    $id=$_POST['crud_id'];
    
    $query = "SELECT * FROM pet_category
    WHERE petcat_id = '$id'";
    if (!$result = mysqli_query($db,$query)) {
        exit(mysql_error());
    }
    $response = array();
    if(mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $response = $row;
        }
    }
    else
    {
        $response['status'] = 200;
        $response['message'] = "Data not found!";
    }
    echo json_encode($response);
}

//Update
if (isset($_POST['update_btn'])) {
    $id=$_POST['petcat_id'];
    $petcat_name = $_POST["petcat_name"];
    $petcat_processdate = $currentdate;
    $petcat_processby = $_SESSION['system_userid'];
    $petcat_status = $_POST["petcat_status"];

    $query = "UPDATE pet_category SET petcat_name = '$petcat_name', petcat_processdate = '$petcat_processdate', petcat_processby = '$petcat_processby', petcat_status = '$petcat_status' WHERE petcat_id = '$id'";

	if (!$result1 = mysqli_query($db,$query)) {
        exit(mysqli_error());
    }  
}

//Delete
if (isset($_POST["delete_selected"])) {
    /*
    Deleting a single record is done is not been implemented rather than we are changing the status to "Deleted" to keep the data hidden from the user.
    */

    $id=$_POST['crud_id'];
    $query = "UPDATE pet_category SET
    petcat_status = 'Deleted'
    WHERE petcat_id = '$id'";

    if (!$result = mysqli_query($db,$query)) {
        exit(mysql_error());
    } 
}

//Permanently Delete
if (isset($_POST["permanent_delete_selected"])) {
    $id=$_POST['crud_id'];
    $query = "DELETE FROM pet_category WHERE petcat_id = '$id'";

    if (!$result = mysqli_query($db,$query)) {
        exit(mysql_error());
    } 
}

?>