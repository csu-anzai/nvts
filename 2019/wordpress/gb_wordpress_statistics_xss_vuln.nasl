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

CPE = 'cpe:/a:wordpress:wordpress';

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.142359");
  script_version("2019-05-03T08:15:51+0000");
  script_tag(name:"last_modification", value:"2019-05-03 08:15:51 +0000 (Fri, 03 May 2019)");
  script_tag(name:"creation_date", value:"2019-05-03 07:47:41 +0000 (Fri, 03 May 2019)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");

  script_cve_id("CVE-2019-10864");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  script_name("WordPress WP Statistics Plugin < 12.6.3 XSS Vulnerability");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2019 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name:"summary", value:"The WP Statistics plugin for WordPress is prone to a cross-site scripting
  vulnerability, allowing a remote attacker to inject arbitrary web script or HTML via the Referer header of a GET
  request.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"affected", value:"WP Statistics plugin 12.6.2 and prior.");

  script_tag(name:"solution", value:"Update to version 12.6.3 or later.");

  script_xref(name:"URL", value:"https://medium.com/@aramburu/cve-2019-10864-wordpress-7aebc24751c4");
  script_xref(name:"URL", value:"https://github.com/wp-statistics/wp-statistics/commit/5aec0a08680f0afea387267a8d1b9fbb3379247c");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

url = dir + "/wp-content/plugins/wp-statistics/readme.txt";
res = http_get_cache(port: port, item: url);

if ("WP Statistics" >< res && "Changelog" >< res) {
  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);
  if (!isnull(vers[1])) {
    if (version_is_less(version: vers[1], test_version: "12.6.3")) {
      report = report_fixed_ver(installed_version: vers[1], fixed_version: "12.6.3", file_checked: url);
      security_message(port: port, data: report);
      exit(0);
    }
  }
}

exit(99);
