###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ubuntu_USN_3813_1.nasl 14288 2019-03-18 16:34:17Z cfischer $
#
# Ubuntu Update for pyopenssl USN-3813-1
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.843812");
  script_version("2019-03-26T08:16:24+0000");
  script_cve_id("CVE-2018-1000807", "CVE-2018-1000808");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-03-26 08:16:24 +0000 (Tue, 26 Mar 2019)");
  script_tag(name:"creation_date", value:"2018-11-09 06:05:26 +0100 (Fri, 09 Nov 2018)");
  script_name("Ubuntu Update for pyopenssl USN-3813-1");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Ubuntu Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/ubuntu_linux", "ssh/login/packages", re:"ssh/login/release=UBUNTU(16\.04 LTS)");

  script_xref(name:"USN", value:"3813-1");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/usn-3813-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'pyopenssl'
  package(s) announced via the USN-3813-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present
on the target host.");

  script_tag(name:"insight", value:"It was discovered that pyOpenSSL incorrectly handled memory when handling
X509 objects. A remote attacker could use this issue to cause pyOpenSSL to
crash, resulting in a denial of service, or possibly execute arbitrary
code. (CVE-2018-1000807)

It was discovered that pyOpenSSL incorrectly handled memory when performing
operations on a PKCS #12 store. A remote attacker could possibly use this
issue to cause pyOpenSSL to consume resources, resulting in a denial of
service. (CVE-2018-1000808)");

  script_tag(name:"affected", value:"pyopenssl on Ubuntu 16.04 LTS.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

release = dpkg_get_ssh_release();
if(!release) exit(0);

res = "";

if(release == "UBUNTU16.04 LTS")
{

  if ((res = isdpkgvuln(pkg:"python-openssl", ver:"0.15.1-2ubuntu0.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isdpkgvuln(pkg:"python3-openssl", ver:"0.15.1-2ubuntu0.2", rls:"UBUNTU16.04 LTS")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
