#!/usr/bin/perl
# $Id$

# A script to print out a bunch of info about the current Perl environment
# by Brian Manning (elspicyjack {at} gmail &sdot; com)

# The original script most likely appears in the Perl Cookbook from O'Reilly.
# Hacks for the module version were taken from:
# perl module version - http://www.perlmonks.org/?node_id=37237

# if the script detects that it's running as under a CGI environment (the
# REQUEST_METHOD environment variable is set), it will wrap the plaintext
# output in the correct HTML tags so the browser will render it in the same
# manner as if the script were running in a shell.

use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use File::Find::Rule

my $q = CGI->new();

print $q->header(), $q->start_html() . qq(\n);

my $find = File::Find::Rule->file()->name('*.txt');
# print all of the files in the ru-en subdirectory that end with .txt
print $q->ul($q->li({}, $find->in(q(../ru-en))) );
print $q->end_html();

exit 0;
