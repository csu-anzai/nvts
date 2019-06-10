# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) the respective author(s)
#
# SPDX-License-Identifier: GPL-2.0-or-later
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.891719");
  script_version("$Revision: 14297 $");
  script_cve_id("CVE-2018-14498");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1719-1] libjpeg-turbo security update)");
  script_tag(name:"last_modification", value:"$Date: 2019-03-19 08:35:21 +0100 (Tue, 19 Mar 2019) $");
  script_tag(name:"creation_date", value:"2019-03-19 00:00:00 +0100 (Tue, 19 Mar 2019)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/03/msg00021.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");
  script_tag(name:"affected", value:"libjpeg-turbo on Debian Linux");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', this issue has been fixed in libjpeg-turbo
version 1:1.3.1-12+deb8u2.

We recommend that you upgrade your libjpeg-turbo packages.");
  script_tag(name:"summary", value:"It was discovered that there was a denial of service vulnerability in
the libjpeg-turbo CPU-optimised JPEG image library. A heap-based
buffer over-read could be triggered by a specially-crafted bitmap
(BMP) file.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if((res = isdpkgvuln(pkg:"libjpeg-dev", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjpeg-turbo-progs", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjpeg-turbo-progs-dbg", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjpeg62-turbo", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjpeg62-turbo-dbg", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libjpeg62-turbo-dev", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libturbojpeg1", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libturbojpeg1-dbg", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}
if((res = isdpkgvuln(pkg:"libturbojpeg1-dev", ver:"1:1.3.1-12+deb8u2", rls:"DEB8")) != NULL) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}