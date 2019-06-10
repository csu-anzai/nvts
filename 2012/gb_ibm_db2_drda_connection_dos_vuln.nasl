###############################################################################
# OpenVAS Vulnerability Test
#
# IBM DB2 Chaining Functionality DRDA Module DoS Vulnerability
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:ibm:db2";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.802456");
  script_version("2019-05-17T11:35:17+0000");
  script_cve_id("CVE-2012-2180");
  script_bugtraq_id(53873);
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"2019-05-17 11:35:17 +0000 (Fri, 17 May 2019)");
  script_tag(name:"creation_date", value:"2012-09-06 16:20:17 +0530 (Thu, 06 Sep 2012)");

  script_name("IBM DB2 Chaining Functionality DRDA Module DoS Vulnerability");

  script_xref(name:"URL", value:"http://secunia.com/advisories/49437/");
  script_xref(name:"URL", value:"http://xforce.iss.net/xforce/xfdb/75418");
  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg1IC82234");
  script_xref(name:"URL", value:"http://www-304.ibm.com/support/docview.wss?uid=swg21597090");

  script_tag(name:"qod_type", value:"remote_banner");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 Greenbone Networks GmbH");
  script_family("Databases");
  script_dependencies("gb_ibm_db2_remote_detect.nasl");
  script_mandatory_keys("IBM-DB2/installed");

  script_tag(name:"impact", value:"Successful exploitation allows remote users to cause denial of service.");

  script_tag(name:"affected", value:"IBM DB2 version 9.7 before FP6 and IBM DB2 version 9.8 before FP5");

  script_tag(name:"insight", value:"The flaw is caused due an error within chaining functionality in the
  Distributed Relational Database Architecture (DRDA) module, which can be
  exploited to cause a crash by sending a specially crafted DRDA request.");

  script_tag(name:"solution", value:"Upgrade to IBM DB2 version 9.7 FP6, 9.8 FP5 or later.");

  script_tag(name:"summary", value:"The host is running IBM DB2 and is prone to denial of service vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name:"URL", value:"http://www-01.ibm.com/support/docview.wss?uid=swg27007053");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if(!infos = get_app_version_and_proto(cpe: CPE, port: port, exit_no_version: TRUE)) exit(0);
version = infos["version"];
proto = infos["proto"];

if (version =~ "^09\.07\.") {
  if (version_is_less(version: version, test_version: "09.07.6")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "09.07.6");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

if (version =~ "^09\.08\.") {
  if (version_is_less(version: version, test_version: "09.08.5")) {
    report = report_fixed_ver(installed_version: version, fixed_version: "09.08.5");
    security_message(port: port, data: report, proto: proto);
    exit(0);
  }
}

exit(0);
