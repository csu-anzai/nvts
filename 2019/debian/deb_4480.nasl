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
  script_oid("1.3.6.1.4.1.25623.1.0.704480");
  script_version("2019-07-13T02:00:06+0000");
  script_cve_id("CVE-2019-10192", "CVE-2019-10193");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-07-13 02:00:06 +0000 (Sat, 13 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-13 02:00:06 +0000 (Sat, 13 Jul 2019)");
  script_name("Debian Security Advisory DSA 4480-1 (redis - security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB(10|9)");

  script_xref(name:"URL", value:"https://www.debian.org/security/2019/dsa-4480.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DSA-4480-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'redis'
  package(s) announced via the DSA-4480-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Multiple vulnerabilities were discovered in the HyperLogLog implementation
of Redis, a persistent key-value database, which could result in denial
of service or potentially the execution of arbitrary code.");

  script_tag(name:"affected", value:"'redis' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For the oldstable distribution (stretch), these problems have been fixed
in version 3:3.2.6-3+deb9u3.

For the stable distribution (buster), these problems have been fixed in
version 5:5.0.3-4+deb10u1.

We recommend that you upgrade your redis packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"redis", ver:"5:5.0.3-4+deb10u1", rls:"DEB10"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-sentinel", ver:"5:5.0.3-4+deb10u1", rls:"DEB10"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-server", ver:"5:5.0.3-4+deb10u1", rls:"DEB10"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-tools", ver:"5:5.0.3-4+deb10u1", rls:"DEB10"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-sentinel", ver:"3:3.2.6-3+deb9u3", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-server", ver:"3:3.2.6-3+deb9u3", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"redis-tools", ver:"3:3.2.6-3+deb9u3", rls:"DEB9"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);