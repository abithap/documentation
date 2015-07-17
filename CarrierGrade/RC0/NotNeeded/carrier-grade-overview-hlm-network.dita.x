<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic
  PUBLIC "-//OASIS//DTD DITA Topic//EN" "http://docs.oasis-open.org/dita/v1.1/OS/dtd/topic.dtd" ><topic xml:lang="en-us" id="topic6490">
<title>HP Helion <tm tmtype="reg">OpenStack</tm> Carrier Grade 1.1: Helion Lifecycle Management (HLM) Network Topology</title>
<prolog>
<metadata>
<othermeta name="layout" content="default"/>
</metadata>
</prolog>
<body>
<p>
<!--UNDER REVISION-->
 <!--./CarrierGrade/Overview/carrier-grade-overview-hlm-network.md-->
 <!--permalink: /helion/openstack/carrier/hlm/network/--></p>
<!-- From https://rndwiki2.atlanta.hp.com/confluence/display/cloudos/Kenobi+Networking -->
<p>Kenobi allows for the flexible configuration of networks for the cloud to fit with the actual configuration of a data center. This helps to accomodate customer preferences and existing installations of equipment. HP will provide a recommendation for how a customer should wire their data center to support clouds.</p>
<p>The networks defined below are traffic groups. Network traffic groups are mapped to physical networking infrastructure as follows:</p>
<p>1 or more network traffic groups are carried over a logical network. 1 or more logical networks are carried over a network interface. A network interface may be bonded or single.
Definitions
Network Traffic Group</p>
<p>Kenobi defines a set of network traffic groups that are used by cloud services to connect to each other. A given service is expected to connect to one or more network traffic group in order to be accessed from outside the node on which it is running. A given deployment of a cloud may map multiple traffic groups to the same logical network (VLAN), or may assign each traffic group to its own network interface depending upon how the customer wants to deploy the cloud. Kenobi specifies which network traffic groups each service will connect to. The mapping of all services running on a node to logical networks and interfaces will result in the total set of interfaces a node needs to have.
Logical Network</p>
<p>VLANs are currently used to divide physical networks so that multiple traffic streams can share the same physical network. Kenobi supports having multiple logical networks running on one network interface. It is the customer's responsibility to configure switches properly to route logical networks to the nodes that need to receive them. The set of logical networks hosted by one physical network connect to nodes with a network interface.
Network Interface</p>
<p>The network interface is the connection to a physical network infrastructure, whether it be a bonded network with replicated switches or a single network. Kenobi can map a logical network interface to either a single device (e.g. eth0) or to a bonded device (e.g. bond0). Kenobi can configure the bonding if that is desired by the customer.
Example Network Configuration</p>
<section id="KenobiNetworking-CustomerSupplied"> <title>Customer Supplied</title>
<table outputclass="confluenceTable">
<tgroup cols="3">
          <colspec colname="col1" colsep="1" rowsep="1"/>
          <colspec colname="col2" colsep="1" rowsep="1"/>
          <colspec colname="col3" colsep="1" rowsep="1"/>
          <tbody>
            <row>
              <entry outputclass="confluenceTd">IPMI/ILO</entry>
              <entry outputclass="confluenceTd">CTL</entry>
              <entry outputclass="confluenceTd">Required - Used by node provisioning software to
                start and stop nodes. This network is not used by the cloud after node
                provisioning.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">PXE Boot</entry>
              <entry outputclass="confluenceTd">PXE</entry>
              <entry outputclass="confluenceTd">Required - Used for PXE booting images consisting of
                operating system and local package repository. This network is not used by the cloud
                after node provisioning.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Data Center Management</entry>
              <entry outputclass="confluenceTd">DCM</entry>
              <entry outputclass="confluenceTd">
                <p>Optional: Existing data center network for monitoring (SNMP), SDN control of
                  switch configuration, etc. Helion will also use this network to connect to vCenter
                  when the vCenter hypervisor is configured.</p>
                <p>
                  <!--Original: <span @class=>--><ph>Bryan: CS has combined their DCM with CLM.
                    Should Kenobi go back to naming this the ESX network?</ph>
                </p>
              </entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Fibre Channel SAN</entry>
              <entry outputclass="confluenceTd">SAN</entry>
              <entry outputclass="confluenceTd">Optional: Fibre Channel for storage devices (3PAR,
                etc)</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Consumer Access</entry>
              <entry outputclass="confluenceTd">CAN</entry>
              <entry outputclass="confluenceTd">Optional: External network to make service APIs
                available - assumes routing of external tagged network to untagged consumer network.
                Customer controls the addressing. Kenobi is told the network CIDR and starting
                address available for use. It is expected that addresses are needed only for the
                service VIPs on this network.</entry>
            </row>
            <row>
              <entry namest="col1" nameend="col1" outputclass="confluenceTd">Admin Access</entry>
              <entry namest="col2" nameend="col2" outputclass="confluenceTd">AAN </entry>
              <entry namest="col3" nameend="col3" outputclass="confluenceTd">Optional: Network
                within the data center to which admins will connect. The Keystone service catalog
                will use this network for the 'admin' entry for all services.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">External</entry>
              <entry outputclass="confluenceTd">EXT</entry>
              <entry outputclass="confluenceTd">Optional: assumes routing of external tagged network
                to untagged consumer network</entry>
            </row>
          </tbody>
        </tgroup>
