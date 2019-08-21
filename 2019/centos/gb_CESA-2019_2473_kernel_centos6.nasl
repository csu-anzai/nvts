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
  script_oid("1.3.6.1.4.1.25623.1.0.883096");
  script_version("2019-08-20T10:47:01+0000");
  script_cve_id("CVE-2017-17805", "CVE-2018-17972", "CVE-2019-1125", "CVE-2019-5489");
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2019-08-20 10:47:01 +0000 (Tue, 20 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-17 02:00:45 +0000 (Sat, 17 Aug 2019)");
  script_name("CentOS Update for kernel CESA-2019:2473 centos6 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS6");

  script_xref(name:"CESA", value:"2019:2473");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2019-August/023404.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'kernel'
  package(s) announced via the CESA-2019:2473 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The kernel packages contain the Linux kernel, the core of any Linux
operating system.

Security Fix(es):

  * Kernel: page cache side channel attacks (CVE-2019-5489)

  * kernel: Salsa20 encryption algorithm does not correctly handle
zero-length inputs allowing local attackers to cause denial-of-service
(CVE-2017-17805)

  * kernel: Unprivileged users able to inspect kernel stacks of arbitrary
tasks (CVE-2018-17972)

  * kernel: hw: Spectre SWAPGS gadget vulnerability (CVE-2019-1125)

For more details about the security issue(s), including the impact, a CVSS
score, acknowledgments, and other related information, refer to the CVE
page(s) listed in the References section.

Bug Fix(es):

  * OOPS with Null Pointer exception in v4l2_ctrl_query_menu when second arg
of function is NULL (BZ#1647975)

  * Another RHEL 6 hang in congestion_wait() (BZ#1658254)

  * kernel crash after running user space script (BZ#1663262)

  * RHEL-6.10: Don't report the use of retpoline on Skylake as vulnerable
(BZ#1666102)

  * Bad pagetable: 000f *pdpt = 0000000000000000 *pde = 0000000000000000
RHEL 6 32bit (BZ#1702782)

  * fs/binfmt_misc.c: do not allow offset overflow [6.10.z] (BZ#1710149)

  * Wrong spectre backport causing linux headers to break compilation of 3rd
party packages (BZ#1722185)");

  script_tag(name:"affected", value:"'kernel' package(s) on CentOS 6.");

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

if(release == "CentOS6") {

  if(!isnull(res = isrpmvuln(pkg:"kernel", rpm:"kernel~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-abi-whitelists", rpm:"kernel-abi-whitelists~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-debug", rpm:"kernel-debug~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-debug-devel", rpm:"kernel-debug-devel~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-devel", rpm:"kernel-devel~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-doc", rpm:"kernel-doc~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-firmware", rpm:"kernel-firmware~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"kernel-headers", rpm:"kernel-headers~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"perf", rpm:"perf~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"python-perf", rpm:"python-perf~2.6.32~754.18.2.el6", rls:"CentOS6"))) {
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