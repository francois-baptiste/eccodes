/*
 * Copyright 2005-2015 ECMWF.
 *
 * This software is licensed under the terms of the Apache Licence Version 2.0
 * which can be obtained at http://www.apache.org/licenses/LICENSE-2.0.
 *
 * In applying this licence, ECMWF does not waive the privileges and immunities granted to it by
 * virtue of its status as an intergovernmental organisation nor does it submit to any jurisdiction.
 */

/*
 * C Implementation: codes_info
 *
 * Description:
 *
 */

#include "grib_tools.h"

void usage( char*);

#define INFO_PRINT_ALL              0
#define INFO_PRINT_VERSION          (1<<0)
#define INFO_PRINT_DEFINITION_PATH  (1<<1)
#define INFO_PRINT_SAMPLES_PATH     (1<<2)

int main( int argc,char* argv[])
{
    char* path=NULL;
    int c=0;
    int nfiles=0;
    unsigned long print_flags=0;
    int major=GRIB_API_MAJOR_VERSION;
    int minor=GRIB_API_MINOR_VERSION;
    int revision=GRIB_API_REVISION_VERSION;

    while (1) {
        c = getopt (argc, argv, "vds");

        if (c == -1)
            break;

        switch (c) {
        case 'v':
            print_flags|=INFO_PRINT_VERSION;
            break;
        case 'd':
            print_flags|=INFO_PRINT_DEFINITION_PATH;
            break;
        case 's':
            print_flags|=INFO_PRINT_SAMPLES_PATH;
            break;
        default:
            usage(argv[0]);
        }
    }

    nfiles=argc-optind;
    if (nfiles != 0) usage(argv[0]);

    if (print_flags ==  INFO_PRINT_ALL) {
        printf("\n");
        printf("eccodes Version %d.%d.%d",
                major,minor,revision);
        if (GRIB_API_MAJOR_VERSION < 1) printf(" PRE-RELEASE");
        printf("\n");
        printf("\n");


        if ((path=getenv("ECCODES_DEFINITION_PATH")) != NULL) {
            printf("Definition files path from environment variable");
            printf(" ECCODES_DEFINITION_PATH=%s\n",path);
        } else {
            printf("Default definition files path is used: %s\n",ECCODES_DEFINITION_PATH);
            printf("Definition files path can be changed setting ECCODES_DEFINITION_PATH environment variable\n");
        }
        printf("\n");

        if ((path=getenv("ECCODES_SAMPLES_PATH")) != NULL) {
            printf("SAMPLES path from environment variable");
            printf(" ECCODES_SAMPLES_PATH=%s\n",path);
        } else {
            printf("Default SAMPLES path is used: %s\n",ECCODES_SAMPLES_PATH);
            printf("SAMPLES path can be changed setting ECCODES_SAMPLES_PATH environment variable\n");
        }
        printf("\n");
        return 0;
    }

    if (print_flags & INFO_PRINT_VERSION)
        printf("%d.%d.%d ",major,minor,revision);

    if (print_flags & INFO_PRINT_DEFINITION_PATH) {
        if ((path=getenv("ECCODES_DEFINITION_PATH")) != NULL) {
            printf("%s",path);
        } else {
            printf("%s",ECCODES_DEFINITION_PATH);
        }
    }

    if (print_flags & INFO_PRINT_SAMPLES_PATH) {
        if ((path=getenv("ECCODES_SAMPLES_PATH")) != NULL) {
            printf("%s",path);
        } else {
            printf("%s",ECCODES_SAMPLES_PATH);
        }
    }

    return 0;
}

void usage(char* progname) {
    printf("\nUsage: %s [-v] [-d] [-s]\n",progname);
    exit(1);
}