# OpenVAS Vulnerability Test
# $Id: ssh_keygen.nasl 13568 2019-02-11 10:22:27Z cfischer $
# Description: SSH Secure-RPC Weak Encrypted Authentication
#
# Authors:
# Xue Yong Zhi<xueyong@udel.edu>
#
# Copyright:
# Copyright (C) 2003 Xue Yong Zhi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.11340");
  script_version("$Revision: 13568 $");
  script_tag(name:"last_modification", value:"$Date: 2019-02-11 11:22:27 +0100 (Mon, 11 Feb 2019) $");
  script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
  script_bugtraq_id(2222);
  script_tag(name:"cvss_base", value:"3.6");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:P/I:P/A:N");
  script_cve_id("CVE-2001-0259");

  script_name("SSH Secure-RPC Weak Encrypted Authentication");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2003 Xue Yong Zhi");
  script_family("Gain a shell remotely");
  script_dependencies("ssh_detect.nasl");
  script_require_ports("Services/ssh", 22);
  script_mandatory_keys("ssh/server_banner/available");

  script_tag(name:"solution", value:"Patch and new version are available from SSH.");

  script_tag(name:"summary", value:"You are running SSH Communications Security SSH 1.2.27 - 1.2.30.");

  script_tag(name:"insight", value:"With Secure-RPC, this version can allow local attackers to recover a
  SUN-DES-1 magic phrase generated by another user, which the attacker can use to decrypt that user's private key file.");

  exit(0);
}

include("ssh_func.inc");

port = get_ssh_port(default:22);
banner = get_ssh_server_banner(port:port);
if( ! banner )
  exit(0);

#Looking for SSH product version number  < 1.2.30
if(ereg(string:banner, pattern:"SSH-.*-1\.2\.([1-2][0-9]|30)[^0-9]*$", icase:TRUE))
  security_message(port:port);
