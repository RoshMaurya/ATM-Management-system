<html>
	<head>
		<title>DBA Login Page</title>
		<link rel="stylesheet" href="style.css">
		<style>
			body 
			{
				 background-image: url("bank2.jpg");
				 
				 background-position: center;
				 background-repeat: no repeat;
				 background-size: cover;
			}
		</style>
	</head>
	<body>
 		<h1 align="center"><u> DBA Login</u></h1>
		<form action="" method="POST" align="center">
			
			<table border="0" align="center" cellpadding="5">
				
				<tr>
					<th align="right"><b>User Name :</b></th>
					<td><input type="text" name="usr" placeholder="* Required" required></td>
				</tr>
				
				<tr>
				<th align="right"><b>User password :</b></th>
				<td><input type="password" name="pass"  placeholder="* Required" required></td>
				</tr>
      
				<tr>
					<td colspan="2" align="center"><input type="submit" name="submit" value="Login"></td>
				</tr>
				
			</table>
			
		</form>
		
	</body>
	
 </html>
 
 
 <!DOCTYPE html>

 <?php 
	$error=NULL;
	if(isset($_POST['submit']))
	{
		//Get form data
		function test_input($data)
		{
			$data = trim($data);
			$data = stripslashes($data);
			$data = htmlspecialchars($data);
			return $data;
		}
      
		$usr = test_input($_POST["usr"]);
      
		$pass = test_input($_POST["pass"]);
      
		include 'atmconnection.php';
	  
		if($conn)
		{
			$sql="SELECT * FROM `dba` WHERE `usr`='$usr' AND `pass`='$pass' LIMIT 1";
	
			$search_result=mysqli_query($conn,$sql);
      
			if ($search_result)
			{
				$result = mysqli_num_rows($search_result);
				if($result != 0)
				{
					//process login
					$row = mysqli_fetch_array($search_result);
					$id=$row['id'];
					echo $error;
						
					if(is_null($error))
					{
						mysqli_close($conn);
						header('HTTP 1.1 301 Moved Permanently');
						header('location:dbaviewbank.php');
					}
					
				}
				else
				{
					$error=("User Name ".$usr." & Password ".$pass." does not exists.");
				}
			}
			else
			{
				$error=("Error:".mysqli_error($conn));
			}
		}
		else
		{
			$error=("Connection failed: " . mysqli_connect_error());
		}
		mysqli_close($conn);
    }
?>
