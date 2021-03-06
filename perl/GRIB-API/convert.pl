#!/usr/bin/perl
# Copyright 2005-2016 ECMWF.
#
# This software is licensed under the terms of the Apache Licence Version 2.0
# which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
# 
# In applying this licence, ECMWF does not waive the privileges and immunities granted to it by
# virtue of its status as an intergovernmental organisation nor does it submit to any jurisdiction.

use lib qw(blib/lib blib/arch);
use GRIB::API;
use Data::Dumper;


my %DEFAULTS = ( scaleFactorOfFirstFixedSurface  => 255,
		productionStatusOfProcessedData => 5, # Tigge test
		shapeOfTheEarth => 6,
);


my $ukmo = 1;


#############################################################
# Generated by ./tigge_parameters.pl

my %GRIB1TO2;
my %NEW_ID;
%GRIB1TO2 = (
              '134_sfc' => {
                             discipline => 0,
                             parameterNumber => 2,
                             typeOfFirstFixedSurface => 103,
                             parameterCategory => 2
                           },
              '167_sfc' => {
                             discipline => 0,
                             parameterNumber => 0,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 0,
                             scaledValueOfFirstFixedSurface => 2
                           },
              '168_sfc' => {
                             discipline => 0,
                             parameterNumber => 6,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 0,
                             scaledValueOfFirstFixedSurface => 2
                           },
              '136_sfc' => {
                             typeOfSecondFixedSurface => 8,
                             discipline => 0,
                             parameterNumber => 47,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 1
                           },
              '121_sfc' => {
                             discipline => 0,
                             parameterNumber => 0,
                             typeOfStatisticalProcessing => 2,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 0,
                             scaledValueOfFirstFixedSurface => 2
                           },
              '172_sfc' => {
                             discipline => 2,
                             parameterNumber => 0,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 0
                           },
              '122_sfc' => {
                             discipline => 0,
                             parameterNumber => 0,
                             typeOfStatisticalProcessing => 3,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 0,
                             scaledValueOfFirstFixedSurface => 2
                           },
              '228001_sfc' => {
                                typeOfSecondFixedSurface => 8,
                                discipline => 0,
                                parameterNumber => 7,
                                typeOfFirstFixedSurface => 1,
                                parameterCategory => 7
                              },
              '228_sfc' => {
                             discipline => 0,
                             parameterNumber => 54,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 1
                           },
              '141_sfc' => {
                             discipline => 0,
                             parameterNumber => 13,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 1
                           },
              '189_sfc' => {
                             discipline => 0,
                             parameterNumber => 22,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 6
                           },
              '228002_sfc' => {
                                discipline => 0,
                                parameterNumber => 5,
                                typeOfFirstFixedSurface => 1,
                                parameterCategory => 3
                              },
              '139_sfc' => {
                             typeOfSecondFixedSurface => 106,
                             discipline => 2,
                             scaledValueOfSecondFixedSurface => 2,
                             parameterNumber => 2,
                             typeOfFirstFixedSurface => 106,
                             scaleFactorOfFirstFixedSurface => 0,
                             scaleFactorOfSecondFixedSurface => 1,
                             parameterCategory => 0,
                             scaledValueOfFirstFixedSurface => 0
                           },
              '130_pl' => {
                            discipline => 0,
                            parameterNumber => 0,
                            typeOfFirstFixedSurface => 100,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 0
                          },
              '131_pl' => {
                            discipline => 0,
                            parameterNumber => 2,
                            typeOfFirstFixedSurface => 100,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 2
                          },
              '39_sfc' => {
                            typeOfSecondFixedSurface => 106,
                            discipline => 2,
                            scaledValueOfSecondFixedSurface => 2,
                            parameterNumber => 22,
                            typeOfFirstFixedSurface => 106,
                            scaleFactorOfFirstFixedSurface => 0,
                            scaleFactorOfSecondFixedSurface => 1,
                            parameterCategory => 0,
                            scaledValueOfFirstFixedSurface => 0
                          },
              '132_pl' => {
                            discipline => 0,
                            parameterNumber => 3,
                            typeOfFirstFixedSurface => 100,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 2
                          },
              '176_sfc' => {
                             discipline => 0,
                             parameterNumber => 9,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 4
                           },
              '133_pl' => {
                            discipline => 0,
                            parameterNumber => 0,
                            typeOfFirstFixedSurface => 100,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 1
                          },
              '144_sfc' => {
                             discipline => 0,
                             parameterNumber => 55,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 1
                           },
              '60_pt' => {
                            discipline => 0,
                            parameterNumber => 14,
                            typeOfFirstFixedSurface => 107,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 2,
                            scaledValueOfFirstFixedSurface => 2000000
                          },
              '177_sfc' => {
                             discipline => 0,
                             parameterNumber => 5,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 5
                           },
              '3_pv' => {
                          discipline => 0,
                          parameterNumber => 2,
                          typeOfFirstFixedSurface => 109,
                          scaleFactorOfFirstFixedSurface => 6,
                          parameterCategory => 0,
                          scaledValueOfFirstFixedSurface => 2
                        },
              '131_pv' => {
                            discipline => 0,
                            parameterNumber => 2,
                            typeOfFirstFixedSurface => 109,
                            scaleFactorOfFirstFixedSurface => 6,
                            parameterCategory => 2,
                            scaledValueOfFirstFixedSurface => 2
                          },
              '132_pv' => {
                            discipline => 0,
                            parameterNumber => 3,
                            typeOfFirstFixedSurface => 109,
                            scaleFactorOfFirstFixedSurface => 6,
                            parameterCategory => 2,
                            scaledValueOfFirstFixedSurface => 2
                          },
              '235_sfc' => {
                             discipline => 0,
                             parameterNumber => 17,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 0
                           },
              '59_sfc' => {
                            typeOfSecondFixedSurface => 8,
                            discipline => 0,
                            parameterNumber => 6,
                            typeOfFirstFixedSurface => 1,
                            parameterCategory => 7
                          },
              '146_sfc' => {
                             discipline => 0,
                             parameterNumber => 11,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 0
                           },
              '179_sfc' => {
                             discipline => 0,
                             parameterNumber => 5,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 8,
                             parameterCategory => 5
                           },
              '164_sfc' => {
                             typeOfSecondFixedSurface => 8,
                             discipline => 0,
                             parameterNumber => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 6
                           },
              '147_sfc' => {
                             discipline => 0,
                             parameterNumber => 10,
                             typeOfStatisticalProcessing => 1,
                             typeOfFirstFixedSurface => 1,
                             parameterCategory => 0
                           },
              '165_sfc' => {
                             discipline => 0,
                             parameterNumber => 2,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 2,
                             scaledValueOfFirstFixedSurface => 10
                           },
              '166_sfc' => {
                             discipline => 0,
                             parameterNumber => 3,
                             typeOfFirstFixedSurface => 103,
                             scaleFactorOfFirstFixedSurface => 0,
                             parameterCategory => 2,
                             scaledValueOfFirstFixedSurface => 10
                           },
              '156_pl' => {
                            discipline => 0,
                            parameterNumber => 5,
                            typeOfFirstFixedSurface => 100,
                            scaleFactorOfFirstFixedSurface => 0,
                            parameterCategory => 3
                          },
              '151_sfc' => {
                             discipline => 0,
                             parameterNumber => 0,
                             typeOfFirstFixedSurface => 101,
                             parameterCategory => 3
                           }
            );
