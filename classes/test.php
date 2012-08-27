<?
$error = '';
if (pam_auth(argv[1], argv[2], &$error)) {
	echo "0";
} else {
	echo "1";
}
?>
