#!/bin/sh
# $FreeBSD: ports/java/jdk15/files/license.sh,v 1.1 2007/08/13 04:57:47 glewis Exp $

# License agreement
more << EOF_LICENSE
JAVA RESEARCH LICENSE
Version 1.6


I.    DEFINITIONS.

"Licensee" means You and any other party that has entered into and has
in effect a version of this License.

"Modifications" means any change or addition to the Technology.

"Sun" means Sun Microsystems, Inc. and its successors and assignees.

"Research Use" means research, evaluation, or development for the
purpose of advancing knowledge, teaching, learning, or customizing the
Technology or Modifications for personal use. Research Use expressly
excludes use or distribution for direct or indirect commercial
(including strategic) gain or advantage.

"Technology" means the source code and object code of the technology
made available by Sun pursuant to this License.

"Technology Site" means the website designated by Sun for accessing
the Technology.

"You" means the individual executing this License or the legal entity
or entities represented by the individual executing this License.

II.     PURPOSE.

Sun is licensing the Technology under this Java Research License (the
"License") to promote research, education, innovation, and development
using the Technology.  This License is not intended to permit or
enable access to the Technology for active consultation as part of
creating an independent implementation of the Technology.

COMMERCIAL USE AND DISTRIBUTION OF TECHNOLOGY AND MODIFICATIONS IS
PERMITTED ONLY UNDER A SUN COMMERCIAL LICENSE.

III.     RESEARCH USE RIGHTS.

A.    License Grant. Subject to the conditions contained herein, Sun
grants to You a non-exclusive, non-transferable, worldwide, and
royalty-free license to do the following for Your Research Use only:

1.    Reproduce, create Modifications of,  and use the Technology
alone, or with Modifications;

2.    Share source code of the Technology alone, or with
Modifications, with other Licensees; and

3.    Distribute object code of the Technology, alone, or with
Modifications, to any third parties for Research Use only, under a
license of Your choice that is consistent with this License; and
publish papers and books discussing the Technology which may include
relevant excerpts that do not in the aggregate constitute a
significant portion of the Technology.

B.     Residual Rights.  If You examine the Technology after accepting
this License and remember anything about it later, You are not
"tainted" in a way that would prevent You from creating or
contributing to an independent implementation, but this License grants
You no rights to Sun's copyrights or patents for use in such an
implementation.

C.    No Implied Licenses.  Other than the rights granted herein, Sun
retains all rights, title, and interest in Technology, and You retain
all rights, title, and interest in Your Modifications and associated
specifications, subject to the terms of this License.

D.    Third Party Software.  Portions of the Technology may be
provided with licenses or other notices from third parties that govern
the use of those portions. Any licenses granted hereunder do not alter
any rights and obligations You may have under such licenses, however,
the disclaimer of warranty and limitation of liability provisions in
this License will apply to all Technology in this distribution.

IV.    INTELLECTUAL PROPERTY REQUIREMENTS

As a condition to Your License, You agree to comply with the following
restrictions and responsibilities:

A.    License and Copyright Notices. You must include a copy of this
Java Research License in a Readme file for any Technology or
Modifications you distribute. You must also include the following
statement, "Use and distribution of this technology is subject to the
Java Research License included herein", (a) once prominently in the
source code tree and/or specifications for Your source code
distributions, and (b) once in the same file as Your copyright or
proprietary notices for Your binary code distributions. You must cause
any files containing Your Modification to carry prominent notice
stating that You changed the files. You must not remove or alter any
copyright or other proprietary notices in the Technology.

B.    Licensee Exchanges.    Any Technology and Modifications You
receive from any Licensee are governed by this License.

V.    GENERAL TERMS.

A.    Disclaimer Of Warranties.

THE TECHNOLOGY IS PROVIDED "AS IS", WITHOUT WARRANTIES OF ANY KIND,
EITHER EXPRESS OR IMPLIED INCLUDING, WITHOUT LIMITATION, WARRANTIES
THAT THE TECHNOLOGY IS FREE OF DEFECTS, MERCHANTABLE, FIT FOR A
PARTICULAR PURPOSE, OR NON-INFRINGING OF THIRD PARTY RIGHTS.  YOU
AGREE THAT YOU BEAR THE ENTIRE RISK IN CONNECTION WITH YOUR USE AND
DISTRIBUTION OF ANY AND ALL TECHNOLOGY  UNDER THIS LICENSE.

B.    Infringement; Limitation Of Liability.

1.    If any portion of, or functionality implemented by, the
Technology becomes the subject of a claim or threatened claim of
infringement ("Affected Materials"), Sun may, in its unrestricted
discretion, suspend Your rights to use and distribute the Affected
Materials under this License. Such suspension of rights will be
effective immediately upon Sun's posting of notice of suspension on
the Technology Site.

2.    IN NO EVENT WILL SUN BE LIABLE FOR ANY DIRECT, INDIRECT,
PUNITIVE, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES IN CONNECTION
WITH OR ARISING OUT OF THIS LICENSE (INCLUDING, WITHOUT LIMITATION,
LOSS OF PROFITS, USE, DATA, OR ECONOMIC ADVANTAGE OF ANY SORT),
HOWEVER IT ARISES AND ON ANY THEORY OF LIABILITY (including
negligence), WHETHER OR NOT SUN HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.  LIABILITY UNDER THIS SECTION V.B.2 SHALL BE SO LIMITED
AND EXCLUDED, NOTWITHSTANDING FAILURE OF THE ESSENTIAL PURPOSE OF ANY
REMEDY.

C.     Termination.

1.    You may terminate this License at any time by notifying Sun in a
writing addressed to Sun Microsystems, Inc., 4150 Network Circle,
Santa Clara, California 95054, Attn.: Legal Department/Products and
Technology Law.

2.    All Your rights will terminate under this License if You fail to
comply with any of its material terms or conditions and do not cure
such failure within thirty (30) days after becoming aware of such
noncompliance.

3.    Upon termination, You must discontinue all uses and distribution
under this agreement, and all provisions of this Section V ("General
Terms") shall survive termination.

D.     Miscellaneous.


1.    Trademark.  You agree to comply with Sun's Trademark & Logo
Usage Requirements, as modified from time to time, available at
http://www.sun.com/policies/trademarks/.  Except as expressly provided
in this License, You are granted no rights in or to any Sun trademarks
now or hereafter used or licensed by Sun.

2.    Integration.  This License represents the complete agreement of
the parties concerning the subject matter hereof.

3.    Severability.  If any provision of this License is held
unenforceable, such provision shall be reformed to the extent
necessary to make it enforceable unless to do so would defeat the
intent of the parties, in which case, this License shall terminate.

4.    Governing Law.  This License is governed by the laws of the
United States and the State of California, as applied to contracts
entered into and performed in California between California residents.
In no event shall this License be construed against the drafter.

5.    Export Control.   As further described at
http://www.sun.com/its, you agree to comply with the U.S. export
controls and trade laws of other countries that apply to Technology
and Modifications.

EOF_LICENSE

agreed=
while [ x$agreed = x ]; do
        echo
        echo "Do you agree to the above license terms? [yes or no] "
        read reply leftover
        case $reply in
                y* | Y*)
                        agreed=1
                        ;;
                n* | n*)
                        echo
                        echo "If you don't agree to the license you can't build this software"
                        exit 1
                        ;;
        esac
done
