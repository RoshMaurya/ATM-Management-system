<?php
	include 'atmconnection.php';
	
	$sql="SELECT * FROM `bank_information`";
	
	$result1=mysqli_query($conn,$sql);
	
	mysqli_close($conn);
	
	 	if(isset($_POST['submit']))
{
	include 'atmconnection.php';
	
	$error = NULL;
	
    //Get form data
    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
    
    $bank_id = test_input($_POST["bank_id"]);
	
    $ifsc_code = test_input($_POST["ifsc_code"]);

    $bank_add = test_input($_POST["bank_add"]);
        
    $bank_name = test_input($_POST["bank_name"]);
	    
    $branch_id = test_input($_POST["branch_id"]); 
	
	$branch_name = test_input($_POST["branch_name"]); 

	$branch_location = test_input($_POST["branch_location"]); 


	
	// Check connection
	if ($conn) 
    {
	
		if(!mysqli_query($conn,"INSERT INTO `bank` (`bank_id`, `ifsc_code`, `bank_add`, `bank_name`) VALUES ('$bank_id', '$ifsc_code', '$bank_add', '$bank_name')"))
		{
				$error = "<br>Error = ".mysqli_error($conn) ;
		}
		if(!mysqli_query($conn,"INSERT INTO `branch` (`branch_id`, `branch_name`, `branch_location`, `bank_id`) VALUES ('$branch_id', '$branch_name', '$branch_location', '$bank_id')"))
		{
				$error = "<br>Error = ".mysqli_error($conn) ;
		}

		else
		{
			$error = "<br>Error = ".mysqli_error($conn) ;
		}
		
	 
    }
	else
	{
		$error=("Connection failed: " . mysqli_connect_error());
	}
	
	mysqli_close($conn);
	
	echo $error;
    
	if(is_null($error))
	{
		header('location:dbaviewbank.php');
	}
  
}
?>
<html>

  <head>
   <title>New Bank </title>
   <link rel="stylesheet" href="style.css">
  </head>
    <body>
  
		<div class="topnav">
			<a href="bank.php">Bank Name</a>
			<a href="dbaviewbank.php">View Bank</a>
			<a href="dbaviewcust.php">Customer Info</a>
			<a href="dbaviewbalance.php">Customer Balance</a>
			<a href="dbaaddbank.php">ADD BANK</a>
			<a href="dbaaddcust.php">ADD CUSTOMER</a>
		</div>
		
		
		<h1 align="center"> Bank Registration</h1>
 
		<form action="" method="POST" align="center">
		
			<table border="0" align="center" >
				

				<tr>
					<th>Enter Bank Name :</th>
					<td><input type="text" name="bank_name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" placeholder="*required" required></td>
				</tr>
				
				<tr>
					<th>Enter Bank_id :</th>
					<td><input type="tel" name="bank_id" placeholder="*required" required></td>
				</tr>
				<tr>
					<th>Enter ifsc_code :</th>
					<td><input type="text" name="ifsc_code" placeholder="*required" required></td>
				</tr>
				
				<tr>
					<th>Enter Bank Location :</th>
					<td><input type="text" name="bank_add" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" placeholder="*required" required></td>
				</tr>
				
				<tr>
					<th>Enter Branch_id :</th>
					<td><input type="tel" name="branch_id" placeholder="*required"  required></td>
				</tr>

				
				<tr>
					<th>Enter Branch Name :</th>
					<td><input type="text" name="branch_name" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" placeholder="*required" required></td>
				</tr>
				
				<tr>
					<th>Enter Branch location :</th>
					<td><input type="text" name="branch_location" onkeypress="return (event.charCode > 64 && event.charCode < 91) || (event.charCode > 96 && event.charCode < 123)" placeholder="*required" required></td>
				</tr>	
				
				<tr>
					<td colspan="2"><input type="submit" name="submit" value="Submit"></td>
				</tr>
				

			</table>
     
		</form>
   
	</body>
	
 </html>
 