</table>
<p> </p>
</section>
<section id="KenobiNetworking-CloudManaged"> <title>Cloud Managed</title>
<table outputclass="confluenceTable">
<tgroup cols="3">
          <colspec colname="col1" colsep="1" rowsep="1"/>
          <colspec colname="col2" colsep="1" rowsep="1"/>
          <colspec colname="col3" colsep="1" rowsep="1"/>
          <tbody>
            <row>
              <entry outputclass="confluenceTd">Cloud Management</entry>
              <entry outputclass="confluenceTd">CLM</entry>
              <entry outputclass="confluenceTd">Main internal cloud network with fixed IP addresses.
                This network is available to all nodes in the cloud. It is used to access Keystone
                and Glance. It is also used for request routing (e.g. haproxy to stunnel), HA
                heartbeats, and other control plane management traffic for the Cloud Control Plane.
                Other control planes will have their own "control plane" network.</entry>
            </row>
            <row>
              <entry namest="col1" nameend="col1" outputclass="confluenceTd">Storage
                Management</entry>
              <entry namest="col2" nameend="col2" outputclass="confluenceTd">STM</entry>
              <entry namest="col3" nameend="col3" outputclass="confluenceTd">Network used for
                traffic from the load balancer to the Swift proxy nodes in a Storage Control
                Plane.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Object Store</entry>
              <entry outputclass="confluenceTd">OBS</entry>
              <entry outputclass="confluenceTd">Swift will be configured to use this fixed address
                network for proxy to object traffic and for replication, rebalancing, and other
                internal Swift traffic. Ceph will also use this network for internal traffic pending
                review of Ceph architecture.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Block Store</entry>
              <entry outputclass="confluenceTd">BLS</entry>
              <entry outputclass="confluenceTd">Compute nodes use this fixed address network to
                connect to block storage volumes for VMs. Other block storage traffic (e.g.
                snapshots) should also use this network.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Tenant Underlay</entry>
              <entry outputclass="confluenceTd">TUL</entry>
              <entry outputclass="confluenceTd">Network used for VM data traffic - both VM on one
                node to VM on another node, and VM to outside world. Neutron manages the IP
                addresses on this network. It is usually configured to support VxLAN.</entry>
            </row>
            <row>
              <entry namest="col1" nameend="col1" outputclass="confluenceTd">Tenant VLAN</entry>
              <entry namest="col2" nameend="col2" outputclass="confluenceTd">TVL</entry>
              <entry namest="col3" nameend="col3" outputclass="confluenceTd">An array of VLANs to
                support tenant VLAN segmentation. Neutron manages IP addresses on this network.
                VLANs need to span an L2 network.</entry>
            </row>
            <row>
              <entry outputclass="confluenceTd">Service</entry>
              <entry outputclass="confluenceTd">SVC</entry>
              <entry outputclass="confluenceTd">Cloud workload integration to logging, monitoring,
                and infrastructure service (i.e. LDAP, NTP, etc).</entry>
            </row>
            <row>
              <entry namest="col1" nameend="col1" outputclass="confluenceTd">Monitoring</entry>
              <entry namest="col2" nameend="col2" outputclass="confluenceTd">MON</entry>
              <entry namest="col3" nameend="col3" outputclass="confluenceTd">Traffic for the
                monitoring solution will be carried on this network.</entry>
            </row>
            <row>
              <entry namest="col1" nameend="col1" outputclass="confluenceTd">Replication</entry>
              <entry namest="col2" nameend="col2" outputclass="confluenceTd">REP</entry>
              <entry namest="col3" nameend="col3" outputclass="confluenceTd">Replication network.
                One use will be to support Swift replication.</entry>
            </row>
          </tbody>
        </tgroup>
</table>
<p> </p>
<p>
  <xref type="section" href="#topic6490"> Return to Top </xref>
</p>
<!-- ===================== horizontal rule ===================== -->
</section>
</body>
</topic>
