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
  script_oid("1.3.6.1.4.1.25623.1.0.891769");
  script_version("2019-05-03T08:55:39+0000");
  script_cve_id("CVE-2019-9928");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-05-03 08:55:39 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2019-04-29 02:00:08 +0000 (Mon, 29 Apr 2019)");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1769-1] gst-plugins-base0.10 security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2019/04/msg00030.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DLA-1769-1");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'gst-plugins-base0.10'
  package(s) announced via the DSA-1769-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"The RTSP connection parser in the base GStreamer packages version 0.10,
which is a streaming media framework, was vulnerable against an
heap-based buffer overflow by sending a longer than allowed session id in
a response and including a semicolon to change the maximum length. This
could result in a remote code execution.");

  script_tag(name:"affected", value:"'gst-plugins-base0.10' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For Debian 8 'Jessie', this problem has been fixed in version
0.10.36-2+deb8u1.

We recommend that you upgrade your gst-plugins-base0.10 packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"gir1.2-gst-plugins-base-0.10", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-alsa", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-gnomevfs", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-plugins-base", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-plugins-base-apps", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-plugins-base-dbg", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-plugins-base-doc", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"gstreamer0.10-x", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libgstreamer-plugins-base0.10-0", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libgstreamer-plugins-base0.10-dev", ver:"0.10.36-2+deb8u1", rls:"DEB8"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);