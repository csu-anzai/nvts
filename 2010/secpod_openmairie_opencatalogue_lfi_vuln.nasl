##############################################################################
# OpenVAS Vulnerability Test
#
# openMairie openCatalogue 'dsn[phptype]' Local File Inclusion Vulnerability
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2010 SecPod, http://www.secpod.com
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902054");
  script_version("2019-05-14T08:13:05+0000");
  script_tag(name:"last_modification", value:"2019-05-14 08:13:05 +0000 (Tue, 14 May 2019)");
  script_tag(name:"creation_date", value:"2010-05-25 13:56:16 +0200 (Tue, 25 May 2010)");
  script_cve_id("CVE-2010-1999");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_name("openMairie openCatalogue 'dsn[phptype]' Local File Inclusion Vulnerability");
  script_xref(name:"URL", value:"http://secunia.com/advisories/39688");
  script_xref(name:"URL", value:"http://www.vupen.com/english/advisories/2010/1051");
  script_xref(name:"URL", value:"http://packetstormsecurity.org/1005-exploits/opencatalogue-lfi.txt");

  script_tag(name:"qod_type", value:"remote_vul");
  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2010 SecPod");
  script_family("Web application abuses");
  script_dependencies("gb_openmairie_prdts_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("openmairie/products/detected");

  script_tag(name:"insight", value:"Input passed to the parameter 'dsn[phptype]' in 'scr/soustab.php'
  is not properly verified before being used to include files.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer
  release, disable respective features, remove the product or replace the product by another one.");

  script_tag(name:"summary", value:"This host is running openMairie openCatalogue and is prone to
  local file inclusion vulnerability.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote attackers to include
  or disclose the contents of local files with the privileges of the web server.");

  script_tag(name:"affected", value:"OpenMairie openCatalogue version 1.024 and prior.");

  script_tag(name:"solution_type", value:"WillNotFix");

  exit(0);
}

include("http_func.inc");

openPort = get_http_port(default:80);

openVer = get_kb_item("www/"+ openPort + "/OpenMairie/Open_Catalogue");
if(!openVer)
  exit(0);

openVer = eregmatch(pattern:"^(.+) under (/.*)$", string:openVer);

if(openVer[2] != NULL)
{
  url = string(openVer[2], "/scr/soustab.php?dsn[phptype]=../../../../../../../../vt-rfi.txt");
  sndReq = http_get(item:url, port:openPort);
  rcvRes = http_send_recv(port:openPort, data:sndReq);

  if("/vt-rfi.txt/" >< rcvRes && "failed to open stream" >< rcvRes){
    report = report_vuln_url(port:openPort, url:url);
    security_message(port:openPort, data:report);
    exit(0);
  }
}
