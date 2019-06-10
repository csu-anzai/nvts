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
  script_oid("1.3.6.1.4.1.25623.1.0.891789");
  script_version("2019-06-04T06:44:21+0000");
  script_cve_id("CVE-2018-12126", "CVE-2018-12127", "CVE-2018-12130", "CVE-2019-11091");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-06-04 06:44:21 +0000 (Tue, 04 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-05-17 02:00:09 +0000 (Fri, 17 May 2019)");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1789-1] intel-microcode security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/05/msg00018.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DLA-1789-1");
  script_xref(name:"URL", value:"https://bugs.debian.org/929007");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'intel-microcode'
  package(s) announced via the DSA-1789-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update ships updated CPU microcode for most types of Intel CPUs. It
provides microcode support to implement mitigations for the MSBDS,
MFBDS, MLPDS and MDSUM hardware vulnerabilities.

To fully resolve these vulnerabilities it is also necessary to update
the Linux kernel packages. Please refer to DLA-1787-1 for the Linux
kernel updates required to mitigate these hardware vulnerabilities on
Intel processors.");

  script_tag(name:"affected", value:"'intel-microcode' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
3.20190514.1~deb8u1 of the intel-microcode package, and also by the
Linux kernel package updates described in DLA-1787-1.

We recommend that you upgrade your intel-microcode packages, and Linux
kernel packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"intel-microcode", ver:"3.20190514.1~deb8u1", rls:"DEB8"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);