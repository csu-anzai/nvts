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
  script_oid("1.3.6.1.4.1.25623.1.0.876482");
  script_version("2019-08-09T06:43:03+0000");
  script_cve_id("CVE-2019-10152");
  script_tag(name:"cvss_base", value:"2.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:H/Au:N/C:P/I:P/A:N");
  script_tag(name:"last_modification", value:"2019-08-09 06:43:03 +0000 (Fri, 09 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-06-13 02:13:10 +0000 (Thu, 13 Jun 2019)");
  script_name("Fedora Update for podman FEDORA-2019-886b4d2fb6");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC30");

  script_xref(name:"FEDORA", value:"2019-886b4d2fb6");
  script_xref(name:"URL", value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/3MJ7Q2Q7GWZQNNJVBO4WWCYYI7IUPM22");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'podman'
  package(s) announced via the FEDORA-2019-886b4d2fb6 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"podman (Pod Manager) is a fully featured container engine that is a simple daemonless
tool.  podman provides a Docker-CLI comparable command line that eases the transition from
other container engines and allows the management of pods, containers and images.  Simply
put: alias docker=podman.  Most podman commands can be run as a regular user, without
requiring additional privileges.

podman uses Buildah(1) internally to create container images. Both tools share image (not
container) storage, hence each can use or manipulate images (but not containers) created
by the other.

Manage Pods, Containers and Container Images
libpod Simple management tool for pods, containers and images");

  script_tag(name:"affected", value:"'podman' package(s) on Fedora 30.");

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

  if(!isnull(res = isrpmvuln(pkg:"podman", rpm:"podman~1.4.0~2.fc30", rls:"FC30"))) {
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