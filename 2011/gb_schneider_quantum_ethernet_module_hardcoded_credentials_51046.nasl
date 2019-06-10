###############################################################################
# OpenVAS Vulnerability Test
#
# Schneider Electric Quantum Ethernet Module Hardcoded Credentials Authentication Bypass Vulnerability
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
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
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.103363");
  script_bugtraq_id(51046);
  script_cve_id("CVE-2011-4859", "CVE-2011-4860", "CVE-2011-4861");
  script_version("2019-06-06T07:39:31+0000");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_name("Schneider Electric Quantum Ethernet Module Hardcoded Credentials Authentication Bypass Vulnerability");
  script_tag(name:"last_modification", value:"2019-06-06 07:39:31 +0000 (Thu, 06 Jun 2019)");
  script_tag(name:"creation_date", value:"2011-12-14 10:13:05 +0100 (Wed, 14 Dec 2011)");
  script_category(ACT_ATTACK);
  script_family("Default Accounts");
  script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
  script_dependencies("find_service.nasl");
  script_require_ports(23);
  script_mandatory_keys("telnet/vxworks/detected");

  script_xref(name:"URL", value:"http://www.securityfocus.com/bid/51046");
  script_xref(name:"URL", value:"http://www.schneider-electric.com/site/home/index.cfm/ww/?selectCountry=true");
  script_xref(name:"URL", value:"http://www.us-cert.gov/control_systems/pdf/ICS-ALERT-11-346-01.pdf");
  script_xref(name:"URL", value:"http://reversemode.com/index.php?option=com_content&task=view&id=80&Itemid=1");

  script_tag(name:"summary", value:"Schneider Electric Quantum Ethernet Module is prone to an authentication-
  bypass vulnerability.");

  script_tag(name:"impact", value:"Attackers can exploit this issue to gain access to the Telnet port
  service, Windriver Debug port service, and FTP service. Attackers can exploit this vulnerability
  to execute arbitrary code within the context of the vulnerable device.");

  script_tag(name:"solution", value:"Updates are available. Please see the references for more information.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_vul");

  exit(0);
}

include("telnet_func.inc");
include("misc_func.inc");
include("dump.inc");

port = 23;
if(!get_port_state(port))exit(0);
banner = telnet_get_banner(port:port);
if("VxWorks" >!< banner) exit(0);

credentials = make_array("pcfactory","pcfactory",
                         "loader","fwdownload",
                         "ntpupdate","ntpupdate",
                         "sysdiag","factorycast@schneider",
                         "test","testingpw",
                         "USER","USER",
                         "USER","USERUSER",
                         "webserver","webpages",
                         "fdrusers","sresurdf",
                         "nic2212","poiuypoiuy",
                         "nimrohs2212","qwertyqwerty",
                         "nip2212","fcsdfcsd",
                         "ftpuser","ftpuser",
                         "noe77111_v500","RcSyyebczS",
                         "AUTCSE","RybQRceeSd",
                         "AUT_CSE","cQdd9debez",
                         "target","RcQbRbzRyc");

foreach credential (keys(credentials)) {

  soc = open_sock_tcp(port);
  if(!soc) continue;

  send(socket:soc,data:string(credential,"\r\n"));
  answer = recv(socket:soc, length:4096);

  send(socket:soc, data:string(credentials[credential],"\r\n"));
  answer = recv(socket:soc, length:4096);

  if("->" >!< answer) {
    close(soc);
    continue;
  }

  send(socket:soc, data:string("version\r\n"));
  answer = recv(socket:soc, length:4096);

  if( answer =~ "VxWorks.*Version" && answer =~ "Boot line:" && answer =~ "Kernel:") {

    report = string("It was possible to login via telnet into the remote host using the following\nUsername/Password combination:\n\n",credential,":",credentials[credential],"\n\nWhich produces the following output for the 'version' command:\n\n",answer,"\n");

    security_message(port:port,data:report);
    close(soc);
    exit(0);
  }
  close(soc);
}

exit(99);