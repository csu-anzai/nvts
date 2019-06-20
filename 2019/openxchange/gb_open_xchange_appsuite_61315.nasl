# Copyright (C) 2019 Greenbone Networks GmbH
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

CPE = "cpe:/a:open-xchange:open-xchange_appsuite";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112179");
  script_version("2019-06-19T11:59:35+0000");
  script_tag(name:"last_modification", value:"2019-06-19 11:59:35 +0000 (Wed, 19 Jun 2019)");
  script_tag(name:"creation_date", value:"2019-06-19 12:31:11 +0200 (Wed, 19 Jun 2019)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2019-7158");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Open-Xchange (OX) AppSuite Improper Access Control Vulnerability (Bug ID 61315)");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_ox_app_suite_detect.nasl");
  script_mandatory_keys("open_xchange_appsuite/installed");

  script_tag(name:"summary", value:"Open-Xchange (OX) AppSuite is prone to an improper access control vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"In case users did choose not to 'stay signed in' or the operator disabled that functionality,
  cookies are maintained for a 'session' lifetime to make sure they expire after the browser session has ended.
  Using 'reload' on the existing browser session led to the impression that the session is already terminated as the login
  screen would be shown afterwards. However, those cookies are maintained by the browser for the remainder of the session until
  termination of the browser tab or window.");

  script_tag(name:"impact", value:"Users could get the incorrect impression that their session has been terminated
  after reloading the browser window. In fact, the credentials for authentication (cookies) were maintained and
  other users with physical access to the browser could re-use them to execute API calls and access other users data.");

  script_tag(name:"affected", value:"All Open-Xchange AppSuite versions before 7.8.3-rev53, 7.8.4 before rev51, 7.10.0 before rev25 and 7.10.1 before rev7.");

  script_tag(name:"solution", value:"Update to version 7.8.3-rev53, 7.8.4-rev51, 7.10.0-rev25 or 7.10.1-rev7 respectively.");

  script_xref(name:"URL", value:"https://packetstormsecurity.com/files/152404/Open-Xchange-AppSuite-7.10.1-Information-Disclosure-Improper-Access-Control.html");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE))
  exit(0);

if(!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version = infos['version'];
path = infos['location'];

if(!revision = get_kb_item("open_xchange_appsuite/" + port + "/revision"))
  exit(0);

version += '.' + revision;

if(version_is_less(version: version, test_version: "7.8.3.53")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.8.3.53", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

if(version_in_range(version: version, test_version: "7.8.4", test_version2: "7.8.4.50")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.8.4.51", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

if(version_in_range(version: version, test_version: "7.10.0", test_version2: "7.10.0.24")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.10.0.25", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

if(version_in_range(version: version, test_version: "7.10.1", test_version2: "7.10.1.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "7.10.1.7", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
