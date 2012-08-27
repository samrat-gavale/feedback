<?php
  if(isset($_REQUEST[session_name()])) {
    // There is a session already available
    //session_start();
  } else {
    session_name('crc');
    session_start();
  }

  require_once('../tcpdf/config/lang/eng.php');
  require_once('../tcpdf/tcpdf.php');
  $coursedata = $_SESSION['coursesdata'];

class MYPDF extends TCPDF {
	//Page header
	public function Header() {
		// Logo
		$image_file = '../images/logo.jpg';
		$this->Image($image_file, 10, 5, 30, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
		// Set font
		$this->SetFont('helvetica', '', 15);
		$this->SetY(10);
		// Title
		$this->Cell(0, 15, 'Indian Institute of Technology', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->setY(18);
		$this->Cell(0, 15, 'Mandi, H.P.', 0, false, 'C', 0, '', 0, false, 'M', 'M');
		$this->Line(10, 30, 195, 30);
	}

	// Page footer
	public function Footer() {
		// Position at 15 mm from bottom
		$this->SetY(-15);
		// Set font
		$this->SetFont('helvetica', '', 8);
		$this->Line(10, 280, 195, 280);
		//footer tag
		$this->Cell(0, 10, 'IIT Mandi, Course Feeedback', 0, false, 'L', 0, '', 0, false, 'T', 'M');
		// Page number
		$this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->getAliasNbPages(), 0, false, 'R', 0, '', 0, false, 'T', 'M');
	}
	
	public function CreateTextBox($textval, $x = 0, $y, $width = 0, $height = 10, $fontsize = 10, $fontstyle = '', $align = 'L') {
		$this->SetXY($x+10, $y); // 15 = margin left
		$this->SetFont(PDF_FONT_NAME_MAIN, $fontstyle, $fontsize);
		$this->Cell($width, $height, $textval, 0, false, $align);
	}

}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('IIT Mandi');
$pdf->SetTitle('IIT Mandi Course Feedback');
$pdf->SetSubject('');
$pdf->SetKeywords('IIT Mandi, Course, Feedback');

// set default header data
$pdf->SetHeaderData('logo', 30, 'Feedback Document', 'IIT Mandi');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 33, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// add a page
$pdf->AddPage();


// set cell padding
$pdf->setCellPaddings(1, 1, 1, 1);

// set cell margins
//$pdf->setCellMargins(1, 1, 1, 1);

// set color for background
$pdf->SetFillColor(255, 255, 127);

// -----------------------------------------Heading--------------------------------------------------------------// 

$currentY = $pdf->getY();
$pdf->SetFont('times', '', 13);
$pdf->MultiCell(180, 4, 'Course Feedback Report', 0, 'C', 0, 1, '', $currentY, true);
//$pdf->MultiCell(180, 4, $coursedata, 0, 'C', 0, 1, '', '', true);
$pdf->Ln(3);

$currentY = $pdf->getY();
$width_values = 102;
$position_X = 60;
$pdf->SetFont('times', '', 12);
$sr_no = 1;

$pdf->MultiCell($width_values, 4, $sr_no.'. Academic Year', 0, 'L', 0, 1, '', $currentY, true); $sr_no +=1;
$pdf->MultiCell($width_values, 5, '2011-12', 0, '', 0, 1, $position_X, $currentY, true); $currentY +=6;
$pdf->MultiCell($width_values, 4, $sr_no.'. Semester', 0, 'L', 0, 1, '', $currentY, true); $sr_no +=1;
$pdf->MultiCell($width_values, 5, 'Spring', 0, '', 0, 1, $position_X, $currentY, true); $currentY +=6;
$pdf->MultiCell($width_values, 4, $sr_no.'. Course Number', 0, 'L', 0, 1, '', $currentY, true); $sr_no +=1;
$pdf->MultiCell($width_values, 5, $coursedata['coursenum'], 0, '', 0, 1, $position_X, $currentY, true); $currentY +=6;
$pdf->MultiCell($width_values, 4, $sr_no.'. Course Name', 0, 'L', 0, 1, '', $currentY, true); $sr_no +=1;
$pdf->MultiCell($width_values, 5, $coursedata['coursename'], 0, '', 0, 1, $position_X, $currentY, true); $currentY +=6;
$pdf->MultiCell($width_values, 4, $sr_no.'. Instructor/Tutor', 0, 'L', 0, 1, '', $currentY, true); $sr_no +=1;
$pdf->MultiCell($width_values, 5, $coursedata['teachername'], 0, '', 0, 1, $position_X, $currentY, true);


$data = $_SESSION['evaluation'];
$data_sdevcnt = $_SESSION['sdevcnt'];
if ($data != null) {
	$width_ques = 450;
	$width_no = 25;
	$width_avg = 55;
	$width_sdev = 55;
	$width_cnt = 55;
	$course_feedback_tbl = <<<EOD
		<table width="525" cellpadding="2" border="1" align="center">
		<tr>
			<td width="$width_no">No.</td>
			<td width="$width_ques">Question</td>
			<td width="$width_avg">Avg</td>
			<td width="$width_sdev">Sdev</td>
			<td width="$width_cnt">Cnt</td>
		</tr>
EOD;
					/* in following for loop, -1 is do 'comm' and -6 is for the six questions of comments*/
					for($i = 0; $i < count($data)-1; $i++)
					{
						if($data[$i]['que_no']>21)
						{
						$course_feedback_tbl.= '<tr><td align="center"> ' . $data[$i]['que_no'] . '</td>';
						$course_feedback_tbl.= '<td align="left" colspan="4"> ' . $data[$i]['que'] . '</td></tr>';
						}
						else
						{
						$course_feedback_tbl.= '<tr><td align="center"> ' . $data[$i]['que_no'] . '</td>';
						$course_feedback_tbl.= '<td align="left"> ' . $data[$i]['que'] . '</td>';
						$course_feedback_tbl.= '<td>' . $data[$i]['ans'] . '</td>';   //1st </td> for ending question
						$course_feedback_tbl.= '<td>' . $data_sdevcnt[$i]['standarddeviation'] . '</td>';       //sdev 
						$course_feedback_tbl.= '<td>' . $data_sdevcnt[$i]['responsecount'] . '</td>';       //cnt
						$course_feedback_tbl.= '</tr>';
						}
					}

					$counter = 0;
					foreach($data['comm'] as $comment)
					{
						$counter++;
						$course_feedback_tbl.= '<tr><td>'. $counter .'</td>';
						$course_feedback_tbl.= '<td align="left" colspan="4">' . $comment . '</td></tr>';						
					}
		$course_feedback_tbl.= '</table>';
		$pdf->Ln(3);
//Font for details
$pdf->SetFont('times', '', 11);
$pdf->writeHTML($course_feedback_tbl, false, false, false, false);

		}

//move pointer to last page
$pdf->lastPage();

// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('Course Feedback.pdf', 'I');

//============================================================+
// END OF FILE                                                
//============================================================+
