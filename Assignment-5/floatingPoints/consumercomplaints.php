<?php

$username = $_POST['name'];

class CustomerComplaints
{
	private $complaint_id;
	private $name;
	private $email;
	private $date_of_birth;
	private $contact_number;
	private $address;
	private $status;
	private $date_received;

	public function getcomplaintId()     { return $this->complaint_id; }
	public function getName()  { return $this->name; }
	public function getEmail()   { return $this->email; }
	public function getDob() { return $this->date_of_birth; }
	public function getContactNumber() { return $this->contact_number; }
	public function getAddress() { return $this->address; }
	public function getStatus() { return $this->status; }
	public function getDateRecd() { return $this->date_received; }
}


$con = new PDO("mysql:host=localhost;dbname=floatingPoints", "floatingPoints", "root");

$con->setAttribute(PDO::ATTR_ERRMODE,
                       PDO::ERRMODE_EXCEPTION);
            
$query = "Select cp.complaint_id, name, email, date_of_birth, contact_number, address, status, date_received from Consumer co join Complaints cp on cp.consumer_id= co.consumer_id where name LIKE ?";
$params = array("$username%");
$stmt = $con->prepare($query);
$stmt->execute($params);

$stmt->setFetchMode(PDO::FETCH_CLASS, "CustomerComplaints");

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
	<?php while($consumerComplaints = $stmt->fetch()){ ?>
		<tr>
			<td></td>
	        <td><?php echo $consumerComplaints->getcomplaintId();  ?></td>
	        <td><?php echo $consumerComplaints->getName();  ?></td>
	        <td><?php echo $consumerComplaints->getEmail();  ?></td>
	        <td><?php echo $consumerComplaints->getDob();  ?></td>
	        <td><?php echo $consumerComplaints->getContactNumber();  ?></td>
	        <td><?php echo $consumerComplaints->getAddress(); ?></td>
	        <td><?php echo $consumerComplaints->getStatus();  ?></td>
	        <td><?php echo $consumerComplaints->getDateRecd();  ?></td>
        </tr>
	<?php } ?>
</table>