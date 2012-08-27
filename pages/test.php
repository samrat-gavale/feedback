<?
$error = '';
if (pam_auth('samrat', 'sbgCSE!!+', &$error)) {
	echo "Yeah baby, we're authenticated!";
} else {
	echo $error . " is the reason.";
}
?>
