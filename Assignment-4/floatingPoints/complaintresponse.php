<?php

$complaint_id = $_POST['c_id'];

$con = new PDO("mysql:host=localhost;dbname=floatingPoints", "floatingPoints", "root");

$con->setAttribute(PDO::ATTR_ERRMODE,
                       PDO::ERRMODE_EXCEPTION);

$query = "Select cp.complaint_id, timely_response,status, date_received, csr.response as consumer_response ,pr.response as public_response,c.company_name from Complaints cp join Response rp on cp.complaint_id= rp.complaint_id join Company c on c.company_id=rp.company_id join Public_Response pr on pr.public_response_id = rp.public_response_id join Consumer_Response csr on csr.consumer_response_id = rp.consumer_response_id where cp.complaint_id = :complaint_id";

$ps = $con->prepare($query);

$ps->execute(array(':complaint_id' => $complaint_id));
$data = $ps->fetchAll(PDO::FETCH_ASSOC);
?>
<table border="1">
	<th>
		<td>Complaint ID</td>
		<td>Timely Response</td>
		<td>Status</td>
		<td>Date Received</td>
		<td>Consumer response</td>
		<td>Public response</td>
		<td>Company Name</td>
	</th>
	<?php foreach($data as $row){ ?>
		<tr>
			<td></td>
	        <td><?php echo $row['complaint_id'];  ?></td>
	        <td><?php echo $row['timely_response'];  ?></td>
	        <td><?php echo $row['status'];  ?></td>
	        <td><?php echo $row['date_received'];  ?></td>
	        <td><?php echo $row['consumer_response'];  ?></td>
	        <td><?php echo $row['public_response'];  ?></td>
	        <td><?php echo $row['company_name'];  ?></td>
        </tr>
	<?php } ?>
</table>