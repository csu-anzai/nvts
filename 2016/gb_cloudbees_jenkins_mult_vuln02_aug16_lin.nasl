###############################################################################
# OpenVAS Vulnerability Test
#
# CloudBees Jenkins Multiple Vulnerabilities -02 August16 (Linux)
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:jenkins:jenkins";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808268");
  script_version("2019-07-30T03:00:13+0000");
  script_cve_id("CVE-2014-3680", "CVE-2014-3667", "CVE-2014-3666", "CVE-2014-3663",
                "CVE-2014-3662", "CVE-2014-3661");
  script_bugtraq_id(77953, 77963, 88193, 77977, 77955, 77961);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"2019-07-30 03:00:13 +0000 (Tue, 30 Jul 2019)");
  script_tag(name:"creation_date", value:"2016-08-05 09:47:29 +0530 (Fri, 05 Aug 2016)");

  script_name("CloudBees Jenkins Multiple Vulnerabilities -02 August16 (Linux)");

  script_tag(name:"summary", value:"This host is installed with CloudBees
  Jenkins and is prone to multiple vulnerabilities.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");

  script_tag(name:"insight", value:"Multiple flaws are due to,

  - CloudBees Jenkins does not properly prevent downloading of plugins.

  - Insufficient sanitization of packets over the CLI channel.

  - Password exposure in DOM.

  - Error in job configuration permission.

  - Thread exhaustion via vectors related to a CLI handshake.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to obtain sensitive information, to bypass bypass intended access
  restrictions and execute arbitrary code.");

  script_tag(name:"affected", value:"CloudBees Jenkins LTS before 1.565.3 on Linux.");

  script_tag(name:"solution", value:"Upgrade to CloudBees Jenkins LTS 1.565.3 or later.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"https://wiki.jenkins-ci.org/display/SECURITY/Jenkins+Security+Advisory+2014-10-01");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_jenkins_consolidation.nasl", "os_detection.nasl");
  script_mandatory_keys("jenkins/detected", "Host/runs_unixoide");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if(!port = get_app_port(cpe:CPE))
  exit(0);

if(!infos = get_app_full(cpe:CPE, port:port))
  exit(0);

if (!version = infos["version"])
  exit(0);

location = infos["location"];
proto = infos["proto"];

if(version_is_less(version:version, test_version:"1.565.3")) {
  report = report_fixed_ver(installed_version:version, fixed_version:"1.565.3", install_path: location);
  security_message(data:report, port:port, proto:proto);
  exit(0);
}

exit(99);
