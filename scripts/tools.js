//---------------------------------------------------
// 	Function fShowText
//	==================
//
//	Purpose::	To show text on the browsers
//			Status Bar.
//	Author:		Shaffin N. Bhanji
//	Date:		August 26, 1998
//---------------------------------------------------

function fn_showstatus(text) {
	window.status = text;
	setTimeout("window.status=''", 5000);
}

function verify(page) {
	if (page == "register") {
		if (register.username.value == "") {
			alert("Please enter a valid 'Username'!");
			register.username.focus();
		} else if (register.password.value == "") {
			alert("Please enter a valid 'Password'!");
			register.password.focus();
		}else if (register.password.value == "") {
			alert("Please enter your enrollment number! (Enter \'NA\' if you are a teacher.)");
			register.enrollno.focus();
		} else if (register.name.value == "") {
			alert("Please enter a valid name!");
			register.name.focus();
		} else if (register.email.value == "") {
			alert("Please enter a valid 'Email'!");
			register.email.focus();
		} else if (register.day.value == "00") {
			alert("Please enter a valid 'Day'!");
			register.day.focus();
		} else if (register.month.value == "00") {
			alert("Please enter a valid 'Month'!");
			register.month.focus();
		} else if (register.year.value == "0000") {
			alert("Please enter a valid 'Year'!");
			register.year.focus();
		} else {
			register.submit();
		}
	} else if (page == "login") {
		if (login.username.value == "") {
			alert("Please enter a valid 'Username'!");
			login.username.focus();
		} else if (login.password.value == "") {
			alert("Please enter a valid 'Password'!");
			login.password.focus();
		} else {
			login.submit();
		}
	} else if (page == "profile") {
		if (profile.username.value == "") {
			alert("Please enter a valid 'Username'!");
			profile.username.focus();
		} else if (profile.password.value == "") {
			alert("Please enter a valid 'Password'!");
			profile.lname.focus();
		} else if (profile.name.value == "") {
			alert("Please enter a valid name!");
			profile.fname.focus(); 
		} else if (profile.email.value == "") {
			alert("Please enter a valid 'Email'!");
			profile.email.focus();
		} else if (profile.day.value == "") {
			alert("Please enter a valid 'Day'!");
			profile.day.focus();
		} else if (profile.month.value == "") {
			alert("Please enter a valid 'Month'!");
			profile.month.focus();
		} else if (profile.year.value == "") {
			alert("Please enter a valid 'Year'!");
			profile.year.focus();
		} else {
			profile.submit();
		}
	} else if (page == "editprofile") {
		if (editprofile.username.value == "") {
			alert("Please enter a valid username");
			editprofile.username.focus();
/*		} else if (editprofile.password.value == "") {
			alert("Please enter a valid password");
			editprofile.password.focus();
*/		} else if (editprofile.enrollno.value == "") {
			alert("Please enter a valid enrollment number. Enter 'NA' if you are not a student.");
			editprofile.enrollno.focus();
		} else if (editprofile.name.value == "") {
			alert("Please enter a valid name");
			editprofile.name.focus();
		} else if (editprofile.email.value == "") {
			alert("Please enter a valid e-mail");
			editprofile.email.focus();
		} else if (editprofile.day.value == "") {
			alert("Please enter a valid day");
			editprofile.day.focus();
		} else if (editprofile.month.value == "") {
			alert("Please enter a valid month");
			editprofile.month.focus();
		} else if (editprofile.year.value == "") {
			alert("Please enter a valid year");
			editprofile.year.focus();
		} else {
			editprofile.submit();
		}
	} else if (page == "adminaddcourse") {
		if (adminaddcourse.cnum.value == "") {
			alert("Please enter a valid 'Course Number'!");
			adminaddcourse.cnum.focus();
		} else if (adminaddcourse.cname.value == "") {
			alert("Please enter a valid 'course name'!");
			adminaddcourse.cname.focus();
		} else {
			adminaddcourse.submit();
		}
	} else if (page == "editcourse") {
		if (editcourse.cname.value == "") {
			alert("Please enter a valid 'Course Name'!");
			editcourse.cname.focus();
		} else if (editcourse.cnum.value == "") {
			alert("Please enter a 'Course Number'!");
			editcourse.cnum.focus();
		} else {
			editcourse.submit();
		}		
	} else if (page == "adminaddstudent") {
		if (adminaddstudent.name.value == "") {
			alert("Please enter a valid name!");
			adminaddstudent.name.focus();
		} else if (adminaddstudent.enrollno.value == "") {
			alert("Please enter a valid enrollment number!");
			adminaddstudent.enrollno.focus();
		} else {
			adminaddcourse.submit();
		}
	} else if (page == "dbsetup") {
		if (dbsetup.database.value == "") {
			alert("Please enter a database name");
			dbsetup.database.focus();
		} else if (dbsetup.password.value == "") {
			alert("Please enter a password for the root user of MySQL server");
			dbsetup.password.focus();
		} else if (dbsetup.username.value == "") {
			alert("Please enter the username of database");
			dbsetup.username.focus();
		} else if (dbsetup.userpassword.value == "") {
			alert("Please enter the password for user of database");
			dbsetup.userpassword.focus();
		} else {
			dbsetup.submit();
		}
	} else {
		alert("unknown/unhandled page");
	}	
}
