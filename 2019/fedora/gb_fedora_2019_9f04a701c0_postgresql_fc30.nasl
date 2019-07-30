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
  script_oid("1.3.6.1.4.1.25623.1.0.876606");
  script_version("2019-07-30T06:12:43+0000");
  script_cve_id("CVE-2019-10164", "CVE-2019-10129");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-07-30 06:12:43 +0000 (Tue, 30 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-26 02:21:46 +0000 (Fri, 26 Jul 2019)");
  script_name("Fedora Update for postgresql FEDORA-2019-9f04a701c0");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC30");

  script_xref(name:"FEDORA", value:"2019-9f04a701c0");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/MAGE6H4FWLKFLHLWVYNPYGQRPIXTUWGB");

  script_tag(name:"summary", value:"The remote host is missing an update for the
  'postgresql' package(s) announced via the FEDORA-2019-9f04a701c0 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is
  present on the target host.");

  script_tag(name:"insight", value:"PostgreSQL is an advanced Object-Relational
  database management system (DBMS). The base postgresql package contains the
  client programs that you&#39, ll need to access a PostgreSQL DBMS server, as
  well as HTML documentation for the whole system.  These client programs can be
  located on the same machine as the PostgreSQL server, or on a remote machine
  that accesses a PostgreSQL server over a network connection.  The PostgreSQL
  server can be found in the postgresql-server sub-package.");

  script_tag(name:"affected", value:"'postgresql' package(s) on Fedora 30.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "FC30") {

  if(!isnull(res = isrpmvuln(pkg:"postgresql", rpm:"postgresql~11.4~1.fc30", rls:"FC30"))) {
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
