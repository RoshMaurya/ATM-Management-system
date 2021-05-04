<?php
 
    include 'atmconnection.php';
	
	$query="SELECT * FROM `bank_information`";

    $result=mysqli_query($conn,$query);
	
	mysqli_close($conn);


?>

<html>
	<head>
		<title>Bank Management</title>
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="table.css">
		
	</head>
	<body>
	
		<div class="topnav">
			<a href="#">Bank Name</a>
			<a href="dbaviewbank.php">View Bank</a>
			<a href="dbaviewcust.php">Customer Info</a>
			<a href="dbaviewbalance.php">Customer Balance</a>
			<a href="dbaaddbank.php">ADD BANK</a>
		</div>
		
		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	
			<input type="text" name="valuetosearch" placeholder="Search">
	  
			<input type="submit" name="search" value="Search">

			<br>
			<br>
	  
			<table>
			
				<tr>
					<th>bank_id</th>
					<th>ifsc_code</th>
					<th>bank_name</th>
					<th>branch_id</th>
					<th>branch_name</th>

				</tr>
		
				<?php while($row = mysqli_fetch_array($result)): ?>
					<tr>
						<th><?php echo $row['bank_id']; ?></th>
						<th><?php echo $row['ifsc_code']; ?></th>
						<th><?php echo $row['bank_name']; ?></th>
						<th><?php echo $row['branch_id']; ?></th>
						<th><?php echo $row['branch_name']; ?></th>


					</tr>
				<?php endwhile;?> 
		
			</table>
	  
		</form>
		
	
	</body>
  
</html>  