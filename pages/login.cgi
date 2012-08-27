#!/usr/bin/perl -w

use CGI;

use Digest::MD5(md5_hex);

use strict;
my $cgi = new CGI;
print "Content-type: text/htmlnn";

our $user = $cgi -> param('user');
our $pass = md5_hex($cgi -> param('pass'));

if($user eq '' or $pass eq '')
{
	print "<form action='login.cgi' method='POST'>

		<input type='text' name='user'><br>

		<input type='password' name='pass'><br>

		<input type='submit' value='Login'>";
}
else
{
	open(passwd,'/home/foo/passwd') or die;

	while(<passwd>)
	{
		(our $passwd_user, our $passwd_pass) = split(/:/,$_);
		chomp($passwd_pass);
		if($user eq $passwd_user and $pass eq $passwd_pass){
			our $loggedin = 1;
			last;
		}
		else
		{
			our $loggedin = 0;
		}
	}

	if(our $loggedin == 1)
	{
		print "Login accepted.";
	}
	else
	{
		print "Login declined.";
	}

	close(passwd);

}
