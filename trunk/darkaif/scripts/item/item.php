<?php
/*
Not yet Fully Build.
*/

header("Content-type: text/xml");

$rowID['shopname'] = 'None';
$rowID['name'] = 'None';
$rowID['buyprice'] = '1';
$rowID['sellprice'] = '1';

	$xml_output= '<shopitem>';
	$xml_output.= '<item>';
    $xml_output.= '<shopname>'.$rowID['shopname'].' </shopname>';
	$xml_output.= '<itemname> '.$rowID['name'].' </itemname>';
	$xml_output.= '<buyprice> '.$rowID['buyprice'].' </buyprice>';
	$xml_output.= '<sellprice> '.$rowID['sellprice'].' </sellprice>';
	$xml_output.= '</item>';
	$xml_output.= '</shopitem>';
	
	echo $xml_output;
?>