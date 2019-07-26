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
  script_oid("1.3.6.1.4.1.25623.1.0.852619");
  script_version("2019-07-25T11:54:35+0000");
  script_cve_id("CVE-2019-12816", "CVE-2019-9917");
  script_tag(name:"cvss_base", value:"6.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-07-25 11:54:35 +0000 (Thu, 25 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-22 02:00:36 +0000 (Mon, 22 Jul 2019)");
  script_name("openSUSE Update for znc openSUSE-SU-2019:1775-1 (znc)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.0");

  script_xref(name:"openSUSE-SU", value:"2019:1775_1");
  script_xref(name:"URL", value:"http://lists.opensuse.org/opensuse-security-announce/2019-07/msg00037.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'znc'
  package(s) announced via the openSUSE-SU-2019:1775_1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for znc to version 1.7.4 fixes the following issues:

  Security issues fixed:

  - CVE-2019-12816: Fixed a remote code execution in Modules.cpp
  (boo#1138572).

  - CVE-2019-9917: Fixed a denial of service on invalid encoding
  (boo#1130360).


  Patch Instructions:

  To install this openSUSE Security Update use the SUSE recommended
  installation methods
  like YaST online_update or 'zypper patch'.

  Alternatively you can run the command listed for your product:

  - openSUSE Leap 15.1:

  zypper in -t patch openSUSE-2019-1775=1

  - openSUSE Leap 15.0:

  zypper in -t patch openSUSE-2019-1775=1

  - openSUSE Backports SLE-15:

  zypper in -t patch openSUSE-2019-1775=1");

  script_tag(name:"affected", value:"'znc' package(s) on openSUSE Leap 15.0.");

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

if(release == "openSUSELeap15.0") {

  if(!isnull(res = isrpmvuln(pkg:"znc-lang", rpm:"znc-lang~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc", rpm:"znc~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-debuginfo", rpm:"znc-debuginfo~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-debugsource", rpm:"znc-debugsource~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-devel", rpm:"znc-devel~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-perl", rpm:"znc-perl~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-perl-debuginfo", rpm:"znc-perl-debuginfo~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-python3", rpm:"znc-python3~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-python3-debuginfo", rpm:"znc-python3-debuginfo~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-tcl", rpm:"znc-tcl~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"znc-tcl-debuginfo", rpm:"znc-tcl-debuginfo~1.7.4~lp150.28.1", rls:"openSUSELeap15.0"))) {
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
