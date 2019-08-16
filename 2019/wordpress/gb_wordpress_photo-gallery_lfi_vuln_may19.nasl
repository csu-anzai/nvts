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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112629");
  script_version("2019-08-15T13:26:21+0000");
  script_tag(name:"last_modification", value:"2019-08-15 13:26:21 +0000 (Thu, 15 Aug 2019)");
  script_tag(name:"creation_date", value:"2019-08-15 13:19:03 +0000 (Thu, 15 Aug 2019)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");

  script_cve_id("CVE-2019-14798");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress Photo Gallery Plugin < 1.5.25 LFI Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"WordPress Photo Gallery plugin is prone to an authenticated local file inclusion (LFI) vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"WordPress Photo Gallery plugin before 1.5.25.");

  script_tag(name:"solution", value:"Update to version 1.5.25 or later.");

  script_xref(name:"URL", value:"https://www.pluginvulnerabilities.com/2019/05/14/authenticated-local-file-inclusion-lfi-vulnerability-in-photo-gallery-by-10web/");
  script_xref(name:"URL", value:"https://wordpress.org/plugins/photo-gallery/#developers");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if(!port = get_app_port(cpe: CPE))
  exit(0);

if(!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if(dir == "/")
  dir = "";

url = dir + "/wp-content/plugins/photo-gallery/readme.txt";
res = http_get_cache(port: port, item: url);

if((res =~ "Photo Gallery by (WD|10Web) - Responsive (Photo|Image) Gallery" || "=== Gallery ===" >< res ||
     "Photo Gallery by 10Web - Mobile-Friendly Image Gallery" >< res) && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if(!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "1.5.25")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "1.5.25", file_checked: url);
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(99);
