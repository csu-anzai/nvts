###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openssl_mult_dos_vuln01_nov15_lin.nasl 13898 2019-02-27 08:37:43Z cfischer $
#
# OpenSSL Multiple Denial of Service Vulnerabilities -01 Nov15 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:openssl:openssl";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806734");
  script_version("$Revision: 13898 $");
  script_cve_id("CVE-2015-0292", "CVE-2014-8176");
  script_bugtraq_id(73228, 75159);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2019-02-27 09:37:43 +0100 (Wed, 27 Feb 2019) $");
  script_tag(name:"creation_date", value:"2015-11-24 18:49:30 +0530 (Tue, 24 Nov 2015)");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_name("OpenSSL Multiple Denial of Service Vulnerabilities -01 Nov15 (Linux)");

  script_tag(name:"summary", value:"This host is running OpenSSL and is prone
  to multiple denial of service vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to:

  - Integer underflow in the 'EVP_DecodeUpdate' function in 'crypto/evp/encode.c' script in the
    base64-decoding implementation.

  - Memory corruption vulnerability while handling data structures.");

  script_tag(name:"impact", value:"Successful exploitation will allow an remote
  attackers to cause a denial of service or possibly have unspecified other impact.");

  script_tag(name:"affected", value:"OpenSSL versions before 0.9.8za, 1.0.0
  before 1.0.0m, and 1.0.1 before 1.0.1h on Linux");

  script_tag(name:"solution", value:"Upgrade to OpenSSL 0.9.8za or 1.0.0m or
  1.0.1h or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name:"URL", value:"http://www.ubuntu.com/usn/USN-2537-1");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20150319.txt");
  script_xref(name:"URL", value:"https://www.openssl.org/news/secadv/20150319.txt");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_openssl_detect.nasl", "gb_openssl_detect_lin.nasl", "os_detection.nasl");
  script_mandatory_keys("openssl/detected", "Host/runs_unixoide");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(isnull(port = get_app_port(cpe:CPE)))
  exit(0);

if(!infos = get_app_version_and_location(cpe:CPE, port:port, exit_no_version:TRUE))
  exit(0);

vers = infos['version'];
path = infos['location'];

if(vers =~ "^0\.9\.8")
{
  if(version_is_less(version:vers, test_version:"0.9.8za"))
  {
    fix = "0.9.8za";
    VULN = TRUE;
  }
}
else if(vers =~ "^1\.0\.0")
{
  if(version_is_less(version:vers, test_version:"1.0.0m"))
  {
    fix = "1.0.0m";
    VULN = TRUE;
  }
}
else if(vers =~ "^1\.0\.1")
{
  if(version_is_less(version:vers, test_version:"1.0.1h"))
  {
    fix = "1.0.1h";
    VULN = TRUE;
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:vers, fixed_version:fix, install_path:path);
  security_message(port:port, data:report);
  exit(0);
}

exit(99);