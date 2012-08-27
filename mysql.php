<?
 DEFINE ('DB_USER', 'root');
 DEFINE ('DB_PASSWORD', 'sbgCSE!!+');
 DEFINE ('DB_HOST', 'localhost');
 DEFINE ('DB_NAME', 'crcdb');

 $dbcon = @mysqli_connect (DB_HOST, DB_USER,DB_PASSWORD, DB_NAME)
 OR
 die ('Could not connect to MySQL: '.mysqli_connect_error() );

             mysqli_query($dbcon, $this->m_sql) or
			 trigger_error("Query: $this->m_sql \n<br />MySQL Error: " . mysqli_error($dbcon));
				die();
?>