%NEW_ID = (
            '167.128' => 167,
            '176.128' => 176,
            '60.128' => 60,
            '168.128' => 168,
            '144.128' => 144,
            '1.228' => 228001,
            '177.128' => 177,
            '121.128' => 121,
            '136.128' => 136,
            '130.128' => 130,
            '235.128' => 235,
            '2.228' => 228002,
            '59.128' => 59,
            '3.128' => 3,
            '172.128' => 172,
            '122.128' => 122,
            '146.128' => 146,
            '131.128' => 131,
            '179.128' => 179,
            '164.128' => 164,
            '147.128' => 147,
            '132.128' => 132,
            '228.128' => 228,
            '156.128' => 156,
            '141.128' => 141,
            '165.128' => 165,
            '189.128' => 189,
            '139.128' => 139,
            '133.128' => 133,
            '166.128' => 166,
            '151.128' => 151,
            '39.128' => 39,
            '134.128' => 134
          );

#############################################################


my %EQ = (
		'201.128' => '121.128', # MX2T -> MX2T6, for UKMO
		'202.128' => '122.128', # MN2T -> MN2T6, for UKMO
		'129.128' => '156.128', # Z -> GH, for ECMWF
);

# Special case for orography

$GRIB1TO2{"156_sfc"} = $GRIB1TO2{"228002_sfc"};

my %MAPPING = (
		param    => \%GRIB1TO2,
		marsType => {
		cf => {
			productDefinitionTemplateNumber => 1,
			typeOfGeneratingProcess         => 4, # To be checked
			typeOfEnsembleForecast          => 1, # Low-res control forecast
#			numberOfForecastsInEnsemble     => 51,
			typeOfProcessedData => 3,
		},
		fc => {
			productDefinitionTemplateNumber => 0,
			typeOfGeneratingProcess         => 2, # To be checked
			typeOfProcessedData => 2,
		},
		pf => {
			productDefinitionTemplateNumber => 1,
			typeOfGeneratingProcess         => 4, # To be checked
			typeOfEnsembleForecast          => 3, # Positively perturbed forecast
			typeOfProcessedData => 4,
		},
		},
);


my %GAUSSIAN;

die "Usage: $0 in out" unless(@ARGV == 2);
my ($in,$out) = @ARGV;

