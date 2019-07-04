###############################################################################
# OpenVAS Vulnerability Test
#
# Auto-generated from advisory DSA 4357-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.704357");
  script_version("2019-07-04T09:25:28+0000");
  script_cve_id("CVE-2018-11759");
  script_name("Debian Security Advisory DSA 4357-1 (libapache-mod-jk - security update)");
  script_tag(name:"last_modification", value:"2019-07-04 09:25:28 +0000 (Thu, 04 Jul 2019)");
  script_tag(name:"creation_date", value:"2018-12-20 00:00:00 +0100 (Thu, 20 Dec 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4357.html");
  script_xref(name:"URL", value:"https://tomcat.apache.org/connectors-doc/miscellaneous/changelog.html#Changes_between_1.2.42_and_1.2.43");
  script_xref(name:"URL", value:"https://tomcat.apache.org/connectors-doc/miscellaneous/changelog.html#Changes_between_1.2.43_and_1.2.44");
  script_xref(name:"URL", value:"https://tomcat.apache.org/connectors-doc/miscellaneous/changelog.html#Changes_between_1.2.44_and_1.2.45");
  script_xref(name:"URL", value:"https://tomcat.apache.org/connectors-doc/miscellaneous/changelog.html#Changes_between_1.2.45_and_1.2.46");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9");
  script_tag(name:"affected", value:"libapache-mod-jk on Debian Linux");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 1:1.2.46-0+deb9u1.

We recommend that you upgrade your libapache-mod-jk packages.");

  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/libapache-mod-jk");
  script_tag(name:"summary", value:"Raphael Arrouas and Jean Lejeune discovered an access control bypass
vulnerability in mod_jk, the Apache connector for the Tomcat Java
servlet engine. The vulnerability is addressed by upgrading mod_jk to
the new upstream version 1.2.46, which includes additional changes.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"libapache-mod-jk-doc", ver:"1:1.2.46-0+deb9u1", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libapache2-mod-jk", ver:"1:1.2.46-0+deb9u1", rls:"DEB9"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}