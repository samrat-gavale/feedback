<?php
function ae_bar_html(&$values, $height=300, $color='blue', $width=10)
{
	$max = -1;

	foreach($values as $k=>$v) {
		if (abs($v) > $max) {
			$max = abs($v);
		}
	}

	if ($max != 0) {
		$kf = $height / $max;
	}
	else {
		$kf = 0;
	}

	if ($width != '') {
		$width = "width: {$width}px; ";
	}

	$out = "<tr style='vertical-align: bottom;'>";
	foreach($values as $k=>$v) {
		$bar_h = abs(round($v*$kf));
		$out .= "<td style='{$width}padding-top: 0; margin-top: 0;";
		$out .= " height: {$height}px; border-bottom: {$bar_h}px solid {$color}; text-align: center;'>";
		$out .= "{$v}</td>";
	}
	$out .= '</tr>';
	
	$out .= "<tr>";
	foreach($values as $k=>$v) {
		$out .= "<td style='text-align: center'>{$k}</td>";
	}
	$out .= "</tr>";
	
	return $out;
}
?>