open(IN,  "<$in" ) or die "$in: $!";
open(OUT, ">$out") or die "$out: $!";

my $g;
my $n = 0;

while($g = GRIB::API->new(\*IN))
{
#	print "GRIB $n ...\n";


	my %g1;
	foreach my $k ( keys %MAPPING )
	{
		$g1{$k} = $g->get_string($k);
	}

	# my $l = $LEVELS{$g->get_string("levtype")};
	my $l = $g->get_string("levtype");
	my $p = $g1{param};

	$p = $EQ{$p} if(exists $EQ{$p});

unless(exists $NEW_ID{$p})
{
	system("smslabel","info","No ID for $p");
	die "No ID for $p" 
}
	$p = $NEW_ID{$p};
	$p = "${p}_${l}";
	$g1{param} = $p;

# print Dumper(\%g1);

# Change edition, this should copy lots of things




# Update missing fields

	my %x = %DEFAULTS;

	foreach my $m ( keys %MAPPING )
	{

		my $e       = $MAPPING{$m};
		my $mapping = $e->{$g1{$m}};
		unless($mapping) {
			# $g->Dump(\*STDOUT);
		system("smslabel","info","No mapping for [$m] [$g1{$m}]");
			die Dumper(\%g1, "No mapping for [$m] [$g1{$m}]") 
		}

		foreach my $k ( keys %{$mapping} )
		{
			$x{$k} = $mapping->{$k} if(defined $mapping->{$k});
		}

	}

	if(exists $x{typeOfStatisticalProcessing})
	{
		$x{productDefinitionTemplateNumber}  = 8  if($x{productDefinitionTemplateNumber} == 0);
		$x{productDefinitionTemplateNumber}  = 11 if($x{productDefinitionTemplateNumber} == 1);
	}

	$x{editionNumber} = 2;

	if($ukmo)
	{
		$x{basicAngleOfTheInitialProductionDomain} = 360;
		$x{subdivisionsOfBasicAngle}               = 864;
		$x{iDirectionIncrement}                    = 3;
		$x{jDirectionIncrement}                    = 2;

		$x{latitudeOfFirstGridPoint}               = -216;
		$x{latitudeOfLastGridPoint}                = 0;

		$x{longitudeOfFirstGridPoint}              = 216;
		$x{longitudeOfLastGridPoint}               = 861;

		if($g1{"param"} =~ /^13(1|2)/)
		{
			$x{subdivisionsOfBasicAngle} = 1728;
		}
	}


	delete $x{forecastTime};

# $g->Dump(\*STDOUT);
# print STDERR Dumper(\%x);


	my ($s,$e) = ($g->get("marsStartStep"),$g->get("marsEndStep"));


#if($n == 0) { print '-' x 80, "\n"; $g->Dump(\*STDOUT) ; print '-' x 80, "\n\n"; };
	$g->set_values(\%x) or die Dumper(\%x);  ;

# if($n == 0) { print '+' x 80, "\n"; $g->Dump(\*STDOUT) ; print '+' x 80, "\n\n"; };

# $g->Dump(\*STDOUT);

# Gaussian grid

	if($g->get("gridDefinitionTemplateNumber") == 40)
	{
		my $n = $g->get("numberOfParallelsBetweenAPoleAndTheEquator");
		unless(exists $GAUSSIAN{$n})
		{
			my $x = GRIB::API::get_gaussian_latitudes($n);
			$GAUSSIAN{$n} = $x->[0];
		}
		my $x =  int($GAUSSIAN{$n}*1_000_000);
		$g->set_long("latitudeOfFirstGridPoint",$x);
		$g->set_long("latitudeOfLastGridPoint",-$x);

		my $y = $g->get_long("latitudeOfFirstGridPoint");
		die if($x != $y);
		
	}

	my $n = $g->get("numberOfValues");
	die "numberOfValues: $n" unless($n > 0);

	my $n = $g->get("numberOfDataPoints");
	die "numberOfDataPoints: $n" unless($n > 0);

	$g->set("backgroundGeneratingProcessIdentifier",$g->get("generatingProcessIdentifier"));

#$g->set("lengthOfTheTimeRangeOverWhichStatisticalProcessingIsDone",
#	$g->get("marsEndStep")-$g->get("marsStartStep"));

	if(exists $x{typeOfStatisticalProcessing}){

		if($x{typeOfStatisticalProcessing} eq 1) # some grib1 are badly coded
		{
			$g->set_long("marsStartStep",0);
			$g->set_long("marsEndStep",$e);
		}
		else
		{
# UKMO die "s=$s e=$e" unless($e == $s);
#if($s > 0)
#{
#$g->set_long("marsStartStep",$s-6);
#	$g->set_long("marsEndStep",$s);
#}
		}
	}



	$g->Write(\*OUT) or die "$out: $!";
#print "... done\n";
	$n++;
}

close(OUT) or die "$out: $!";
