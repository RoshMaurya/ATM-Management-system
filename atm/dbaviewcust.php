<?php
 
    include 'atmconnection.php';
	
	$query="SELECT * FROM `customer_info`";

    $result=mysqli_query($conn,$query);
	
	mysqli_close($conn);


?>

<html>
	<head>
		<title>Customer detailss</title>
			<link rel="stylesheet" href="style.css">
			<link rel="stylesheet" href="table.css">

	</head>
	<body>
		<div class="topnav">
			<a href="#">Bank Name</a>
			<a href="dbaviewbank.php">View Bank</a>
			<a href="dbaviewcust.php">Customer Info</a>
			<a href="dbaviewbalance.php">Customer Balance</a>
		</div>
	
	
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	
			<input type="text" name="valuetosearch" placeholder="Search">
	  
			<input type="submit" name="search" value="Search">

			<br>
			<br>
	  
			<table>
			
				<tr>
					<th>c_id</th>
					<th>card_no</th>
					<th>f_name</th>
					<th>m_name</th>
					<th>l_name</th>
					<th>c_add</th>
					<th>c_phone</th>


				</tr>
		
				<?php while($row = mysqli_fetch_array($result)): ?>
					<tr>
						<th><?php echo $row['c_id']; ?></th>
						<th><?php echo $row['card_no']; ?></th>
						<th><?php echo $row['f_name']; ?></th>
						<th><?php echo $row['m_name']; ?></th>
						<th><?php echo $row['l_name']; ?></th>
						<th><?php echo $row['c_add']; ?></th>
						<th><?php echo $row['c_phone']; ?></th>

					</tr>
				<?php endwhile;?> 
		
			</table>
	  
		</form>
		
	
	</body>
  
</html>  