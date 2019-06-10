# OpenVAS Vulnerability Test
# $Id: deb_2599.nasl 14299 2019-03-19 07:43:42Z cfischer $
# Auto-generated from advisory DSA 2599-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013-2014 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.892599");
  script_version("$Revision: 14299 $");
  script_cve_id("CVE-2013-0743");
  script_name("Debian Security Advisory DSA 2599-1 (nss - mis-issued intermediates)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 08:43:42 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-01-06 00:00:00 +0100 (Sun, 06 Jan 2013)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");

  script_xref(name:"URL", value:"http://www.debian.org/security/2013/dsa-2599.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013-2014 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(6|7)");
  script_tag(name:"affected", value:"nss on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (squeeze), this problem has been fixed in
version 3.12.8-1+squeeze6.

For the testing distribution (wheezy), this problem has been fixed in
version 2:3.13.6-2.

For the unstable distribution (sid), this problem has been fixed in
version 2:3.14.1.with.ckbi.1.93-1.

We recommend that you upgrade your nss packages.");
  script_tag(name:"summary", value:"Google, Inc. discovered that the TurkTrust certification authority
included in the Network Security Service libraries (nss) mis-issued
two intermediate CAs which could be used to generate rogue end-entity
certificates. This update explicitly distrusts those two intermediate
CAs. The two existing TurkTrust root CAs remain active.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libnss3-1d", ver:"3.12.8-1+squeeze6", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-1d-dbg", ver:"3.12.8-1+squeeze6", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-dev", ver:"3.12.8-1+squeeze6", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-tools", ver:"3.12.8-1+squeeze6", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3", ver:"2:3.13.6-2", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-1d", ver:"2:3.13.6-2", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-dbg", ver:"2:3.13.6-2", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-dev", ver:"2:3.13.6-2", rls:"DEB7")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libnss3-tools", ver:"2:3.13.6-2", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}