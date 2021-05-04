<?php
 
    include 'atmconnection.php';
	
	$query="SELECT * FROM `customer_balance`";

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
					
					<th>CARD_NO</th>
					<th>F_NAME</th>
					<th>L_NAME</th>
					<th>balance</th>
					
				</tr>
		
				<?php while($row = mysqli_fetch_array($result)): ?>
					<tr>						
						<th><?php echo $row['CARD_NO']; ?></th>
						<th><?php echo $row['F_NAME']; ?></th>						
						<th><?php echo $row['L_NAME']; ?></th>
						<th><?php echo $row['balance']; ?></th>

					</tr>
				<?php endwhile;?> 
		
			</table>
	  
		</form>
		
	
	</body>
  
</html>  