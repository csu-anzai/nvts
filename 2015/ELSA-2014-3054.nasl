###############################################################################
# OpenVAS Vulnerability Test
# $Id: ELSA-2014-3054.nasl 11688 2018-09-28 13:36:28Z cfischer $
#
# Oracle Linux Local Check
#
# Authors:
# Eero Volotinen <eero.volotinen@solinor.com>
#
# Copyright:
# Copyright (c) 2015 Eero Volotinen, http://solinor.com
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.123346");
  script_version("$Revision: 11688 $");
  script_tag(name:"creation_date", value:"2015-10-06 14:02:34 +0300 (Tue, 06 Oct 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 15:36:28 +0200 (Fri, 28 Sep 2018) $");
  script_name("Oracle Linux Local Check: ELSA-2014-3054");
  script_tag(name:"insight", value:"ELSA-2014-3054 - unbreakable enterprise kernel security update. Please see the references for more insight.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Oracle Linux Local Security Checks ELSA-2014-3054");
  script_xref(name:"URL", value:"http://linux.oracle.com/errata/ELSA-2014-3054.html");
  script_cve_id("CVE-2014-0196", "CVE-2014-3144", "CVE-2014-3145", "CVE-2012-6647");
  script_tag(name:"cvss_base", value:"6.9");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release", re:"ssh/login/release=OracleLinux(5|6)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Eero Volotinen");
  script_family("Oracle Linux Local Security Checks");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "OracleLinux5")
{
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-headers", rpm:"kernel-uek-headers~2.6.32~400.36.6.el5uek", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mlnx_en", rpm:"mlnx_en~2.6.32~400.36.6.el5uek~1.5.7~2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mlnx_en", rpm:"mlnx_en~2.6.32~400.36.6.el5uekdebug~1.5.7~2", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ofa", rpm:"ofa~2.6.32~400.36.6.el5uek~1.5.1~4.0.58", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ofa", rpm:"ofa~2.6.32~400.36.6.el5uekdebug~1.5.1~4.0.58", rls:"OracleLinux5")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"kernel-uek", rpm:"kernel-uek~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug", rpm:"kernel-uek-debug~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-debug-devel", rpm:"kernel-uek-debug-devel~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-devel", rpm:"kernel-uek-devel~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-doc", rpm:"kernel-uek-doc~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-firmware", rpm:"kernel-uek-firmware~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"kernel-uek-headers", rpm:"kernel-uek-headers~2.6.32~400.36.6.el6uek", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mlnx_en", rpm:"mlnx_en~2.6.32~400.36.6.el6uek~1.5.7~0.1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"mlnx_en", rpm:"mlnx_en~2.6.32~400.36.6.el6uekdebug~1.5.7~0.1", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ofa", rpm:"ofa~2.6.32~400.36.6.el6uek~1.5.1~4.0.58", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"ofa", rpm:"ofa~2.6.32~400.36.6.el6uekdebug~1.5.1~4.0.58", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if (__pkg_match) exit(99);
  exit(0);

