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

CPE = "cpe:/a:dolibarr:dolibarr";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142681");
  script_version("2019-08-08T06:47:52+0000");
  script_tag(name:"last_modification", value:"2019-08-08 06:47:52 +0000 (Thu, 08 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-07-31 05:12:58 +0000 (Wed, 31 Jul 2019)");
  script_tag(name:"cvss_base", value:"8.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:C/I:C/A:C");

  script_cve_id("CVE-2019-11199", "CVE-2019-11200", "CVE-2019-11201");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("Dolibarr < 9.0.3 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_dolibarr_detect.nasl");
  script_mandatory_keys("dolibarr/detected");

  script_tag(name:"summary", value:"Dolibarr is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Dolibarr is prone to multiple vulnerabilities:

  - Stored XSS vulnerability within uploaded files (CVE-2019-11199)

  - Database backup vulnerability (CVE-2019-11200)

  - Authenticated RCE vulnerbability (CVE-2019-11201)");

  script_tag(name:"affected", value:"Dolibarr prior to version 9.0.3.");

  script_tag(name:"solution", value:"Update to version 9.0.3 or later.");

  script_xref(name:"URL", value:"https://know.bishopfox.com/advisories/dolibarr-version-9-0-1-vulnerabilities");
  script_xref(name:"URL", value:"https://github.com/Dolibarr/dolibarr/blob/develop/ChangeLog");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version  = infos["version"];
location = infos["location"];

if (version_is_less(version: version, test_version: "9.0.3")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "9.0.3", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
