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
  script_oid("1.3.6.1.4.1.25623.1.0.891818");
  script_version("2019-06-15T02:00:08+0000");
  script_cve_id("CVE-2019-12749");
  script_tag(name:"cvss_base", value:"3.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"2019-06-15 02:00:08 +0000 (Sat, 15 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-06-15 02:00:08 +0000 (Sat, 15 Jun 2019)");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1818-1] dbus security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/06/msg00005.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DLA-1818-1");
  script_xref(name:"URL", value:"https://bugs.debian.org/930375");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'dbus'
  package(s) announced via the DSA-1818-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Joe Vennix discovered an authentication bypass vulnerability in dbus, an
asynchronous inter-process communication system. The implementation of
the DBUS_COOKIE_SHA1 authentication mechanism was susceptible to a
symbolic link attack. A local attacker could take advantage of this flaw
to bypass authentication and connect to a DBusServer with elevated
privileges.");

  script_tag(name:"affected", value:"'dbus' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
1.8.22-0+deb8u2.

We recommend that you upgrade your dbus packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"dbus", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"dbus-1-dbg", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"dbus-1-doc", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"dbus-x11", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libdbus-1-3", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libdbus-1-dev", ver:"1.8.22-0+deb8u2", rls:"DEB8"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);