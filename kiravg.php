<?php

$con = mysql_connect("localhost","root","sbgCSE!!+");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("crcdb", $con);

$query = mysql_query("SELECT * FROM crc_feedback_answers");

for ($i = 1; $i < 22; $i++)
{
$sql = "SELECT AVG(feedback_answers_answer) FROM crc_feedback_answers WHERE feedback_answers_questions_id='".$i."'";

$result = mysql_query($sql) or die(mysql_error());

while($row = mysql_fetch_array($result))
{

      echo "The average score is: ".round(($row['AVG(feedback_answers_answer)']),2);
echo "<br>";
}
}




	?>

