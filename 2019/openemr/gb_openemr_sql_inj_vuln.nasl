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

CPE = "cpe:/a:open-emr:openemr";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142700");
  script_version("2019-08-23T08:14:15+0000");
  script_tag(name:"last_modification", value:"2019-08-23 08:14:15 +0000 (Fri, 23 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-06 09:13:00 +0000 (Tue, 06 Aug 2019)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");

  script_cve_id("CVE-2019-14529", "CVE-2019-14530", "CVE-2019-3963", "CVE-2019-3964", "CVE-2019-3965",
                "CVE-2019-3966", "CVE-2019-3967", "CVE-2019-3968");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("OpenEMR < 5.0.2 Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_openemr_detect.nasl");
  script_mandatory_keys("openemr/installed");

  script_tag(name:"summary", value:"OpenEMR is prone to multiple vulnerabilities.");

  script_tag(name:"insight", value:"OpenEMR is prone to multiple vulnerabilities:

  - SQL injection vulnerability in interface/forms/eye_mag/save.php (CVE-2019-14529)

  - Authenticated file download vulnerability (CVE-2019-14530)

  - Multiple XSS vulnerabilities (CVE-2019-3963, CVE-2019-3964, CVE-2019-3965, CVE-2019-3966)

  - Directory Traversal and Arbitrary File Download vulnerability (CVE-2019-3967)

  - Command injection vulnerability (CVE-2019-3968)");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"OpenEMR versions prior to 5.0.2.");

  script_tag(name:"solution", value:"Update to version 5.0.2 or later.");

  script_xref(name:"URL", value:"https://github.com/openemr/openemr/pull/2592");
  script_xref(name:"URL", value:"https://github.com/Wezery/CVE-2019-14530");
  script_xref(name:"URL", value:"https://www.tenable.com/security/research/tra-2019-40");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!infos = get_app_version_and_location(cpe: CPE, port: port, exit_no_version: TRUE))
  exit(0);

version = infos["version"];
location = infos["location"];

if (version_is_less(version: version, test_version: "5.0.2")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "5.0.2", install_path: location);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
