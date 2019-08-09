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
  script_oid("1.3.6.1.4.1.25623.1.0.844098");
  script_version("2019-08-08T06:47:52+0000");
  script_cve_id("CVE-2019-9811", "CVE-2019-11709", "CVE-2019-11711", "CVE-2019-11712",
                "CVE-2019-11713", "CVE-2019-11715", "CVE-2019-11717", "CVE-2019-11719",
                "CVE-2019-11729", "CVE-2019-11730");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-08-08 06:47:52 +0000 (Thu, 08 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-07-18 02:00:49 +0000 (Thu, 18 Jul 2019)");
  script_name("Ubuntu Update for thunderbird USN-4064-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=(UBUNTU18\.10|UBUNTU19\.04|UBUNTU18\.04 LTS|UBUNTU16\.04 LTS)");

  script_xref(name:"USN", value:"4064-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-4064-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'thunderbird'
  package(s) announced via the USN-4064-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"A sandbox escape was discovered in Thunderbird. If a user were tricked in to
installing a malicious language pack, an attacker could exploit this to
gain additional privileges. (CVE-2019-9811)

Multiple security issues were discovered in Thunderbird. If a user were
tricked in to opening a specially crafted website in a browsing context,
an attacker could potentially exploit these to cause a denial of service,
bypass same origin restrictions, conduct cross-site scripting (XSS)
attacks, spoof origin attributes, or execute arbitrary code.
(CVE-2019-11709, CVE-2019-11711, CVE-2019-11712, CVE-2019-11713,
CVE-2019-11715, CVE-2019-11717)

It was discovered that NSS incorrectly handled importing certain
curve25519 private keys. An attacker could exploit this issue to cause
Thunderbird to crash, resulting in a denial of service, or possibly
obtain sensitive information. (CVE-2019-11719)

It was discovered that NSS incorrectly handled certain p256-ECDH public
keys. An attacker could possibly exploit this issue to cause Thunderbird
to crash, resulting in a denial of service. (CVE-2019-11729)

It was discovered that Thunderbird treats all files in a directory as same
origin. If a user were tricked in to downloading a specially crafted HTML
file, an attacker could potentially exploit this to obtain sensitive
information from local files. (CVE-2019-11730)");

  script_tag(name:"affected", value:"'thunderbird' package(s) on Ubuntu 19.04, Ubuntu 18.10, Ubuntu 18.04 LTS, Ubuntu 16.04 LTS.");

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

  if(!isnull(res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.8.0+build1-0ubuntu0.18.10.1", rls:"UBUNTU18.10"))) {
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

  if(!isnull(res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.8.0+build1-0ubuntu0.19.04.1", rls:"UBUNTU19.04"))) {
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

  if(!isnull(res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.8.0+build1-0ubuntu0.18.04.1", rls:"UBUNTU18.04 LTS"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if (__pkg_match) {
    exit(99);
  }
  exit(0);
}

if(release == "UBUNTU16.04 LTS") {

  if(!isnull(res = isdpkgvuln(pkg:"thunderbird", ver:"1:60.8.0+build1-0ubuntu0.16.04.2", rls:"UBUNTU16.04 LTS"))) {
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
