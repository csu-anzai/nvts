###############################################################################
# OpenVAS Vulnerability Test
# $Id: ELSA-2014-1319.nasl 11688 2018-09-28 13:36:28Z cfischer $
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
  script_oid("1.3.6.1.4.1.25623.1.0.123297");
  script_version("$Revision: 11688 $");
  script_tag(name:"creation_date", value:"2015-10-06 14:01:55 +0300 (Tue, 06 Oct 2015)");
  script_tag(name:"last_modification", value:"$Date: 2018-09-28 15:36:28 +0200 (Fri, 28 Sep 2018) $");
  script_name("Oracle Linux Local Check: ELSA-2014-1319");
  script_tag(name:"insight", value:"ELSA-2014-1319 - xerces-j2 security update. Please see the references for more insight.");
  script_tag(name:"solution", value:"Update the affected packages to the latest available version.");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"summary", value:"Oracle Linux Local Security Checks ELSA-2014-1319");
  script_xref(name:"URL", value:"http://linux.oracle.com/errata/ELSA-2014-1319.html");
  script_cve_id("CVE-2013-4002");
  script_tag(name:"cvss_base", value:"7.1");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:C");
  script_tag(name:"qod_type", value:"package");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/oracle_linux", "ssh/login/release", re:"ssh/login/release=OracleLinux(7|6)");
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

if(release == "OracleLinux7")
{
  if ((res = isrpmvuln(pkg:"xerces-j2", rpm:"xerces-j2~2.11.0~17.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-demo", rpm:"xerces-j2-demo~2.11.0~17.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-javadoc", rpm:"xerces-j2-javadoc~2.11.0~17.el7_0", rls:"OracleLinux7")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if(release == "OracleLinux6")
{
  if ((res = isrpmvuln(pkg:"xerces-j2", rpm:"xerces-j2~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-demo", rpm:"xerces-j2-demo~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-apis", rpm:"xerces-j2-javadoc-apis~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-impl", rpm:"xerces-j2-javadoc-impl~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-other", rpm:"xerces-j2-javadoc-other~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-javadoc-xni", rpm:"xerces-j2-javadoc-xni~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }
  if ((res = isrpmvuln(pkg:"xerces-j2-scripts", rpm:"xerces-j2-scripts~2.7.1~12.7.el6_5", rls:"OracleLinux6")) != NULL) {
    security_message(data:res);
    exit(0);
  }

}
if (__pkg_match) exit(99);
  exit(0);

