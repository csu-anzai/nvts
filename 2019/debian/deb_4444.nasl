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
  script_oid("1.3.6.1.4.1.25623.1.0.704444");
  script_version("2019-06-04T06:44:21+0000");
  script_cve_id("CVE-2018-12126", "CVE-2018-12127", "CVE-2018-12130", "CVE-2019-11091");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-06-04 06:44:21 +0000 (Tue, 04 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-05-16 02:00:12 +0000 (Thu, 16 May 2019)");
  script_name("Debian Security Advisory DSA 4444-1 (linux - security update)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB9");

  script_xref(name:"URL", value:"https://www.debian.org/security/2019/dsa-4444.html");
  script_xref(name:"URL", value:"https://security-tracker.debian.org/tracker/DSA-4444-1");
  script_xref(name:"URL", value:"https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'linux'
  package(s) announced via the DSA-4444-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Multiple researchers have discovered vulnerabilities in the way the
Intel processor designs have implemented speculative forwarding of data
filled into temporary microarchitectural structures (buffers). This
flaw could allow an attacker controlling an unprivileged process to
read sensitive information, including from the kernel and all other
processes running on the system or cross guest/host boundaries to read
host memory.

See the references for more details.

To fully resolve these vulnerabilities it is also necessary to install
updated CPU microcode. An updated intel-microcode package (only
available in Debian non-free) will be provided via a separate DSA. The
updated CPU microcode may also be available as part of a system firmware
('BIOS') update.

In addition, this update includes a fix for a regression causing
deadlocks inside the loopback driver, which was introduced by the update
to 4.9.168 in the last Stretch point release.");

  script_tag(name:"affected", value:"'linux' package(s) on Debian Linux.");

  script_tag(name:"solution", value:"For the stable distribution (stretch), these problems have been fixed in
version 4.9.168-1+deb9u2.

We recommend that you upgrade your linux packages.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if(!isnull(res = isdpkgvuln(pkg:"hyperv-daemons", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libcpupower-dev", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libcpupower1", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"libusbip-dev", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-compiler-gcc-6-arm", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-compiler-gcc-6-s390", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-compiler-gcc-6-x86", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-cpupower", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-doc-4.9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-3-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-4-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-5-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-6-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-7-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-8-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-armel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-armhf", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-i386", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-mips", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-mips64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-mipsel", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-ppc64el", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-all-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-common", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-common-rt", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-headers-4.9.0-9-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-3-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-4-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-5-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-6-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-7-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-8-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-4kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-4kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-5kc-malta", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-5kc-malta-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-686", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-686-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-arm64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-arm64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-armmp", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-armmp-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-armmp-lpae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-armmp-lpae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-loongson-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-loongson-3-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-marvell", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-marvell-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-octeon", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-octeon-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-powerpc64le", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-powerpc64le-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-rt-686-pae", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-rt-686-pae-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-rt-amd64", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-rt-amd64-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-s390x", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-image-4.9.0-9-s390x-dbg", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-kbuild-4.9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-libc-dev", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-manual-4.9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-perf-4.9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-source-4.9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-3", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-4", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-5", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-6", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-7", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-8", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"linux-support-4.9.0-9", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}
if(!isnull(res = isdpkgvuln(pkg:"usbip", ver:"4.9.168-1+deb9u2", rls:"DEB9"))) {
  report += res;
}

if(report != "") {
  security_message(data:report);
} else if(__pkg_match) {
  exit(99);
}

exit(0);