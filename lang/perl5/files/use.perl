#! %%PREFIX%%/bin/perl -w
# $FreeBSD: ports/lang/perl5/files/use.perl,v 1.2 2002/05/20 00:03:07 tobez Exp $
use strict;

# XXX what to do with perldoc, pelbug, perlcc ??

sub usage
{
	print STDERR <<EOF;
Usage:
  $0 port       -> /usr/bin/perl is the perl5 port
  $0 system     -> /usr/bin/perl is the system perl
EOF
	exit 2;
}

my $port_perl = '%%PREFIX%%/bin/perl';
$port_perl =~ tr|/|/|s;

my $ident = `/usr/bin/ident /usr/bin/perl5`;

@ARGV == 1 or usage();
if ($ARGV[0] eq 'port') {
	switch_to_port();
} elsif ($ARGV[0] eq 'system') {
	switch_to_system();
} else {
	usage();
}
exit 0;

# Both functions depend on the idea that switch_to_port leaves
# perl5 alone.  If the wrapper is installed on a -current system,
# /usr/bin/perl5 will also be the wrapper.

sub switch_to_system
{
	# protect against cases where people use PREFIX=/usr
	if ($port_perl ne '/usr/bin/perl') {
		unlink '/usr/bin/perl', '/usr/bin/suidperl',
			'/usr/bin/perl%%PERL_VERSION%%';

		link '/usr/bin/perl5', '/usr/bin/perl';
		link '/usr/bin/perl5', '/usr/bin/perl%%PERL_VERSION%%';

		if ($ident =~ m#src/usr.bin/perl/perl.c#) {
			link '/usr/bin/perl5', '/usr/bin/suidperl';
		} else {
			link '/usr/bin/sperl5', '/usr/bin/suidperl';
		}
	}

	open MK, ">> /etc/make.conf" or die "/etc/make.conf: $!";
	print MK <<EOF;
# -- use.perl generated deltas -- #
# Created: @{[scalar localtime]}
# Setting to use base system perl:
.undef PERL_VER
.undef PERL_VERSION
.undef PERL_ARCH
.undef NOPERL
.undef NO_PERL

EOF
	close MK;
}

sub switch_to_port
{
	# protect against cases where people use PREFIX=/usr
	if ($port_perl ne '/usr/bin/perl') {
		if ($ident =~ m#src/usr.bin/perl/perl.c#) {
			rename '/usr/bin/perl', '/usr/bin/perl-wrapper';
		} else {
			unlink '/usr/bin/perl';
		}

		unlink '/usr/bin/suidperl', '/usr/bin/perl%%PERL_VERSION%%';

		symlink '%%PREFIX%%/bin/perl', '/usr/bin/perl';
		symlink '%%PREFIX%%/bin/suidperl', '/usr/bin/suidperl';
		symlink '%%PREFIX%%/bin/perl', '/usr/bin/perl%%PERL_VERSION%%';
	}

	open MK, ">> /etc/make.conf" or die "/etc/make.conf: $!";
	print MK <<EOF;
# -- use.perl generated deltas -- #
# Created: @{[scalar localtime]}
# Setting to use base perl from ports:
PERL_VER=%%PERL_VER%%
PERL_VERSION=%%PERL_VERSION%%
PERL_ARCH=%%PERL_ARCH%%
NOPERL=yo
NO_PERL=yo
NO_PERL_WRAPPER=yo

EOF
	close MK;
}
