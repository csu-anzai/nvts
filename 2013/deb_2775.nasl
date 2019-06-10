# OpenVAS Vulnerability Test
# $Id: deb_2775.nasl 14276 2019-03-18 14:43:56Z cfischer $
# Auto-generated from advisory DSA 2775-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.892775");
  script_version("$Revision: 14276 $");
  script_cve_id("CVE-2013-6169");
  script_name("Debian Security Advisory DSA 2775-1 (ejabberd - insecure SSL usage)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-18 15:43:56 +0100 (Mon, 18 Mar 2019) $");
  script_tag(name:"creation_date", value:"2013-10-10 00:00:00 +0200 (Thu, 10 Oct 2013)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");

  script_xref(name:"URL", value:"http://www.debian.org/security/2013/dsa-2775.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(6|7)");
  script_tag(name:"affected", value:"ejabberd on Debian Linux");
  script_tag(name:"solution", value:"For the oldstable distribution (squeeze), this problem has been fixed in
version 2.1.5-3+squeeze2.

For the stable distribution (wheezy), this problem has been fixed in
version 2.1.10-4+deb7u1.

For the testing distribution (jessie), and unstable distribution (sid),
this problem will be fixed soon.

We recommend that you upgrade your ejabberd packages.");
  script_tag(name:"summary", value:"It was discovered that ejabberd, a Jabber/XMPP server, uses SSLv2 and
weak ciphers for communication, which are considered insecure. The
software offers no runtime configuration options to disable these. This
update disables the use of SSLv2 and weak ciphers.

The updated package for Debian 7 (wheezy) also contains auxiliary
bugfixes originally staged for the next stable point release.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"ejabberd", ver:"2.1.5-3+squeeze2", rls:"DEB6")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"ejabberd", ver:"2.1.10-4+deb7u1", rls:"DEB7")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}