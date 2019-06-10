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
  script_oid("1.3.6.1.4.1.25623.1.0.843992");
  script_version("2019-05-03T11:15:46+0000");
  script_cve_id("CVE-2018-12020", "CVE-2019-6690");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"2019-05-03 11:15:46 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2019-05-03 02:00:34 +0000 (Fri, 03 May 2019)");
  script_name("Ubuntu Update for python-gnupg USN-3964-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=(UBUNTU18\.10|UBUNTU19\.04|UBUNTU18\.04 LTS)");

  script_xref(name:"USN", value:"3964-1");
  script_xref(name:"URL", value:"https://lists.ubuntu.com/archives/ubuntu-security-announce/2019-May/004876.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'python-gnupg'
  package(s) announced via the USN-3964-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Marcus Brinkmann discovered that GnuPG before 2.2.8 improperly handled certain
command line parameters. A remote attacker could use this to spoof the output of
GnuPG and cause unsigned e-mail to appear signed.
(CVE-2018-12020)

It was discovered that python-gnupg incorrectly handled the GPG passphrase. A
remote attacker could send a specially crafted passphrase that would allow them
to control the output of encryption and decryption operations.
(CVE-2019-6690)");

  script_tag(name:"affected", value:"'python-gnupg' package(s) on Ubuntu 19.04, Ubuntu 18.10, Ubuntu 18.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "UBUNTU18.10") {

  if(!isnull(res = isdpkgvuln(pkg:"python-gnupg", ver:"0.4.1-1ubuntu1.18.10.1", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"python3-gnupg", ver:"0.4.1-1ubuntu1.18.10.1", rls:"UBUNTU18.10"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU19.04") {

  if(!isnull(res = isdpkgvuln(pkg:"python-gnupg", ver:"0.4.3-1ubuntu1.19.04.1", rls:"UBUNTU19.04"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"python3-gnupg", ver:"0.4.3-1ubuntu1.19.04.1", rls:"UBUNTU19.04"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU18.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"python-gnupg", ver:"0.4.1-1ubuntu1.18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(!isnull(res = isdpkgvuln(pkg:"python3-gnupg", ver:"0.4.1-1ubuntu1.18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
