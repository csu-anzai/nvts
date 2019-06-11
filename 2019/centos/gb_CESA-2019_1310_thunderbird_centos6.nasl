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
  script_oid("1.3.6.1.4.1.25623.1.0.883063");
  script_version("2019-06-11T06:16:55+0000");
  script_cve_id("CVE-2018-18511", "CVE-2019-5798", "CVE-2019-7317", "CVE-2019-9797", "CVE-2019-9800", "CVE-2019-9817", "CVE-2019-9819", "CVE-2019-9820", "CVE-2019-11691", "CVE-2019-11692", "CVE-2019-11693", "CVE-2019-11698");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-06-11 06:16:55 +0000 (Tue, 11 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-06-11 02:00:36 +0000 (Tue, 11 Jun 2019)");
  script_name("CentOS Update for thunderbird CESA-2019:1310 centos6 ");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms", re:"ssh/login/release=CentOS6");

  script_xref(name:"CESA", value:"2019:1310");
  script_xref(name:"URL", value:"http://lists.centos.org/pipermail/centos-announce/2019-June/023327.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'thunderbird'
  package(s) announced via the CESA-2019:1310 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Mozilla Thunderbird is a standalone mail and newsgroup client.

This update upgrades Thunderbird to version 60.7.0.

Security Fix(es):

  * Mozilla: Memory safety bugs fixed in Firefox 67 and Firefox ESR 60.7
(CVE-2019-9800)

  * Mozilla: Cross-origin theft of images with createImageBitmap
(CVE-2019-9797)

  * Mozilla: Stealing of cross-domain images using canvas (CVE-2019-9817)

  * Mozilla: Compartment mismatch with fetch API (CVE-2019-9819)

  * Mozilla: Use-after-free of ChromeEventHandler by DocShell (CVE-2019-9820)

  * Mozilla: Use-after-free in XMLHttpRequest (CVE-2019-11691)

  * Mozilla: Use-after-free removing listeners in the event listener manager
(CVE-2019-11692)

  * Mozilla: Buffer overflow in WebGL bufferdata on Linux (CVE-2019-11693)

  * mozilla: Cross-origin theft of images with ImageBitmapRenderingContext
(CVE-2018-18511)

  * chromium-browser: Out of bounds read in Skia (CVE-2019-5798)

  * Mozilla: Theft of user history data through drag and drop of hyperlinks
to and from bookmarks (CVE-2019-11698)

  * libpng: use-after-free in png_image_free in png.c (CVE-2019-7317)

For more details about the security issue(s), including the impact, a CVSS
score, acknowledgments, and other related information, refer to the CVE
page(s) listed in the References section.");

  script_tag(name:"affected", value:"'thunderbird' package(s) on CentOS 6.");

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

  if(!isnull(res = isrpmvuln(pkg:"thunderbird", rpm:"thunderbird~60.7.0~1.el6.centos", rls:"CentOS6"))) {
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