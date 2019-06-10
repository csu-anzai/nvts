###############################################################################
# OpenVAS Vulnerability Test
#
# SMB Remote Version Detection
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.807830");
  script_version("2019-05-16T07:13:31+0000");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"2019-05-16 07:13:31 +0000 (Thu, 16 May 2019)");
  script_tag(name:"creation_date", value:"2016-06-08 09:14:21 +0530 (Wed, 08 Jun 2016)");
  script_name("SMB Remote Version Detection");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Service detection");
  script_dependencies("find_service.nasl", "cifs445.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/transport");

  script_tag(name:"summary", value:"Detection of Server Message Block(SMB).

  This script sends SMB Negotiation request and try to get the version from the
  response.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("smb_nt.inc");

function smb_neg_prot_smb_1_check( target, port ) {

  local_var target, port, soc, r, neg_prot;

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  r = smb_session_request( soc:soc, remote:target );
  if( ! r ) {
    close( soc );
    return FALSE;
  }

  neg_prot = raw_string( 0x00, 0x00, 0x00, 0xbe,
                         0xff, 0x53, 0x4d, 0x42, 0x72, 0x00, 0x00, 0x00, 0x00,
                         0x08, 0x01, 0xc8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x33,
                         0x0c, 0x00, 0x00, 0x00, 0x00 );

  #Requested Dialects:
  #       Dialect: PC NETWORK PROGRAM 1.0
  #       Dialect: MICROSOFT NETWORKS 1.03
  #       Dialect: MICROSOFT NETWORKS 3.0
  #       Dialect: LANMAN1.0
  #       Dialect: LM1.2X002
  #       Dialect: DOS LANMAN2.1
  #       Dialect: LANMAN2.1
  #       Dialect: Samba
  #       Dialect: NT LANMAN 1.0
  #       Dialect: NT LM 0.12
  neg_prot += raw_string( 0x00, 0x9b, 0x00, 0x02, 0x50, 0x43, 0x20, 0x4e,
                          0x45, 0x54, 0x57, 0x4f, 0x52, 0x4b, 0x20, 0x50,
                          0x52, 0x4f, 0x47, 0x52, 0x41, 0x4d, 0x20, 0x31,
                          0x2e, 0x30, 0x00, 0x02, 0x4d, 0x49, 0x43, 0x52,
                          0x4f, 0x53, 0x4f, 0x46, 0x54, 0x20, 0x4e, 0x45,
                          0x54, 0x57, 0x4f, 0x52, 0x4b, 0x53, 0x20, 0x31,
                          0x2e, 0x30, 0x33, 0x00, 0x02, 0x4d, 0x49, 0x43,
                          0x52, 0x4f, 0x53, 0x4f, 0x46, 0x54, 0x20, 0x4e,
                          0x45, 0x54, 0x57, 0x4f, 0x52, 0x4b, 0x53, 0x20,
                          0x33, 0x2e, 0x30, 0x00, 0x02, 0x4c, 0x41, 0x4e,
                          0x4d, 0x41, 0x4e, 0x31, 0x2e, 0x30, 0x00, 0x02,
                          0x4c, 0x4d, 0x31, 0x2e, 0x32, 0x58, 0x30, 0x30,
                          0x32, 0x00, 0x02, 0x44, 0x4f, 0x53, 0x20, 0x4c,
                          0x41, 0x4e, 0x4d, 0x41, 0x4e, 0x32, 0x2e, 0x31,
                          0x00, 0x02, 0x4c, 0x41, 0x4e, 0x4d, 0x41, 0x4e,
                          0x32, 0x2e, 0x31, 0x00, 0x02, 0x53, 0x61, 0x6d,
                          0x62, 0x61, 0x00, 0x02, 0x4e, 0x54, 0x20, 0x4c,
                          0x41, 0x4e, 0x4d, 0x41, 0x4e, 0x20, 0x31, 0x2e,
                          0x30, 0x00, 0x02, 0x4e, 0x54, 0x20, 0x4c, 0x4d,
                          0x20, 0x30, 0x2e, 0x31, 0x32, 0x00 );

  send( socket:soc, data:neg_prot );
  r = smb_recv( socket:soc );
  close( soc );

  if( strlen( r ) < 38 ) return FALSE;

  if( ord( r[4] ) == 255 ) return TRUE;
}

function smb_neg_prot_smb2_check( target, port ) {

  local_var target, port, soc, r, neg_prot;

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  r = smb_session_request( soc:soc, remote:target );
  if( ! r ) {
    close( soc );
    return FALSE;
  }

  neg_prot = raw_string( 0x00, 0x00, 0x00, 0xd4, 0xff, 0x53, 0x4d, 0x42,
                         0x72, 0x00, 0x00, 0x00, 0x00, 0x08, 0x01, 0xc8,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x33, 0x0c,
                         0x00, 0x00, 0x00, 0x00 );

  #Requested Dialects:
  #Dialect: PC NETWORK PROGRAM 1.0
  #Dialect: MICROSOFT NETWORKS 1.03
  #Dialect: MICROSOFT NETWORKS 3.0
  # Dialect: LANMAN1.0
  # Dialect: LM1.2X002
  # Dialect: DOS LANMAN2.1
  # Dialect: LANMAN2.1
  # Dialect: Samba
  # Dialect: NT LANMAN 1.0
  # Dialect: NT LM 0.12
  # Dialect: SMB 2.002
  # Dialect: SMB 2.???

  neg_prot += raw_string( 0x00, 0xb1, 0x00, 0x02, 0x50, 0x43, 0x20, 0x4e,
                          0x45, 0x54, 0x57, 0x4f, 0x52, 0x4b, 0x20, 0x50,
                          0x52, 0x4f, 0x47, 0x52, 0x41, 0x4d, 0x20, 0x31,
                          0x2e, 0x30, 0x00, 0x02, 0x4d, 0x49, 0x43, 0x52,
                          0x4f, 0x53, 0x4f, 0x46, 0x54, 0x20, 0x4e, 0x45,
                          0x54, 0x57, 0x4f, 0x52, 0x4b, 0x53, 0x20, 0x31,
                          0x2e, 0x30, 0x33, 0x00, 0x02, 0x4d, 0x49, 0x43,
                          0x52, 0x4f, 0x53, 0x4f, 0x46, 0x54, 0x20, 0x4e,
                          0x45, 0x54, 0x57, 0x4f, 0x52, 0x4b, 0x53, 0x20,
                          0x33, 0x2e, 0x30, 0x00, 0x02, 0x4c, 0x41, 0x4e,
                          0x4d, 0x41, 0x4e, 0x31, 0x2e, 0x30, 0x00, 0x02,
                          0x4c, 0x4d, 0x31, 0x2e, 0x32, 0x58, 0x30, 0x30,
                          0x32, 0x00, 0x02, 0x44, 0x4f, 0x53, 0x20, 0x4c,
                          0x41, 0x4e, 0x4d, 0x41, 0x4e, 0x32, 0x2e, 0x31,
                          0x00, 0x02, 0x4c, 0x41, 0x4e, 0x4d, 0x41, 0x4e,
                          0x32, 0x2e, 0x31, 0x00, 0x02, 0x53, 0x61, 0x6d,
                          0x62, 0x61, 0x00, 0x02, 0x4e, 0x54, 0x20, 0x4c,
                          0x41, 0x4e, 0x4d, 0x41, 0x4e, 0x20, 0x31, 0x2e,
                          0x30, 0x00, 0x02, 0x4e, 0x54, 0x20, 0x4c, 0x4d,
                          0x20, 0x30, 0x2e, 0x31, 0x32, 0x00, 0x02, 0x53,
                          0x4d, 0x42, 0x20, 0x32, 0x2e, 0x30, 0x30, 0x32,
                          0x00, 0x02, 0x53, 0x4d, 0x42, 0x20, 0x32, 0x2e,
                          0x3f, 0x3f, 0x3f, 0x00 );

  send( socket:soc, data:neg_prot );
  r = smb_recv( socket:soc );
  close( soc );

  if( strlen( r ) < 38 ) return FALSE;

  if( ord( r[4] ) == 254 ) return TRUE;
}

function smb_neg_prot_smb_2_3_check( target, port ) {

  local_var target, port, soc, r, neg_prot;

  soc = open_sock_tcp( port );
  if( ! soc ) return FALSE;

  r = smb_session_request( soc:soc, remote:target );
  if( ! r ) {
    close( soc );
    return FALSE;
  }

  neg_prot = raw_string( 0x00, 0x00, 0x00, 0xb6, 0xfe, 0x53, 0x4d, 0x42,
                         0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x08, 0x00,
                         0x01, 0x00, 0x00, 0x00, 0x7f, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                         0x02, 0x02, 0x10, 0x02, 0x22, 0x02, 0x24, 0x02,
                         0x00, 0x03, 0x02, 0x03, 0x10, 0x03, 0x11, 0x03,
                         0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x26, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x20, 0x00,
                         0x01, 0x00, 0x62, 0x40, 0xfa, 0x92, 0x5d, 0x9c,
                         0xfe, 0x83, 0x35, 0x05, 0x92, 0x0d, 0x8c, 0x3f,
                         0xcb, 0xb7, 0x8f, 0xd3, 0x9c, 0xce, 0xb7, 0x86,
                         0xbb, 0x63, 0x2e, 0x74, 0xc8, 0x64, 0xd7, 0x69,
                         0x7c, 0x94, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00,
                         0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00,
                         0x02, 0x00 );

   #Requested Dialects:
   #Dialect 0x0202
   #Dialect 0x0210
   #Dialect 0x0222
   #Dialect 0x0224
   #Dialect 0x0300
   #Dialect 0x0302
   #Dialect 0x0310
   #Dialect 0x0311

   send( socket:soc, data:neg_prot );
   r = smb_recv( socket:soc );
   close( soc );

   if( strlen( r ) < 74 ) return FALSE;

   if( ord( r[73] ) == 3 ) return TRUE;
}

port = kb_smb_transport();
if( ! port ) port = 139;
if( ! get_port_state( port ) ) exit( 0 );

name = kb_smb_name();
if( ! name ) name = "*SMBSERVER";

smb1_support = smb_neg_prot_smb_1_check( target:name, port:port );
if( smb1_support ) {
  set_kb_item( name:"smb_v1/supported", value:TRUE );
  set_kb_item( name:"smb_v1/" + port + "/supported", value:TRUE );
}

smb2_support = smb_neg_prot_smb2_check( target:name, port:port );
if( smb2_support ) {
  set_kb_item( name:"smb_v2/supported", value:TRUE );
  set_kb_item( name:"smb_v2/" + port + "/supported", value:TRUE );
}

smb3_support = smb_neg_prot_smb_2_3_check( target:name, port:port );
if( smb3_support ) {
  set_kb_item( name:"smb_v3/supported", value:TRUE );
  set_kb_item( name:"smb_v3/" + port + "/supported", value:TRUE );
}

if( smb1_support && smb2_support && smb3_support ) {
  report = "SMBv1, SMBv2 and SMBv3 are enabled on remote target";
}
else if( smb2_support && smb3_support && ! smb1_support ) {
  report = "SMBv2 and SMBv3 are enabled on remote target";
}
else if( smb1_support && smb2_support && ! smb3_support ) {
  report = "SMBv1 and SMBv2 are enabled on remote target";
}
else if( smb1_support && smb3_support && ! smb2_support ) {
  report = "SMBv1 and SMBv3 are enabled on remote target";
}
else if( smb1_support && ! smb2_support && ! smb3_support ) {
  report = "Only SMBv1 is enabled on remote target";
}
else if( smb2_support && ! smb1_support && ! smb3_support ) {
  report = "Only SMBv2 is enabled on remote target";
}
else if( smb3_support && ! smb1_support && ! smb2_support ) {
  report = "Only SMBv3 is enabled on remote target";
}
else if( ! smb1_support && ! smb2_support && ! smb3_support ) {
  report = "SMB Protocol not enabled on remote target";
}

if( report && strlen( report ) ) {
  log_message( port:port, data:report );
}

exit( 0 );
