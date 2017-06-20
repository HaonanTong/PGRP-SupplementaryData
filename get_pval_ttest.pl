#!/usr/bin/perl

use strict;
use Statistics::PointEstimation;
use Statistics::TTest;

################################################################################
#
# MAIN
#
################################################################################
MAIN : {
    while (my $line = <>) {
	chomp $line;
	if ($line =~ /kat_/) {
	    next;
	}

	my ($id, $kat_1_1, $kat_2_1, $kat_3_1, $kat_1_2, $kat_2_2, $kat_3_2) = split(/\t/, $line);

	my @r1 = ($kat_1_1, $kat_2_1, $kat_3_1);
	my @r2 = ($kat_1_2, $kat_2_2, $kat_3_2);

	my $ttest = new Statistics::TTest;  
#	$ttest->set_significance(90);
	$ttest->load_data(\@r1,\@r2);

	my $mean1 = mean(\@r1);
	my $mean2 = mean(\@r2);

	print(join("\t",
		   $id,
		   $kat_1_1, $kat_2_1, $kat_3_1,
		   $kat_1_2, $kat_2_2, $kat_3_2,
		   $mean1, $mean2,
		   log($mean2 / $mean1) / log(2),
		   $ttest->{t_prob}) . "\n");

#	$ttest->output_t_test();
#	$ttest->set_significance(99);
#	$ttest->print_t_test();  #list out t-test related data
    }
}

################################################################################
#
# sub mean
#
################################################################################
sub mean {
    my ($arrayref) = @_;

    # check args
    if (not defined $arrayref) {
	die ("arrayref must be defined\n");
    }

    my $sum = 0;
    foreach my $e (@$arrayref) {
	$sum += $e;
    }

    return $sum / scalar(@$arrayref);
}
