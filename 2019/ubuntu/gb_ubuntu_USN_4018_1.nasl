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
  script_oid("1.3.6.1.4.1.25623.1.0.844054");
  script_version("2019-06-20T06:01:12+0000");
  script_cve_id("CVE-2019-12435", "CVE-2019-12436");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-06-20 06:01:12 +0000 (Thu, 20 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-06-20 02:00:31 +0000 (Thu, 20 Jun 2019)");
  script_name("Ubuntu Update for samba USN-4018-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU19\.04");

  script_xref(name:"USN", value:"4018-1");
  script_xref(name:"URL", value:"https://lists.ubuntu.com/archives/ubuntu-security-announce/2019-June/004963.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'samba'
  package(s) announced via the USN-4018-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"It was discovered that Samba incorrectly handled certain RPC messages. A
remote attacker could possibly use this issue to cause Samba to crash,
resulting in a denial of service. (CVE-2019-12435)

It was discovered that Samba incorrectly handled LDAP pages searches. A
remote attacker could possibly use this issue to cause Samba to crash,
resulting in a denial of service. (CVE-2019-12436)");

  script_tag(name:"affected", value:"'samba' package(s) on Ubuntu 19.04.");

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

if(release == "UBUNTU19.04") {

  if(!isnull(res = isdpkgvuln(pkg:"samba", ver:"2:4.10.0+dfsg-0ubuntu2.2", rls:"UBUNTU19.04"))) {
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
