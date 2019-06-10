###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_WMI_IIS_RDS.nasl 10949 2018-08-14 09:36:21Z emoss $
#
# Remote Data Service on InternetInformationServer (Windows)
#
# Authors:
# Thomas Rotter <T.Rotter@dn-systems.de>
#
# Copyright:
# Copyright (c) 2010 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.96003");
  script_version("$Revision: 10949 $");
  script_tag(name:"last_modification", value:"$Date: 2018-08-14 11:36:21 +0200 (Tue, 14 Aug 2018) $");
  script_tag(name:"creation_date", value:"2010-04-27 10:02:59 +0200 (Tue, 27 Apr 2010)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"qod_type", value:"registry");
  script_name("Remote Data Service on InternetInformationServer (Windows)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2010 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_mandatory_keys("Compliance/Launch/GSHB", "Tools/Present/wmi");
  script_dependencies("smb_reg_service_pack.nasl", "GSHB/GSHB_WMI_OSInfo.nasl");

  script_tag(name:"summary", value:"The script detects if Remote Data Service installed on InternetInformationServer.");

  exit(0);
}

include("smb_nt.inc");

host    = get_host_ip();
usrname = kb_smb_login();
domain  = kb_smb_domain();
if (domain){
  usrname = domain + '\\' + usrname;
}
passwd = kb_smb_password();

OSVER = get_kb_item("WMI/WMI_OSVER");
OSTYPE = get_kb_item("WMI/WMI_OSTYPE");

if(!OSVER || OSVER >< "none"){
  set_kb_item(name:"WMI/RDSServer/log", value:"No access to SMB host.\nFirewall is activated or there is not a Windows system.");
  set_kb_item(name:"WMI/RDSServer.DataFactory", value:"error");
  set_kb_item(name:"WMI/AdvancedDataFactory", value:"error");
  set_kb_item(name:"WMI/VbBusObj.VbBusObjCls", value:"error");
  exit(0);
}

handle = wmi_connect_reg(host:host, username:usrname, password:passwd);

if(!handle){
  set_kb_item(name:"WMI/RDSServer/log", value:"wmi_connect: WMI Connect failed.");
  set_kb_item(name:"WMI/RDSServer.DataFactory", value:"error");
  set_kb_item(name:"WMI/AdvancedDataFactory", value:"error");
  set_kb_item(name:"WMI/VbBusObj.VbBusObjCls", value:"error");
  wmi_close(wmi_handle:handle);
  exit(0);
}

IISVer = wmi_reg_get_dword_val(wmi_handle:handle, key:"SOFTWARE\Microsoft\InetStp", val_name:"MajorVersion");

if (!IISVer){
  set_kb_item(name:"WMI/RDSServer/log", value:"IT-Grundschutz; No IIS installed!");
  set_kb_item(name:"WMI/RDSServer.DataFactory", value:"off");
  set_kb_item(name:"WMI/AdvancedDataFactory", value:"off");
  set_kb_item(name:"WMI/VbBusObj.VbBusObjCls", value:"off");
  log_message(port:0, proto: "IT-Grundschutz", data:"No IIS installed!");
  wmi_close(wmi_handle:handle);
  exit(0);
}

W2SVCPAR = wmi_reg_enum_key(wmi_handle:handle, key:"SYSTEM\CurrentControlSet\Services\W3SVC\Parameters\ADCLaunch");

if("RDSServer.DataFactory" >!< W2SVCPAR) set_kb_item(name:"WMI/RDSServer.DataFactory", value:"off");
else set_kb_item(name:"WMI/RDSServer.DataFactory", value:"on");

if("AdvancedDataFactory" >!< W2SVCPAR) set_kb_item(name:"WMI/AdvancedDataFactory", value:"off");
else set_kb_item(name:"WMI/AdvancedDataFactory", value:"on");

if("VbBusObj.VbBusObjCls" >!< W2SVCPAR) set_kb_item(name:"WMI/VbBusObj.VbBusObjCls", value:"off");
else set_kb_item(name:"WMI/VbBusObj.VbBusObjCls", value:"on");

wmi_close(wmi_handle:handle);

exit(0);
