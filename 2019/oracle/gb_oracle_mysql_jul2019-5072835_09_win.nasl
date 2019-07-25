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

CPE = "cpe:/a:oracle:mysql";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142659");
  script_version("2019-07-24T02:19:13+0000");
  script_tag(name:"last_modification", value:"2019-07-24 02:19:13 +0000 (Wed, 24 Jul 2019)");
  script_tag(name:"creation_date", value:"2019-07-24 02:18:35 +0000 (Wed, 24 Jul 2019)");
  script_tag(name:"cvss_base", value:"7.6");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:H/Au:N/C:C/I:C/A:C");

  script_cve_id("CVE-2019-2822", "CVE-2019-2800", "CVE-2019-2795", "CVE-2019-2812", "CVE-2019-2834",
                "CVE-2019-2785", "CVE-2019-2879", "CVE-2019-2780", "CVE-2019-2784", "CVE-2019-2801",
                "CVE-2019-2796", "CVE-2019-2802", "CVE-2019-2803", "CVE-2019-2808", "CVE-2019-2810",
                "CVE-2019-2815", "CVE-2019-2830", "CVE-2019-2752", "CVE-2019-2811", "CVE-2019-2826",
                "CVE-2019-2789", "CVE-2019-2814");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Oracle MySQL 8.0.x < 8.0.17 Security Update (2019-5072835) - Windows");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_mandatory_keys("MySQL/installed", "Host/runs_windows");

  script_tag(name:"summary", value:"Oracle MySQL is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"MySQL 8.0.16 and prior.");

  script_tag(name:"solution", value:"Update to version 8.0.17 or later.");

  script_xref(name:"URL", value:"https://www.oracle.com/technetwork/security-advisory/cpujul2019-5072835.html#AppendixMSQL");

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

if (version_in_range(version: version, test_version: "8.0", test_version2: "8.0.16")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "8.0.17", install_path: path);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
