# Copyright (C) 2019 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of the respective author(s)
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

CPE = 'cpe:/a:mantisbt:mantisbt';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142791");
  script_version("2019-08-26T09:34:49+0000");
  script_tag(name:"last_modification", value:"2019-08-26 09:34:49 +0000 (Mon, 26 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-26 09:30:35 +0000 (Mon, 26 Aug 2019)");
  script_tag(name:"cvss_base", value:"5.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:P/A:N");

  script_cve_id("CVE-2019-15074");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("MantisBT < 2.21.2 XSS Vulnerability - Linux");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("mantis_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("mantisbt/detected", "Host/runs_unixoide");

  script_tag(name:"summary", value:"MantisBT is prone to a cross-site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"The Timeline feature in my_view_page.php in MantisBT has a stored cross-site
  scripting (XSS) vulnerability, allowing execution of arbitrary code (if CSP settings permit it) after uploading
  an attachment with a crafted filename. The code is executed for any user having visibility to the issue,
  whenever My View Page is displayed.");

  script_tag(name:"affected", value:"MantisBT versions through 2.21.1.");

  script_tag(name:"solution", value:"Update to version 2.21.2 or later.");

  script_xref(name:"URL", value:"https://mantisbt.org/bugs/view.php?id=25995");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version = infos['version'];
path = infos['location'];

if (version_is_less(version: version, test_version: "2.21.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "2.21.2", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
