<?php

$username = $_POST['name'];

$con = new PDO("mysql:host=localhost;dbname=floatingPoints", "floatingPoints", "root");

$con->setAttribute(PDO::ATTR_ERRMODE,
                       PDO::ERRMODE_EXCEPTION);
            
$query = "Select cp.complaint_id, name, email, date_of_birth, contact_number, address, status, date_received from Consumer co join Complaints cp on cp.consumer_id= co.consumer_id where name LIKE ?";
$params = array("$username%");
$stmt = $con->prepare($query);
$stmt->execute($params);
// $ps = $con->prepare($query);

#$ps->execute(array(':username' => $username));
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<table border="1">
	<th>
		<td>Complaint ID</td>
		<td>Name</td>
		<td>Email</td>
		<td>DOB</td>
		<td>Contact Number</td>
		<td>Address</td>
		<td>Status</td>
		<td>Date Received</td>
	</th>
	<?php foreach($data as $row){ ?>
		<tr>
			<td></td>
	        <td><?php echo $row['complaint_id'];  ?></td>
	        <td><?php echo $row['name'];  ?></td>
	        <td><?php echo $row['email'];  ?></td>
	        <td><?php echo $row['date_of_birth'];  ?></td>
	        <td><?php echo $row['contact_number'];  ?></td>
	        <td><?php echo $row['address'];  ?></td>
	        <td><?php echo $row['status'];  ?></td>
	        <td><?php echo $row['date_received'];  ?></td>
        </tr>
	<?php } ?>
</table>