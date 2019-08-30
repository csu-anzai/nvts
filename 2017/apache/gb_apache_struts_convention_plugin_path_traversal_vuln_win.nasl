# Copyright (C) 2017 Greenbone Networks GmbH
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (C) of their respective author(s)
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

CPE = "cpe:/a:apache:struts";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811797");
  script_version("2019-08-29T07:36:00+0000");
  script_cve_id("CVE-2016-6795");
  script_bugtraq_id(93773);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-08-29 07:36:00 +0000 (Thu, 29 Aug 2019)");
  script_tag(name:"creation_date", value:"2017-09-28 12:14:12 +0530 (Thu, 28 Sep 2017)");
  script_name("Apache Struts 'Convention Plugin' Path Traversal Vulnerability (S2-042) (Windows)");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_apache_struts2_detection.nasl", "os_detection.nasl");
  script_mandatory_keys("ApacheStruts/installed", "Host/runs_windows");

  script_xref(name:"URL", value:"https://cwiki.apache.org/confluence/display/WW/S2-042");

  script_tag(name:"summary", value:"This host is running Apache Struts and is
  prone to a path traversal vulnerability.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"It is possible to prepare a special URL which will be used for
  path traversal and execution of arbitrary code on server side.");

  script_tag(name:"impact", value:"Successful exploitation will allow attacker to
  perform a path traversal attack, which could allow the attacker to execute
  arbitrary code on the targeted server.");

  script_tag(name:"affected", value:"Struts 2.3.1 - 2.3.30

  Struts 2.5 - 2.5.2.");

  script_tag(name:"solution", value:"Upgrade to Struts 2.3.31, 2.5.5 or later.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE))
  exit(0);

if(!infos = get_app_version_and_location(cpe:CPE, port:port, exit_no_version:TRUE))
  exit(0);

vers = infos["version"];
if(vers !~ "^2\.[35]\.")
  exit(99);

path = infos["location"];

if(version_in_range(version:vers, test_version:"2.3.1", test_version2:"2.3.30")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"2.3.31", install_path:path);
  security_message(data:report, port:port);
  exit(0);
}

else if(version_in_range(version:vers, test_version:"2.5.0", test_version2:"2.5.2")) {
  report = report_fixed_ver(installed_version:vers, fixed_version:"2.5.5", install_path:path);
  security_message(data:report, port:port);
  exit(0);
}

exit(99);