# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'
##############################################################################
# Last Modified on:     $Date: 2000/03/09 23:27:10 $
# By:                   $Author: unrzc9 $
# Version:              $Revision: 1.2 $
######################### We start with some black magic to print on failure.
# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use web;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):
##############################################################################


print "Starting security-filecheck...\n";
my $file = "/etc/passwd/abc123!@#$%^&*()_+|";

$file =~ s/[^$web::OKCHARS]//g;
print "file = $file\n";
$file2 =  "/etc/passwd/abc123!@#$%^&*()_+|";
$file2 = Check_Name($file2);
print "file = $file2\n";
print "ok\n";
##############################################################################
my @jahrliste = (1992, 1993, 1994, 1995, 1999, 2000, 1765, 1777, 1900, 1800, 1600, 1604);
print "Checking for leapyear...\n";
for ($i=0; $i<=$#jahrliste; $i++) {
  print "$jahrliste[$i]: ";
  if (isLeapYear($jahrliste[$i])) {
   print "Leapyear\n";
  } else {
   print "---\n";
  }
} 
print "ok\n";
##############################################################################
print "Negotiating system...\n";
print "System: $web::OS\n";
print "ok\n";
##############################################################################
print "Testing Add_Days_to_Date()\n";
$startdate = "1.11.1999";
$modi_days = 119;
$enddate = Add_Days_to_Date($startdate,$modi_days);
print " $startdate + $modi_days Day(s) = $enddate\n";
$startdate = "$enddate";
$modi_days *= -1;
$enddate = Add_Days_to_Date($startdate,$modi_days);
print " $startdate + $modi_days Day(s) = $enddate\n";
print "ok\n";
##############################################################################

