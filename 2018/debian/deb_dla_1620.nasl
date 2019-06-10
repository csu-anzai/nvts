###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1620.nasl 14281 2019-03-18 14:53:48Z cfischer $
#
# Auto-generated from advisory DLA 1620-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.891620");
  script_version("$Revision: 14281 $");
  script_cve_id("CVE-2018-19134", "CVE-2018-19478");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1620-1] ghostscript security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:53:48 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2018-12-28 00:00:00 +0100 (Fri, 28 Dec 2018)");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/12/msg00019.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");
  script_tag(name:"affected", value:"ghostscript on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
9.06~dfsg-2+deb8u13.

We recommend that you upgrade your ghostscript packages.");
  script_tag(name:"summary", value:"Some vulnerabilities were discovered in ghostscript, an interpreter for the
PostScript language and for PDF.

CVE-2018-19134

The setpattern operator did not properly validate certain types. A specially
crafted PostScript document could exploit this to crash Ghostscript or,
possibly, execute arbitrary code in the context of the Ghostscript process.
This is a type confusion issue because of failure to check whether the
Implementation of a pattern dictionary was a structure type.

CVE-2018-19478

Attempting to open a carefully crafted PDF file results in long-running
computation. A sufficiently bad page tree can lead to us taking significant
amounts of time when checking the tree for recursion.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"ghostscript", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"ghostscript-dbg", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"ghostscript-doc", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"ghostscript-x", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libgs-dev", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libgs9", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libgs9-common", ver:"9.06~dfsg-2+deb8u13", rls:"DEB8")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}