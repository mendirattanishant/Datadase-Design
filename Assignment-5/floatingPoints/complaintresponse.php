<?php

class ComplaintDetails
{
	private $complaint_id;
	private $timely_response;
	private $status;
	private $date_received;
	private $consumer_response;
	private $public_response;
	private $company_name;

	public function getcomplaintId()     { return $this->complaint_id; }
	public function getTimelyResponse()  { return $this->timely_response; }
	public function getStatus()   { return $this->status; }
	public function getDateRecd() { return $this->date_received; }
	public function getConsumerResponse() { return $this->consumer_response; }
	public function getPublicResponse() { return $this->public_response; }
	public function getCompanyName() { return $this->company_name; }
}

$complaint_id = $_POST['c_id'];

$con = new PDO("mysql:host=localhost;dbname=floatingPoints", "floatingPoints", "root");

$con->setAttribute(PDO::ATTR_ERRMODE,
                       PDO::ERRMODE_EXCEPTION);

$query = "Select cp.complaint_id, timely_response,status, date_received, csr.response as consumer_response ,pr.response as public_response,c.company_name from Complaints cp join Response rp on cp.complaint_id= rp.complaint_id join Company c on c.company_id=rp.company_id join Public_Response pr on pr.public_response_id = rp.public_response_id join Consumer_Response csr on csr.consumer_response_id = rp.consumer_response_id where cp.complaint_id = :complaint_id";

$ps = $con->prepare($query);

$ps->execute(array(':complaint_id' => $complaint_id));
$ps->setFetchMode(PDO::FETCH_CLASS, "ComplaintDetails");
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
	<?php while($complaintDetails = $ps->fetch()){ ?>
		<tr>
			<td></td>
	        <td><?php echo $complaintDetails->getcomplaintId();  ?></td>
	        <td><?php echo $complaintDetails->getTimelyResponse();  ?></td>
	        <td><?php echo $complaintDetails->getStatus();  ?></td>
	        <td><?php echo $complaintDetails->getDateRecd();  ?></td>
	        <td><?php echo $complaintDetails->getConsumerResponse();  ?></td>
	        <td><?php echo $complaintDetails->getPublicResponse();  ?></td>
	        <td><?php echo $complaintDetails->getCompanyName();  ?></td>
        </tr>
	<?php } ?>
</table>